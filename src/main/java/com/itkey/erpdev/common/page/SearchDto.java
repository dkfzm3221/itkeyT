package com.itkey.erpdev.common.page;

import lombok.Data;

@Data
public class SearchDto {
    private String type;
    private String keyword;

    private int custIdx;
}