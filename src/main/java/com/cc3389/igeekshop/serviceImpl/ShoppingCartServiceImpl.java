package com.cc3389.igeekshop.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cc3389.igeekshop.entity.Product;
import com.cc3389.igeekshop.entity.ShoppingCart;
import com.cc3389.igeekshop.mapper.ProductMapper;
import com.cc3389.igeekshop.mapper.ShoppingCartMapper;
import com.cc3389.igeekshop.service.ShoppingCartService;
import com.cc3389.igeekshop.vo.CartVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class ShoppingCartServiceImpl extends ServiceImpl<ShoppingCartMapper, ShoppingCart> implements ShoppingCartService {
    @Autowired
    private ShoppingCartMapper shoppingCartMapper;

    @Autowired
    private ProductMapper productMapper;

    public Map<String,Integer> countAndPrice(int userId) {
        QueryWrapper<ShoppingCart> wrapper= new QueryWrapper<>();
        wrapper.eq("user_id",userId);
        List<ShoppingCart> shoppingCarts = shoppingCartMapper.selectList(wrapper);
        Map<String, Integer> map = new HashMap<>();
        map.put("count", shoppingCarts.size());
        BigDecimal price = new BigDecimal(0);
        for (int i = 0; i < shoppingCarts.size(); ++i) {
            int productId = shoppingCarts.get(i).getProductId();
            Product product = productMapper.selectById(productId);
            price = price.add(product.getPrice()
                    .multiply(new BigDecimal(shoppingCarts.get(i).getCount())));
        }
        log.info("购物车价格："+price);
        log.info("priceintValue:"+price.intValue());
        map.put("price",price.intValue());
        return map;
    }

    public boolean add(ShoppingCart shoppingCart) {
        QueryWrapper<ShoppingCart> wrapper = new QueryWrapper<>();
        Map<String,String> map = new HashMap<>();
        wrapper.eq("product_id",shoppingCart.getProductId()).eq("user_id",shoppingCart.getUserId());
        Long count = shoppingCartMapper.selectCount(wrapper);
        if (count != 0) {
            log.info("【添加购物车】商品已存在");
            return false;
        }
        int result = shoppingCartMapper.insert(shoppingCart);
        if (result != 1) {
            log.info("【添加购物车】添加失败");
            return false;
        }
        return true;
    }
    @Transactional
    public List<CartVO> getCartByUserId(int userID) {
        QueryWrapper<ShoppingCart> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id",userID);
        List<ShoppingCart> shoppingCarts = shoppingCartMapper.selectList(wrapper);
        List<CartVO> cartVOList = new ArrayList<>();
        for (ShoppingCart shoppingCart:shoppingCarts) {
            Product product = productMapper.selectById(shoppingCart.getProductId());
            CartVO cartVO = new CartVO();
            BeanUtils.copyProperties(shoppingCart,cartVO);
            BeanUtils.copyProperties(product,cartVO);
            cartVOList.add(cartVO);
        }
        return cartVOList;
    }
    @Transactional
    @Override
    public boolean delCart(int userId, int productId) {
        QueryWrapper<ShoppingCart> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id",userId)
                .eq("product_id",productId);
        int count = shoppingCartMapper.delete(wrapper);
        if (count >= 1)
            return true;
        return false;
    }
    @Transactional
    @Override
    public boolean delCartByUserId(int userId) {
        QueryWrapper cartWrapper = new QueryWrapper();
        cartWrapper.eq("user_id",userId);
        int delete = shoppingCartMapper.delete(cartWrapper);
        if (delete >= 1) {
            return true;
        }
        else {
            return false;
        }
    }
    @Transactional
    @Override
    public Map<String,Object> updateCount(int shoppingCartId, Integer userId, int count) {
        Map<String,Object> resultMap = new HashMap<>();
        if (count < 1) {
            resultMap.put("code",2);
            resultMap.put("msg","数量最低为1");
            resultMap.put("count",1);
        }
        QueryWrapper<ShoppingCart> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id",userId)
                .eq("shopping_cart_id",shoppingCartId);
        ShoppingCart shoppingCart = shoppingCartMapper.selectOne(wrapper);
        if (shoppingCart != null) {
            Integer productId = shoppingCart.getProductId();
            Product product = productMapper.selectById(productId);
            Integer surplus = product.getSurplus();
            if (surplus <= count) {
                log.info("【更新购物车商品数量】剩余量{}小于更新数{}",surplus,count);
                resultMap.put("code",1);
                resultMap.put("msg","库存不足");
                resultMap.put("count",surplus-1);
            } else {
                shoppingCart.setCount(count);
                int update = shoppingCartMapper.update(shoppingCart, wrapper);
                if (update == 1) {
                    resultMap.put("code",0);
                    resultMap.put("msg","success");
                    resultMap.put("count",count);
                } else {
                    resultMap.put("code",3);
                    resultMap.put("msg","更新失败");
                }
            }
        } else {
            resultMap.put("code",4);
            resultMap.put("msg","购物车信息异常");
        }
        return resultMap;
    }


}
