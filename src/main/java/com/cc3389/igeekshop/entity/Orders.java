package com.cc3389.igeekshop.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * <p>
 * 
 * </p>
 *
 * @author cc3389
 * @since 2022-02-11
 */
@Repository
@Getter
@Setter
@TableName("orders")
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId("order_id")
    private String orderId;

    @TableField("user_id")
    private Integer userId;

    @TableField("total_price")
    private BigDecimal totalPrice;

    @TableField("address")
    private String address;


}
