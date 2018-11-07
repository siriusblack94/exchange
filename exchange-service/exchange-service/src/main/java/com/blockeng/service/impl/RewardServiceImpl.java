package com.blockeng.service.impl;

import com.blockeng.framework.enums.BusinessType;
import com.blockeng.framework.enums.SwitchConfig;
import com.blockeng.service.AccountService;
import com.blockeng.service.ConfigService;
import com.blockeng.service.RewardService;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.util.Map;

/**
 * @Description: 奖励（注册奖励、邀请奖励）
 * @Author: Chen Long
 * @Date: Created in 2018/5/25 下午4:49
 * @Modified by: Chen Long
 */
@Service
@Slf4j
public class RewardServiceImpl implements RewardService {

    // 注册奖励配置
    private static final String REGISTER_REWARD = "REGISTER_REWARD";
    private static final String REGISTER_REWARD_SWITCH = "SWITCH";
    private static final String REGISTER_REWARD_COIN_ID = "COIN_ID";
    private static final String REGISTER_REWARD_AMOUNT = "AMOUNT";
    private static final String REGISTER_REWARD_START_TIME = "START_TIME";
    private static final String REGISTER_REWARD_END_TIME = "END_TIME";

    // 邀请奖励配置
    private static final String INVITE_REWARD = "INVITE_REWARD";
    private static final String INVITE_REWARD_SWITCH = "SWITCH";
    private static final String INVITE_REWARD_COIN_ID = "COIN_ID";
    private static final String INVITE_REWARD_AMOUNT = "AMOUNT";
    private static final String INVITE_REWARD_START_TIME = "START_TIME";
    private static final String INVITE_REWARD_END_TIME = "END_TIME";

    @Autowired
    private ConfigService configService;

    @Autowired
    private AccountService accountService;

    /**
     * 注册奖励
     *
     * @param userId 用户ID
     * @return
     */
    @Override
    public boolean registerReward(Long userId) {
        try {
            if (userId <= 0L) {
                log.error("用户ID错误");
                return false;
            }
            Map<String, String> config = configService.queryByType(REGISTER_REWARD);
            if (CollectionUtils.isEmpty(config)) {
                log.error("注册奖励配置规则为空");
                return false;
            }
            String rewardSwitch = config.get(REGISTER_REWARD_SWITCH);
            if (!SwitchConfig.ON.getCode().equals(rewardSwitch)) {
                log.error("未开放注册奖励");
                return false;
            }
            String startTime = config.get(REGISTER_REWARD_START_TIME);
            String endTime = config.get(REGISTER_REWARD_END_TIME);
            DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
            //时间解析
            DateTime start = DateTime.parse(startTime, format);
            //时间解析
            DateTime end = DateTime.parse(endTime, format);
            DateTime current = new DateTime();
            if (current.isBefore(start) || current.isAfter(end)) {
                log.error("不在奖励时间范围内");
                return false;
            }
            Long coinId = Long.parseLong(config.get(REGISTER_REWARD_COIN_ID));
            BigDecimal amount = new BigDecimal(config.get(REGISTER_REWARD_AMOUNT));
            return accountService.addAmount(userId, coinId, amount, BusinessType.REGISTER_REWARD, BusinessType.REGISTER_REWARD.getDesc(), 0);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 邀请奖励
     *
     * @param userId 用户ID
     * @return
     */
    @Override
    public boolean inviteReward(Long userId) {
        try {
            if (userId <= 0L) {
                log.error("用户ID错误");
                return false;
            }
            Map<String, String> config = configService.queryByType(INVITE_REWARD);
            if (CollectionUtils.isEmpty(config)) {
                log.error("邀请奖励配置规则为空");
                return false;
            }
            String rewardSwitch = config.get(INVITE_REWARD_SWITCH);
            if (!SwitchConfig.ON.getCode().equals(rewardSwitch)) {
                log.error("未开放邀请奖励");
                return false;
            }
            String startTime = config.get(INVITE_REWARD_START_TIME);
            String endTime = config.get(INVITE_REWARD_END_TIME);
            DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
            //时间解析
            DateTime start = DateTime.parse(startTime, format);
            //时间解析
            DateTime end = DateTime.parse(endTime, format);
            DateTime current = new DateTime();
            if (current.isBefore(start) || current.isAfter(end)) {
                log.error("不在奖励时间范围内");
                return false;
            }
            Long coinId = Long.parseLong(config.get(INVITE_REWARD_COIN_ID));
            BigDecimal amount = new BigDecimal(config.get(INVITE_REWARD_AMOUNT));
            return accountService.addAmount(userId, coinId, amount, BusinessType.INVITE_REWARD, BusinessType.INVITE_REWARD.getDesc(), 0);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
