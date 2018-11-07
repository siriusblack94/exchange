package com.blockeng.gathering.mapper.exdb;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.blockeng.gathering.entity.CashRecharge;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface EXCashRechargeMapper extends BaseMapper {

    /**
     * 定时获取同步订单信息必要信息 订单ID,参考号
     * */
    public List<CashRecharge> getOrderInfoByStartTime(@Param("startTime") Date date);

    public List<CashRecharge> getOrderInfoByTimeQuantum(@Param("startTime") Date startTime,@Param("endTime") Date endTime,@Param("platformId") String platformId);

}
