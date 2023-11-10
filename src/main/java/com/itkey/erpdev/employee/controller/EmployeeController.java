package com.itkey.erpdev.employee.controller;

import com.itkey.erpdev.employee.service.EmployeeService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *packageName    : com.example.erpdev.company.controller
 * fileName       : EmployeeController
 * author         : AHN
 * date           : 2023-02-09
 * description    : 직원관리
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023-02-09        AHN       최초 생성
 */
@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/emp")
public class EmployeeController {

  EmployeeService es;


}
