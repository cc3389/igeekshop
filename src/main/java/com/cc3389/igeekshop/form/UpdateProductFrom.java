package com.cc3389.igeekshop.form;

import lombok.Data;
import org.springframework.stereotype.Repository;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
@Data
@Repository
public class UpdateProductFrom {
    @NotEmpty(message = "name 不能为空")
    private String name;
    @NotEmpty(message = "description 不能为空")
    private String description;
    @NotNull(message = "price 不能为空")
    private BigDecimal price;
    @NotNull(message = "surplus 不能为空")
    private Integer surplus;
    @NotNull(message = "productId 不能为空")
    private Integer productId;
}
