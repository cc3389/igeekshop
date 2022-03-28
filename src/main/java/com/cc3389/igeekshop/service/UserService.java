package com.cc3389.igeekshop.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cc3389.igeekshop.entity.User;
import com.cc3389.igeekshop.form.UserLoginForm;
import com.cc3389.igeekshop.form.UserRegisterForm;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author cc3389
 * @since 2022-01-23
 */
public interface UserService extends IService<User> {

    User register(UserRegisterForm userRegisterForm);

    User login(UserLoginForm userLoginForm);

    User cookieLogin(String userName, String password);
}
