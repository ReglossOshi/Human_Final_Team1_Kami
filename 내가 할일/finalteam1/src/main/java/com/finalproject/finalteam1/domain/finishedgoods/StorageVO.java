package com.finalproject.finalteam1.domain.finishedgoods;

import lombok.Data;

@Data
public class StorageVO {
    private int storage_id;
    private String storage_address;
    private String storage_name;
    private int storage_current_amount;
    private int storage_total_amount;
}
