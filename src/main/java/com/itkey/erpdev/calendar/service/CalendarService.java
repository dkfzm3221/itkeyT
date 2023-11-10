package com.itkey.erpdev.calendar.service;

import com.itkey.erpdev.calendar.dto.Calendar;

import java.util.List;

public interface CalendarService {
    List<Calendar> getInDtCalendar(int custIdx) throws Exception;
    List<Calendar> getOutDtCalendar(int custIdx) throws Exception;
}
