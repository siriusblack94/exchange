package com.blockeng.gathering.task;

import com.blockeng.gathering.service.TimingCleanDataService;
import com.blockeng.gathering.util.DateUtil;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@Component
public class TimingCleanDataTask {

    @Autowired
    private TimingCleanDataService timingCleanDataService;
    /**
     * 每天零点执行 删除同步表中两天前的同步数据
     * */
    @Scheduled(cron = "0 0 0 * * ?")
    public void executeCleanDataTask(){

        //获取两天之前0点的数据
        Date date=DateUtil.getTodayZeroTimeBeforeNDay(2);
        timingCleanDataService.cleanDataOutOfDate(date);
    }
}
