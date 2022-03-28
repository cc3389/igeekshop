package com.cc3389.igeekshop.form;

import lombok.Data;

import javax.validation.constraints.NotEmpty;

@Data
public class UserLoginForm {
    @NotEmpty(message = "用户名不能为空")
    private String userName;
    @NotEmpty(message = "密码不能为空")
    private String password;

    private Boolean rem;
}
