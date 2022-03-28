package com.cc3389.igeekshop.form;

import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
@Data
public class UploadProductFrom {
    @NotEmpty(message = "name 不能为空")
    private String name;
    @NotEmpty(message = "description 不能为空")
    private String description;
    @NotNull(message = "price 不能为空")
    private BigDecimal price;
    @NotNull(message = "surplus 不能为空")
    private Integer surplus;
    @Min(value = 1,message = "categoryId 最小为1")
    @Max(value = 7,message="categoryId 最大为7")
    @NotNull(message="categoryId 不能为空")
    private Integer categoryId;
}
