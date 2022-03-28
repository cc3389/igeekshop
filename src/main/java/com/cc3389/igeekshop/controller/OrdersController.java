package com.cc3389.igeekshop.controller;


import com.cc3389.igeekshop.entity.Orders;
import com.cc3389.igeekshop.entity.User;
import com.cc3389.igeekshop.serviceImpl.OrdersServiceImpl;
import com.cc3389.igeekshop.serviceImpl.ShoppingCartServiceImpl;
import com.cc3389.igeekshop.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author cc3389
 * @since 2022-02-11
 */
@RestController
@RequestMapping("/order")
public class OrdersController {

    @Autowired
    private OrdersServiceImpl ordersService;
    @Autowired
    private ShoppingCartServiceImpl shoppingCartService;

    @ResponseBody
    @PostMapping("/create")
    public Map<String, Object> createOrder(@SessionAttribute("user") User user, int addressId) {
        Orders order = ordersService.create(user, addressId);
        shoppingCartService.delCartByUserId(user.getUserId());
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("msg", "success");
        resultMap.put("code", "0");
        resultMap.put("data", order);
        return resultMap;
    }
    @GetMapping("/get")
    public ModelAndView getOrderList(@SessionAttribute("user")User user) {
        ModelAndView modelAndView = new ModelAndView();
        List<OrderVO> orderVO = ordersService.getOrderVO(user.getUserId());
        modelAndView.setViewName("myorder.html");
        modelAndView.addObject("orders",orderVO);
        return modelAndView;
    }
}

