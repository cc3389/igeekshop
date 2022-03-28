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
@TableName("address")
public class Address implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableField("user_id")
    private Integer userId;

    /**
     * 省
     */
    @TableField("province")
    private String province;

    /**
     * 市
     */
    @TableField("city")
    private String city;

    /**
     * 区
     */
    @TableField("area")
    private String area;

      @TableId(value = "address_id", type = IdType.AUTO)
    private Integer addressId;

    @TableField("detail")
    private String detail;

    @TableField("name")
    private String name;

    @TableField("mobile")
    private String mobile;


}
