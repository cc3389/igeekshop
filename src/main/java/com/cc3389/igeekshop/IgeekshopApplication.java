package com.cc3389.igeekshop;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@MapperScan("com.cc3389.igeekshop.mapper")
@SpringBootApplication
@EnableTransactionManagement
public class IgeekshopApplication {

    public static void main(String[] args) {
        SpringApplication.run(IgeekshopApplication.class, args);
    }

}
