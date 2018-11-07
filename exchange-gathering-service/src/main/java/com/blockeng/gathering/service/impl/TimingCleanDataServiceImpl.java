package com.blockeng.gathering.service.impl;

import com.blockeng.gathering.mapper.my18.My18CashRechargeSynMapper;
import com.blockeng.gathering.service.TimingCleanDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class TimingCleanDataServiceImpl implements TimingCleanDataService {

    @Autowired
    private My18CashRechargeSynMapper my18CashRechargeSynMapper;

    @Override
    public void cleanDataOutOfDate(Date date) {
        my18CashRechargeSynMapper.cleanDataOutOfDate(date);
    }
}
