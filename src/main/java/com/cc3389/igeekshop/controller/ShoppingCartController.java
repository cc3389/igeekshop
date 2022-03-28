package com.cc3389.igeekshop.controller;


import com.cc3389.igeekshop.entity.ShoppingCart;
import com.cc3389.igeekshop.entity.User;
import com.cc3389.igeekshop.serviceImpl.ShoppingCartServiceImpl;
import com.cc3389.igeekshop.vo.CartVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
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
@Slf4j
@RequestMapping("/shoppingCart")
public class ShoppingCartController {
    @Autowired
    private ShoppingCartServiceImpl shoppingCartService;


    @GetMapping
    public ModelAndView renderCart(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("cart.html");
        return null;
    }
    @ResponseBody
    @PostMapping("/addProduct")
    public Map<String,Object> addProduct(ShoppingCart shoppingCart, HttpSession session){
        log.info("【添加购物车】信息如下：\n"+shoppingCart);
        User user = (User)session.getAttribute("user");
        Map<String,Object> responseMap = new HashMap<>();
        if (user != null) {
            shoppingCart.setUserId(user.getUserId());
            Boolean isSuccess = shoppingCartService.add(shoppingCart);
            if (isSuccess) {
                log.info("【添加购物车】添加成功");
                Map<String, Integer> map = shoppingCartService.countAndPrice(user.getUserId());
                responseMap.put("cart",map);
                responseMap.put("msg","添加成功");

            } else {
                responseMap.put("msg","商品已存在");
            }
        } else {
            log.info("【添加购物车】用户未登录");
            responseMap.put("msg","用户未登录");
        }
        return responseMap;
    }
    @GetMapping("/cart")
    public ModelAndView getCart(@SessionAttribute("user")User user) {
        List<CartVO> cartVOList = shoppingCartService.getCartByUserId(user.getUserId());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("cart.html");
        modelAndView.addObject("carts",cartVOList);
        return modelAndView;
    }
    @ResponseBody
    @PostMapping("/del")
    public Map<String,Object> delProduct(int productId, @SessionAttribute("user") User user) {
        log.info("【删除购物车】删除商品"+productId);
        boolean isSuccess = false;
        if (user != null) {
             isSuccess = shoppingCartService.delCart(user.getUserId(), productId);
        }
        Map<String, Object> map = new HashMap<>();
        if (isSuccess) {
            map.put("code",0);
            map.put("msg","success");
        } else {
            map.put("code",1);
            map.put("msg","fail");
        }
        return map;
    }
    @ResponseBody
    @GetMapping("/get")
    public Map<String,Object> getCartJson(@SessionAttribute("user")User user) {
        List<CartVO> cartVOList = shoppingCartService.getCartByUserId(user.getUserId());
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("code",0);
        resultMap.put("msg","success");
        resultMap.put("data",cartVOList);
        return resultMap;
    }
    @ResponseBody
    @PostMapping("/updateNum")
    public Map<String,Object> updateCount(@SessionAttribute("user")User user,
                                          int shoppingCartId,int count) {
        Map<String, Object> resultMap = shoppingCartService.updateCount(shoppingCartId, user.getUserId(), count);
        return resultMap;
    }
}

