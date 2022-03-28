package com.cc3389.igeekshop.vo;

import com.cc3389.igeekshop.entity.OrderDetail;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;
@Data
public class OrderVO {

    private String orderId;

    private Integer userId;

    private BigDecimal totalPrice;

    private String address;

    private List<OrderDetail> orderDetails;
}
