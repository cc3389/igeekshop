package com.cc3389.igeekshop.controller;


import com.cc3389.igeekshop.entity.User;
import com.cc3389.igeekshop.exception.ShopException;
import com.cc3389.igeekshop.form.UserLoginForm;
import com.cc3389.igeekshop.form.UserRegisterForm;
import com.cc3389.igeekshop.result.ResponseEnum;
import com.cc3389.igeekshop.serviceImpl.UserServiceImpl;
import com.cc3389.igeekshop.util.MD5Utils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author cc3389
 * @since 2022-01-21
 */
@Controller
@RequestMapping("/user")
@Slf4j
public class UserController {
    @Autowired
    private UserServiceImpl userService;

    @ResponseBody
    @PostMapping("/shopRegister")
    public Map<String,Object> shopRegister(@Valid UserRegisterForm userRegisterForm,
                                           BindingResult result,HttpSession session) {
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (ObjectError error : errors) {
                log.info("【商家注册】"+error.getDefaultMessage());
                throw new ShopException(ResponseEnum.REGISTER_FORM_NULL);
            }
        }
        User user = userService.register(userRegisterForm);
        session.setAttribute("user",user);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("code",0);
        resultMap.put("msg","success");
        return resultMap;
    }
    @PostMapping("/register")
    public ModelAndView register(@Valid UserRegisterForm userRegisterForm,
                                 BindingResult result) {
        //验证表单
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (ObjectError error : errors) {
                log.info("【用户注册】"+error.getDefaultMessage());
                throw new ShopException(ResponseEnum.REGISTER_FORM_NULL);
            }
        }
        //提交注册信息到service
        User user = userService.register(userRegisterForm);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("userName",user.getUserName());
        modelAndView.setViewName("login");
        return modelAndView;
    }
    @PostMapping("/login")
    public String login(@Valid UserLoginForm userLoginForm, BindingResult result,
                        HttpSession session, HttpServletResponse response) {
        if (result.hasErrors()) {
                throw new ShopException(ResponseEnum.LOGIN_FORM_NULL);
        }
        //登录
        User user = userService.login(userLoginForm);
        //用户名与密码加入cookie中
        Boolean rem = userLoginForm.getRem();
        if (rem != null && rem) {
            Cookie cookie_username = new Cookie("username",
                    userLoginForm.getUserName());
            cookie_username.setPath("/");
            cookie_username.setMaxAge(60*60*24);
            Cookie cookie_password = new Cookie("password",
                    MD5Utils.MD5Upper(userLoginForm.getPassword()));
            cookie_password.setPath("/");
            cookie_password.setMaxAge(60*60*24);
            response.addCookie(cookie_username);
            response.addCookie(cookie_password);
        }
        session.setAttribute("user",user);
        if (user.getType().equals("user")) {
            return "redirect:/productCategory/index";
        } else {
            return "redirect:/manage";
        }
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session, HttpServletResponse response) {
        Cookie cookieUserName = new Cookie("username",null);
        Cookie cookiePassword = new Cookie("password",null);
        cookiePassword.setMaxAge(0);
        cookieUserName.setMaxAge(0);
        cookiePassword.setPath("/");
        cookieUserName.setPath("/");
        response.addCookie(cookiePassword);
        response.addCookie(cookieUserName);
        session.removeAttribute("user");
       // sessionStatus.setComplete();
        return "redirect:/";
    }
}

