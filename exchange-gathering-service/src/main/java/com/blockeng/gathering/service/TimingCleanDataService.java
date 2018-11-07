package com.blockeng.gathering.service;

import java.util.Date;

public interface TimingCleanDataService {

    /**
     * 定时清理审核过的数据
     * */
    public void cleanDataOutOfDate(Date date);

}
