package com.itkey.erpdev.common.interceptor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
public class WebConfig implements WebMvcConfigurer {

  @Bean
  MappingJackson2JsonView jsonView() {
    return new MappingJackson2JsonView();
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor((new WebInterceptor()))
        .addPathPatterns("/**")
        .excludePathPatterns("/*/login", "/*/logout", "/error", "/static/**", "WEB-INF/**")
    ;
  }

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/images/**")
            .addResourceLocations("file:/C:/Users/Administrator/Desktop/images/");
  }
}
