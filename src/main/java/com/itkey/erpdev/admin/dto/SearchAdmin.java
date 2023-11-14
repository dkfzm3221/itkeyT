package com.itkey.erpdev.admin.dto;

import lombok.Data;

@Data
public class SearchAdmin {
    private String type;
    private String keyword;

    private int adminIdx;
}
