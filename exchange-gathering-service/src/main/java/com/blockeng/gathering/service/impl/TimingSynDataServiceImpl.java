package com.blockeng.gathering.service.impl;

import com.blockeng.gathering.entity.CashRecharge;
import com.blockeng.gathering.entity.CashRechargeSyn;
import com.blockeng.gathering.mapper.exdb.EXCashRechargeMapper;
import com.blockeng.gathering.mapper.my18.My18CashRechargeSynMapper;
import com.blockeng.gathering.service.TimingSynDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.*;


/**
 * 定时同步服务接口实现
 * */
@Service
public class TimingSynDataServiceImpl implements TimingSynDataService {

    @Autowired
    private My18CashRechargeSynMapper my18CashRechargeSynMapper;
    @Autowired
    private EXCashRechargeMapper exCashRechargeMapper;
    @Value("${plate.id}")
    private String platformId;

    @Override
    public void synOrderInfo() {

        //线上表待同步的订单信息列表
        List<CashRecharge> cashRechargeList=new ArrayList<CashRecharge>();

        CashRechargeSyn cashRechargeSyn=my18CashRechargeSynMapper.getMaxTimeData(platformId);

        if(cashRechargeSyn==null){
            //如果同步表里没有数据 直接同步当前所有线上库中所有未确认审核订单信息
            cashRechargeList=exCashRechargeMapper.getOrderInfoByStartTime(null);
        }else{
            //如果存在最新时间的充值订单数据,则同步同步表最新时间之后的信息
            Date startTime=cashRechargeSyn.getCreated();
            cashRechargeList=exCashRechargeMapper.getOrderInfoByStartTime(startTime);
        }

        if (cashRechargeList!=null&&cashRechargeList.size()>0){
            List<CashRechargeSyn> cashRechargeSynList=convertCashRechargeEntity(cashRechargeList,platformId);
            my18CashRechargeSynMapper.synOrderInfo(cashRechargeSynList);
        }

    }

    public List<CashRechargeSyn> convertCashRechargeEntity(List<CashRecharge> cashRechargeList,String platformId){

        List<CashRechargeSyn> cashRechargeSynList=new ArrayList<CashRechargeSyn>();
        for(CashRecharge cashRecharge:cashRechargeList){
            CashRechargeSyn cashRechargeSyn=new CashRechargeSyn();
            //构建订单ID + 3位 平台ID
            cashRechargeSyn.setOrderId(cashRecharge.getOrderId()+""+platformId);
            cashRechargeSyn.setPlateformId(platformId);
            cashRechargeSyn.setRemark(cashRecharge.getRemark()+platformId);
            cashRechargeSyn.setCreated(cashRecharge.getCreated());
            cashRechargeSynList.add(cashRechargeSyn);
        }
         return cashRechargeSynList;
    }
}
