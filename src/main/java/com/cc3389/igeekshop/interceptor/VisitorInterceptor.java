package com.cc3389.igeekshop.interceptor;

import com.cc3389.igeekshop.entity.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Slf4j
@Component
public class VisitorInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if (user != null) {
            log.info("【访客拦截器】用户已登录");
            return true;
        } else {
            log.info("【访客拦截器】用户未登录");
            response.sendRedirect("/login");
            return false;
        }
    }
}
