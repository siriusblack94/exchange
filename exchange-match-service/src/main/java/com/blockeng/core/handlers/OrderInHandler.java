package com.blockeng.core.handlers;

import com.blockeng.data.MatchData;
import com.blockeng.model.Order;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author qiang
 */
@Component
@Slf4j
public class OrderInHandler {

    /**
     * 委托订单入队列
     *
     * @param payload
     */
    public static AtomicInteger size = new AtomicInteger(0);

    @RabbitListener(queues = "order.in", concurrency = "24")
    public void in(String payload) {
        size.getAndIncrement();
        Order orderVo = new Gson().fromJson(payload, Order.class);
        MatchData.queue.offer(orderVo);
    }
}
