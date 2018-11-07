package com.blockeng.gathering;

import com.alicp.jetcache.anno.config.EnableCreateCacheAnnotation;
import com.alicp.jetcache.anno.config.EnableMethodCache;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.actuate.autoconfigure.jdbc.DataSourceHealthIndicatorAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@SpringBootApplication(exclude= {DataSourceHealthIndicatorAutoConfiguration.class,DataSourceAutoConfiguration.class,SecurityAutoConfiguration.class})
@EnableMethodCache(basePackages = "com.blockeng")
@EnableCreateCacheAnnotation
@EnableCircuitBreaker
@EnableScheduling
@EnableConfigurationProperties
//@RefreshScope
public class GatheringServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(GatheringServiceApplication.class, args);
    }
}