package com.itkey.erpdev.calendar.respository;

import com.itkey.erpdev.calendar.dto.Calendar;

import java.util.List;

public interface CalendarDao {
    List<Calendar> getInDtCalendar(int custIdx);
    List<Calendar> getOutDtCalendar(int custIdx);
}
