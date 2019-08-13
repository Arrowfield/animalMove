package com.apple;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication

public class HelloApplication {
    public static void main(String[] args) {
        System.out.println(123);
        //System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(HelloApplication.class, args);

    }
}