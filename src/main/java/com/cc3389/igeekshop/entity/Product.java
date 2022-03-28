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
@Getter
@Setter
@Repository
@TableName("product")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId(value = "product_id", type = IdType.AUTO)
    private Integer productId;

    @TableField("name")
    private String name;

    @TableField("description")
    private String description;

    @TableField("price")
    private BigDecimal price;

    @TableField("store_id")
    private Integer storeId;

    /**
     * 剩余量
     */
    @TableField("surplus")
    private Integer surplus;

    /**
     * 类别id
     */
    @TableField("category_id")
    private Integer categoryId;

    /**
     * 图片地址
     */
    @TableField("photo")
    private String photo = "default.jpg";


}
