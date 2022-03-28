package com.cc3389.igeekshop.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cc3389.igeekshop.entity.ShoppingCart;
import com.cc3389.igeekshop.vo.CartVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author cc3389
 * @since 2022-01-23
 */
public interface ShoppingCartService extends IService<ShoppingCart> {
    Map<String,Integer> countAndPrice(int userId);

    boolean add(ShoppingCart shoppingCart);

    List<CartVO> getCartByUserId(int userID);

    boolean delCart(int userId,int productId);

    boolean delCartByUserId(int userId);

    Map<String,Object> updateCount(int shoppingCartId, Integer userId,int count);
}
