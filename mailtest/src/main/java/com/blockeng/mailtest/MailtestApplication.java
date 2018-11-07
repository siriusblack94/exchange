package com.blockeng.mailtest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class})

public class MailtestApplication {

    public static void main(String[] args) {
        SpringApplication.run(MailtestApplication.class, args);
    }
}
