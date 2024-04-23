package com.project.kammi.domain.manufacturing;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class recipeStandardVO {
    public int standard_Id;
    public int recipe_Id;
    public String material_Name;
    public int recipe_Product_Quantity;
    public String quantity_Units;
    public String usePhase;
    public String recipe_Name;
    public Date registration_Date;
    public Date modify_Date;
    public String fileName;
    public String filePath;

}
