package org.zerock.domain.manufacturing;

import lombok.Data;

import java.util.List;

@Data
public class recipeStandardVO {
    public int standard_Id;
    public int recipe_Id;
    public int material_Id;
    public int recipe_Product_Quantity;
    public String quantity_Units;
    public String usePhase;

}
