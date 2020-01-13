package com.emmanuel.plumas.configuration;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
@ComponentScan("com.emmanuel.plumas")
@ImportResource("classpath:/applicationContext.xml")
public class CustomSpringConfiguration {

}
