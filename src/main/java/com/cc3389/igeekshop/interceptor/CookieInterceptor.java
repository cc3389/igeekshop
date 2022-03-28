package com.cc3389.igeekshop.interceptor;

import com.cc3389.igeekshop.entity.User;
import com.cc3389.igeekshop.serviceImpl.UserServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Slf4j
@Component
public class CookieInterceptor implements HandlerInterceptor {
    @Autowired
    private UserServiceImpl userService;

    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        HttpSession session = request.getSession();
        User sessionUser = (User)session.getAttribute("user");
        if (sessionUser == null) {
            //尝试用cookie登录
            log.info("【cookie登录拦截器】用户当前未登录");
            String userName = "";
            String password = "";
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie:cookies) {
                    if ("username".equals(cookie.getName())) {
                        userName = cookie.getValue();
                    }
                    if ("password".equals(cookie.getName())) {
                        password = cookie.getValue();
                    }
                }
                log.info("【cookie登录拦截器】尝试进行登录中。。。用户名：{}密码：{}",userName,password);
                if (!userName.equals("") && !password.equals("")) {
                    User user = userService.cookieLogin(userName, password);
                    session.setAttribute("user",user);
                }
            }
        }
        return true;
    }
}
