package com.saly.gateway;

import co.elastic.apm.attach.ElasticApmAttacher;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class GatewayApplication {

    public static void main(String[] args) {
        ElasticApmAttacher.attach();
        SpringApplication.run(GatewayApplication.class, args);
    }

}
