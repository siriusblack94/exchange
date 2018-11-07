package com.blockeng.boss.service.impl;

import com.blockeng.boss.dto.DealOrder;
import com.blockeng.boss.dto.DealOrderMapperDTO;
import com.blockeng.boss.dto.Symbol;
import com.blockeng.boss.entity.TurnoverOrder;
import com.blockeng.boss.mapper.BossMapper;
import com.blockeng.boss.service.AccountService;
import com.blockeng.boss.service.BossService;
import com.blockeng.boss.service.SymbolService;
import com.blockeng.framework.enums.BusinessType;
import com.blockeng.framework.enums.OrderStatus;
import com.blockeng.framework.enums.OrderType;
import com.blockeng.framework.exception.ExchangeException;
import com.blockeng.framework.utils.GsonUtil;
import com.google.common.util.concurrent.ListenableFuture;
import com.google.common.util.concurrent.ListeningExecutorService;
import com.google.common.util.concurrent.MoreExecutors;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @Description:
 * @Author: Chen Long
 * @Date: Created in 2018/7/10 上午12:09
 * @Modified by: Chen Long
 */
@Service
@Slf4j
public class BossServiceImpl implements BossService {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Autowired
    private BossMapper bossMapper;

    @Autowired
    private SymbolService symbolService;

    @Autowired
    private AccountService accountService;

    private ExecutorService executor = new ThreadPoolExecutor(
            100,
            Integer.MAX_VALUE,
            0, TimeUnit.MILLISECONDS,
            new LinkedBlockingQueue<>(1024),
            new ThreadPoolExecutor.CallerRunsPolicy());

    private ListeningExecutorService service = MoreExecutors.listeningDecorator(executor);

    /**
     * 资金结算
     *
     * @param dealOrder
     */
    @Override
    @Transactional
    public boolean settlement(DealOrder dealOrder) {
        try {
            // 成交数量
            BigDecimal volume = dealOrder.getVol();
            // 成交价
            BigDecimal price = dealOrder.getPrice();
            // 买单委托价
            BigDecimal buyPrice = dealOrder.getBuyPrice();
            // 成交金额 = 成交量 * 成交价
            BigDecimal amount = volume.multiply(price);
            // 买入手续费 = 成交金额 * 买入手续费比例
            BigDecimal buyFee = amount.multiply(dealOrder.getBuyFeeRate());
            // 因为冻结是按委托价格冻结，成交价不一定是委托价，因此需要返还一部分
            // 返还金额 = （买单委托价-成交价) * 成交数量 * （1 + 买单手续费）
            BigDecimal returnAmount = buyPrice.subtract(price)
                    .multiply(volume)
                    .multiply(BigDecimal.ONE.add(dealOrder.getBuyFeeRate()));
            // 卖出手续费 = 成交金额 * 交易市场配置的卖出手续费率
            BigDecimal sellerFee = amount.multiply(dealOrder.getSellFeeRate());
            // 扣减资金
            BigDecimal subtractAmount = buyPrice.multiply(volume).multiply(BigDecimal.ONE.add(dealOrder.getBuyFeeRate()));

            if (dealOrder.getBuyCoinId() == null || dealOrder.getSellCoinId() == null) {
                Symbol market = symbolService.queryById(dealOrder.getMarketId());
                dealOrder.setBuyCoinId(market.getBuyCoinId());
                dealOrder.setSellCoinId(market.getSellCoinId());
            }
            // 成交订单
            TurnoverOrder turnoverOrder = DealOrderMapperDTO.INSTANCE.from(dealOrder);
            if (dealOrder.getTradeType() == 1) {
                turnoverOrder.setOrderId(dealOrder.getBuyOrderId());    // 成交订单号
            } else {
                turnoverOrder.setOrderId(dealOrder.getSellOrderId());   // 成交订单号
            }
            turnoverOrder
                    .setDealBuyFee(buyFee)                          // 成交买单手续费
                    .setDealBuyFeeRate(dealOrder.getBuyFeeRate())   // 成交买单手续费率
                    .setDealSellFee(sellerFee)                      // 成交卖单手续费
                    .setDealSellFeeRate(dealOrder.getSellFeeRate()) // 成交卖单手续费率
                    .setVolume(volume)                              // 成交数量
                    .setPrice(price)                                // 成交价格
                    .setAmount(amount)                              // 成交金额
                    .setStatus(OrderStatus.DEAL.getCode());         // 成交状态
            // 创建成交单记录
            bossMapper.saveDealOrder(turnoverOrder);
            //System.out.println("system.out----" + GsonUtil.toJson(turnoverOrder));
            //log.error("--12345--error--" + GsonUtil.toJson(turnoverOrder));
            //log.info("--12345--info-" + GsonUtil.toJson(turnoverOrder));
            rabbitTemplate.convertAndSend("calc.account.tx.sum", GsonUtil.toJson(turnoverOrder));
            this.modifyEntrustOrder(dealOrder.getBuyOrderId(), volume, OrderType.BUY);
            this.modifyEntrustOrder(dealOrder.getSellOrderId(), volume, OrderType.SELL);
            // 更新买单用户账户余额
            ListenableFuture<Boolean> updateBuyAccountTask = service.submit(() -> {
                boolean result = accountService.transferBuyAmount(dealOrder.getBuyUserId(),     // 买单用户ID
                        dealOrder.getSellUserId(),                          // 卖单用户ID
                        dealOrder.getBuyCoinId(),                           // 买单支付币种
                        amount,                                         // 买单成交金额
                        buyFee,                                         // 买单手续费
                        sellerFee,                                      // 卖单手续费
                        returnAmount,                                   // 成交解冻
                        subtractAmount,                                 // 扣减资金
                        BusinessType.TRADE_DEAL,                        // 业务类型：币币交易撮合成交
                        turnoverOrder.getId());                         // 成交订单ID
                return result;
            });
            updateBuyAccountTask.addListener(() -> {
                try {
                    updateBuyAccountTask.get();
                } catch (Exception e) {
                    throw new ExchangeException("撮合完成：更新买单资金账户异常" + e.getMessage());
                }
            }, service);
            // 更新卖单用户账户余额
            ListenableFuture<Boolean> updateSellAccountTask = service.submit(() -> {
                boolean result = accountService.transferSellAmount(dealOrder.getSellUserId(),    // 卖单用户ID
                        dealOrder.getBuyUserId(),                           // 买单用户ID
                        dealOrder.getSellCoinId(),                          // 卖单支付币种
                        volume,                                         // 卖单成交数量
                        BusinessType.TRADE_DEAL,                        // 业务类型：币币交易撮合成交
                        turnoverOrder.getId());                         // 成交订单ID
                return result;
            });
            updateSellAccountTask.addListener(() -> {
                try {
                    updateSellAccountTask.get();
                } catch (Exception e) {
                    throw new ExchangeException("撮合完成：更新卖单资金账户异常" + e.getMessage());
                }
            }, service);
            return true;
        } catch (Exception e) {
            throw new ExchangeException("资金清算异常" + e.getMessage());
        }
    }

    /**
     * 修改委托订单状态
     *
     * @param orderId    订单ID
     * @param dealVolume 成交量
     * @param orderType  订单买卖类型
     * @return
     */
    public boolean modifyEntrustOrder(Long orderId, BigDecimal dealVolume, OrderType orderType) {
        if (orderType == OrderType.BUY) {
            return bossMapper.modifyEntrustBuyOrder(orderId, dealVolume) > 0;
        }
        return bossMapper.modifyEntrustSellOrder(orderId, dealVolume) > 0;
    }
}
