package com.cc3389.igeekshop.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cc3389.igeekshop.entity.User;
import com.cc3389.igeekshop.exception.ShopException;
import com.cc3389.igeekshop.form.UserLoginForm;
import com.cc3389.igeekshop.form.UserRegisterForm;
import com.cc3389.igeekshop.mapper.UserMapper;
import com.cc3389.igeekshop.result.ResponseEnum;
import com.cc3389.igeekshop.service.UserService;
import com.cc3389.igeekshop.util.MD5Utils;
import com.cc3389.igeekshop.util.ValidationUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cc3389
 * @since 2022-01-23
 */
@Service
@Slf4j
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private User user;
    @Autowired
    private UserMapper userMapper;

    @Transactional
    public User register(UserRegisterForm userRegisterForm) {
        QueryWrapper<User> wrapper = new QueryWrapper();
        wrapper.eq("user_name",userRegisterForm.getUserName());
        User existedUser = userMapper.selectOne(wrapper);
        if (existedUser!=null) {
            log.info("【用户注册】用户名已存在");
            throw new ShopException(ResponseEnum.USER_NAME_EXIST);
        }
        if (!ValidationUtil.UserName(userRegisterForm.getUserName())) {
            log.info("【用户注册】用户名格式错误");
            throw new ShopException(ResponseEnum.USER_NAME_FORMAT_ERROR);
        }
        if (!ValidationUtil.Password_reg(userRegisterForm.getPassword())) {
            log.info("【用户注册】密码格式错误");
            throw new ShopException(ResponseEnum.USER_NAME_FORMAT_ERROR);
        }
        if (!userRegisterForm.getPassword().equals(userRegisterForm.getRePassword())) {
            log.info("【用户注册】两次密码不一致");
            throw new ShopException(ResponseEnum.REPASSWORD_ERROR);
        }
        if (!userRegisterForm.getType().equals("user") && !userRegisterForm.getType().equals("shop")) {
            log.info("【用户注册】身份信息错误");
            throw new ShopException(ResponseEnum.REPASSWORD_ERROR);
        }
        User user = new User();
        BeanUtils.copyProperties(userRegisterForm,user);
        user.setPassword(MD5Utils.MD5Upper(userRegisterForm.getPassword()));
        int insertCount = userMapper.insert(user);
        if (insertCount != 1) {
            log.info("【用户注册】数据库插入用户失败");
            throw new ShopException(ResponseEnum.REGISTER_ERROR);
        }
        return user;
    }
    @Transactional
    public User login(UserLoginForm userLoginForm) {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("user_name", userLoginForm.getUserName())
                .eq("password", MD5Utils.MD5Upper(userLoginForm.getPassword()));
        User user = userMapper.selectOne(wrapper);
        if (user == null) {
            log.info("【用户登录】用户名或密码错误");
            throw new ShopException(ResponseEnum.USER_NAME_OR_PASSWORD_ERROR);
        }
        return user;
    }
    @Transactional
    @Override
    public User cookieLogin(String userName, String password) {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("user_name",userName);
        wrapper.eq("password",password);
        User user = userMapper.selectOne(wrapper);
        if (user == null) {
            log.info("【cookie登录】登录失败");
        }
        return user;
    }
}
