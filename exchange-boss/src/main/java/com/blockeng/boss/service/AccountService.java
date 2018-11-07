package com.blockeng.boss.service;

import com.blockeng.framework.enums.BusinessType;

import java.math.BigDecimal;

/**
 * @Description: 资金结算
 * @Author: Chen Long
 * @Date: Created in 2018/7/10 上午12:09
 * @Modified by: Chen Long
 */
public interface AccountService {

    /**
     * 资金转移
     *
     * @param fromUserId     转出账户
     * @param toUserId       转入账户
     * @param coinId         币种
     * @param amount         金额
     * @param buyFee         手续费
     * @param sellFee        手续费
     * @param returnAmount   成交解冻
     * @param subtractAmount 扣减资金 = amount + buyFee + returnAmount
     * @param businessType   业务类型
     * @param orderId        关联订单号
     */
    boolean transferBuyAmount(Long fromUserId,
                              Long toUserId,
                              Long coinId,
                              BigDecimal amount,
                              BigDecimal buyFee,
                              BigDecimal sellFee,
                              BigDecimal returnAmount,
                              BigDecimal subtractAmount,
                              BusinessType businessType,
                              Long orderId);

    /**
     * 资金转移
     *
     * @param fromUserId   转出账户
     * @param toUserId     转入账户
     * @param coinId       币种
     * @param amount       金额
     * @param businessType 业务类型
     * @param orderId      关联订单号
     */
    boolean transferSellAmount(Long fromUserId,
                               Long toUserId,
                               Long coinId,
                               BigDecimal amount,
                               BusinessType businessType,
                               Long orderId);
}
