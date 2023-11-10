package com.itkey.erpdev.common.masking;

import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.Field;

@Slf4j
public final class MaskingUtil {

    private MaskingUtil(){}


    public static String maskStringField(Class<?> clss, final String fieldName, final String currValue) {
        for (Field field : clss.getDeclaredFields()) {
            String fName = field.getName();
            if (fieldName.equals(fName)) {
                if (field.isAnnotationPresent(MaskString.class)) {
                    MaskString mask = field.getAnnotation(MaskString.class);
                    if (mask.value() != null && !mask.value().isEmpty()) {
                        //첫부분만 가져옴 ex) 김재섭 -> 김
                        char part1 =  currValue.charAt(0);
                        //** 가져옴
                        String part2 = mask.value();
                        return part1 + part2;
                    }
                } else if (field.isAnnotationPresent(MaskChar.class)) {
                    MaskChar mask = field.getAnnotation(MaskChar.class);
                    if (mask.value() != ' ') {
                        String part1 = currValue.substring(0, currValue.length() - 4).replaceAll("[0-9]",
                                String.valueOf(mask.value()));

                        String part2 = currValue.substring(currValue.length() - 4);

                        return part1 + part2;
                    }
                }
            }
        }

        return currValue;
    }





}
