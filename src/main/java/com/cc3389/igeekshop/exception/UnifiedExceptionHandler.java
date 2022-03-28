package com.cc3389.igeekshop.exception;

import com.cc3389.igeekshop.result.ResponseEnum;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

@RestControllerAdvice
public class UnifiedExceptionHandler {
    @ExceptionHandler(value=ShopException.class)
    ModelAndView HandlerException(ShopException e) {
        ModelAndView modelAndView = new ModelAndView();
        ResponseEnum responseEnum = e.getResponseEnum();
        switch (responseEnum.getCode()) {
            case 98:
                modelAndView.setViewName("register");
                modelAndView.addObject("registerError", e.getMessage());
                break;
            case 99:
            case 100:
            case 102:
            case 103:
                modelAndView.setViewName("register");
                modelAndView.addObject("userNameError", e.getMessage());
                break;
            case 101:
            case 104:
                modelAndView.setViewName("register");
                modelAndView.addObject("passwordError", e.getMessage());
                break;
            case 105:
                modelAndView.setViewName("register");
                modelAndView.addObject("rePasswordError", e.getMessage());
                break;
            case 106:
                modelAndView.setViewName("login");
                modelAndView.addObject("userNameError", e.getMessage());
                break;
            case 107:
                modelAndView.setViewName("login");
                modelAndView.addObject("passwordError", e.getMessage());
                break;
            case 109:
                modelAndView.setViewName("product");
                modelAndView.addObject("productError", e.getMessage());
        }
        return modelAndView;
    }
}
