package com.itkey.erpdev.calendar.service;

import com.itkey.erpdev.calendar.dto.Calendar;
import com.itkey.erpdev.calendar.respository.CalendarDao;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class CalendarServiceImpl implements CalendarService {

    CalendarDao calendarDao;

    public List<Calendar> getInDtCalendar(int custIdx) throws Exception{
        return calendarDao.getInDtCalendar(custIdx);
    }

    public List<Calendar> getOutDtCalendar(int custIdx) throws Exception{
        return calendarDao.getOutDtCalendar(custIdx);
    }

}
