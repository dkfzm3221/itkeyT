package com.itkey.erpdev.common.aop;

import java.lang.reflect.Method;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

/**
 *packageName    : com.example.erpdev.common.aop
 * fileName       : LogAop
 * author         : AHN
 * date           : 2023-02-01
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023-02-01        AHN       최초 생성
 */
@Slf4j
@Aspect
@Component
public class LogAop {

  @Pointcut("execution(* com.itkey.erpdev.*.controller.*.*(..))")
  private void cut() {
  }

  @Before("cut()")
  public void before(JoinPoint joinPoint) {

    MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
    Method method = methodSignature.getMethod();
    log.info("RUN ==> "+method.getName());

    Object[] args = joinPoint.getArgs();

    for (Object obj : args) {
      log.info("Type : " + obj.getClass().getSimpleName());
      log.info("Value : " + obj);
    }
  }

  @AfterReturning(value = "cut()", returning = "obj")
  public void afterReturn(JoinPoint joinPoint, Object obj) {
    log.info("RETURN ==> {}", obj);
  }
}
