package com.cc3389.igeekshop.vo;

import lombok.Data;

import java.math.BigDecimal;
@Data
public class CartVO {

    private Integer shoppingCartId;

    private Integer userId;

    private Integer productId;

    private Integer count;

    private String name;

    private BigDecimal price;

    private String description;

    private Integer surplus;

    private Integer categoryId;

    private String photo;

}
