package com.itkey.erpdev.common.interceptor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
public class WebInterceptor implements HandlerInterceptor {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

    log.info("===============================================");
    log.info("==================== BEGIN ====================");
    log.info("Request URI ==> " + request.getMethod() + " " + request.getRequestURI());

    HttpSession session = request.getSession();
    String url = request.getRequestURI();
    log.info("session={}", session.getAttribute("loginInfo"));
    log.info("url={}", url);

   /* if (customer == null) {
      response.sendRedirect("/cust/login");
      return false;
    }*/
    return HandlerInterceptor.super.preHandle(request, response, handler);
  }

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    log.info("==================== END ======================");
    log.info("===============================================");
    HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
  }
}


