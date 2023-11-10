package com.itkey.erpdev.calendar.controller;

import com.itkey.erpdev.calendar.dto.Calendar;
import com.itkey.erpdev.calendar.service.CalendarService;
import com.itkey.erpdev.customer.dto.CustInfoResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping(value = "/calendar")
public class CalendarController {

    CalendarService calendarService;

    @PostMapping(value = "/view")
    @ResponseBody
    public ModelAndView getCalendarList(HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView("jsonView");
        CustInfoResponse response = (CustInfoResponse) session.getAttribute("custInfo");

        int custIdx = response.getCustIdx();

        //투입(거래처)
        List<Calendar> inDtCalendar = calendarService.getInDtCalendar(custIdx);
        //철수(거래처)
        List<Calendar> outDtCalendar = calendarService.getOutDtCalendar(custIdx);
        //투입 + 철수(거래처)
        inDtCalendar.addAll(outDtCalendar);





        mv.addObject("inDtCalendar", inDtCalendar);

        return mv;
    }


}
