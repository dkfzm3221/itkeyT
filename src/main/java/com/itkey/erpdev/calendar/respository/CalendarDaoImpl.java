package com.itkey.erpdev.calendar.respository;

import com.itkey.erpdev.calendar.dto.Calendar;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
@AllArgsConstructor
public class CalendarDaoImpl implements CalendarDao {
    SqlSessionTemplate sql;

    @Override
    public List<Calendar> getInDtCalendar(int custIdx){
        return sql.selectList("mapper.calendar.getInDtCalendar", custIdx);
    }

    @Override
    public List<Calendar> getOutDtCalendar(int custIdx){
        return sql.selectList("mapper.calendar.getOutDtCalendar", custIdx);
    }


}
