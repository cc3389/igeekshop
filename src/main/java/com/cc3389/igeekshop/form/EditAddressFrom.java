package com.cc3389.igeekshop.form;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
public class EditAddressFrom {
    @NotNull(message = "address为空")
    private Integer addressId;
    @NotEmpty(message = "province为空")
    private String province;
    @NotEmpty(message = "city为空")
    private String city;
    @NotEmpty(message = "area为空")
    private String area;
    @NotEmpty(message = "detail为空")
    private String detail;
    @NotEmpty(message = "name为空")
    private String name;
    @NotNull
    @Size(min = 6, max = 11)
    @Pattern(regexp = "^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$", message = "请输入正确的手机号")
    private String mobile;
}
