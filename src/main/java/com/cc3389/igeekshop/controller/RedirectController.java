package com.cc3389.igeekshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class RedirectController {
    @GetMapping("/")
    public String redirectToIndex() {
        return "redirect:/productCategory/index";
    }
    @GetMapping("/cart")
    public String cart() { return "cart"; }
    @GetMapping("/login")
    public String login() {
        return "login";
    }
    @GetMapping("/main")
    public String main() {
        return "/productCategory/index";
    }
    @GetMapping("/manage")
    public String manage() {
        return "manage";
    }
    @GetMapping("/product")
    public String product() {
        return "product";
    }
    @GetMapping("/products")
    public String products() { return "products"; }
    @GetMapping("/register")
    public String register() {
        return "register";
    }
    @GetMapping("/upload")
    public String upload() {
        return "upload";
    }
    @GetMapping("/confirmOrder")
    public String confirmOrder() {
        return "confirmOrder";
    }
    @GetMapping("/redirect")
    public String orderRedirect() {
        return "redirect";
    }
    @GetMapping("/shopRegister")
    public String shopRegister() {
        return "shopRegister";
    }
    @GetMapping("/403")
    public String notAuth() {
        return "403";
    }
    @GetMapping("/success")
    public String success() {
        return "success";
    }
    @GetMapping("/myorder")
    public String myorder() {
        return "forward:/order/get";
    }


}
