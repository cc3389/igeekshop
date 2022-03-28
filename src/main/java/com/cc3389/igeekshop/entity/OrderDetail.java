package com.cc3389.igeekshop.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
@TableName("order_detail")
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId(value = "order_detail_id", type = IdType.AUTO)
    private Integer orderDetailId;

    @TableField("product_id")
    private Integer productId;

    @TableField("product_num")
    private Integer productNum;

    @TableField("product_price")
    private BigDecimal productPrice;

    @TableField("order_id")
    private String orderId;


}
