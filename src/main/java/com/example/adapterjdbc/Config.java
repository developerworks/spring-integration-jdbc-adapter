package com.example.adapterjdbc;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.integration.config.EnableIntegration;

@Configuration
@EnableIntegration
@ImportResource(value = {"classpath:adapter.xml"})
public class Config {
}
