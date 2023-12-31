package com.itkey.erpdev;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
@SpringBootApplication
public class ErpDevApplication extends SpringBootServletInitializer {

  public static void main(String[] args) {
    SpringApplication.run(ErpDevApplication.class, args);
  }

  @Override
  protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
    return application.sources(ErpDevApplication.class);
  }
}
