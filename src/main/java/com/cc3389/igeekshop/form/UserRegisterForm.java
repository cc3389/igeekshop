package com.cc3389.igeekshop.form;


import lombok.Data;
import org.springframework.stereotype.Repository;

import javax.validation.constraints.NotEmpty;
@Repository
@Data
public class UserRegisterForm {
    @NotEmpty(message = "用户名不能为空!")
//    @Pattern(regexp="[A-Za-z0-9_\\-\\u4e00-\\u9fa5]{4,12}",message = "用户名为4到12位字符")
    private String userName;
//    @Pattern(regexp="^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$",message = "密码为6到18位的数字与字母")
    @NotEmpty(message="密码不能为空!")
    private String password;
    @NotEmpty(message="密码不能为空!")
    private String rePassword;
    @NotEmpty(message = "身份不能为空")
    private String type;



}
