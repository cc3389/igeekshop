package com.cc3389.igeekshop.controller;


import com.cc3389.igeekshop.entity.ProductCategory;
import com.cc3389.igeekshop.entity.User;
import com.cc3389.igeekshop.serviceImpl.ProductCategoryServiceImpl;
import com.cc3389.igeekshop.serviceImpl.ShoppingCartServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author cc3389
 * @since 2022-01-23
 */
@RestController
@RequestMapping("/productCategory")
@Slf4j
public class ProductCategoryController {
    @Autowired
    private ProductCategoryServiceImpl productCategoryService;

    @Autowired
    private ShoppingCartServiceImpl shoppingCartService;

    @GetMapping("/index")
    public ModelAndView index(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        User user = (User)session.getAttribute("user");
        //查询商品分类与购物车信息
        List<ProductCategory> category = productCategoryService.category();
        modelAndView.addObject("categorys",category);
        if (user != null) {
            //加载购物车数量与总价格
            Map<String, Integer> map = shoppingCartService.countAndPrice(user.getUserId());
            modelAndView.addObject("cart", map);
        }
        return modelAndView;
    }


}

