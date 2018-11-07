package com.blockeng.service;

/**
 * @Description: 奖励（注册奖励、邀请奖励）
 * @Author: Chen Long
 * @Date: Created in 2018/5/25 下午4:47
 * @Modified by: Chen Long
 */
public interface RewardService {

    /**
     * 注册奖励
     *
     * @param userId 用户ID
     */
    boolean registerReward(Long userId);

    /**
     * 邀请奖励
     *
     * @param userId 用户ID
     */
    boolean inviteReward(Long userId);
}
