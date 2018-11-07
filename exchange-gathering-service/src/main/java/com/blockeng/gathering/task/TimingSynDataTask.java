package com.blockeng.gathering.task;

import com.blockeng.gathering.service.TimingSynDataService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Data
@Component
public class TimingSynDataTask {

    @Autowired
    private TimingSynDataService timingSynDataService;
    /**
     * 每30秒一次 拉去线上充值订单表信息
     * */
    @Scheduled(cron = " 0/30 * * * * ?")
    public void executeSynDataTask(){
        timingSynDataService.synOrderInfo();
    }
}
