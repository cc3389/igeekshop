package com.cc3389.igeekshop.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;

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
@TableName("product_category")
public class ProductCategory implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId(value = "product_category_id", type = IdType.AUTO)
    private Integer productCategoryId;

    @TableField("name")
    private String name;


}
