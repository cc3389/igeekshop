package com.cc3389.igeekshop.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cc3389.igeekshop.entity.Address;
import com.cc3389.igeekshop.entity.OrderDetail;
import com.cc3389.igeekshop.entity.Orders;
import com.cc3389.igeekshop.entity.User;
import com.cc3389.igeekshop.exception.OrderException;
import com.cc3389.igeekshop.mapper.OrderDetailMapper;
import com.cc3389.igeekshop.mapper.OrdersMapper;
import com.cc3389.igeekshop.result.ResponseEnum;
import com.cc3389.igeekshop.service.OrdersService;
import com.cc3389.igeekshop.util.UUIDGenerator;
import com.cc3389.igeekshop.vo.CartVO;
import com.cc3389.igeekshop.vo.OrderVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cc3389
 * @since 2022-02-11
 */
@Service
public class OrdersServiceImpl extends ServiceImpl<OrdersMapper, Orders> implements OrdersService {
    @Autowired
    private Orders order;

    @Autowired
    private ShoppingCartServiceImpl shoppingCartService;

    @Autowired
    private OrdersMapper orderMapper;

    @Autowired
    private OrderDetailMapper orderDetailMapper;

    @Autowired
    private ProductServiceImpl productService;

    @Autowired
    private AddressServiceImpl addressService;

    @Transactional
    @Override
    public Orders create(User user, int addressId) {
        order.setOrderId(UUIDGenerator.getUUID());
        /*
        生成订单
        1. 获取购物车信息
         */
        List<CartVO> carts = shoppingCartService.getCartByUserId(user.getUserId());
        //3. 计算总价 生成详细订单
        BigDecimal totalPrice = new BigDecimal(0);
        for (CartVO cart:carts) {
            OrderDetail orderDetail = new OrderDetail();
            BigDecimal price = cart.getPrice().multiply(BigDecimal.valueOf(cart.getCount()));
            totalPrice = totalPrice.add(price);
            orderDetail.setOrderId(order.getOrderId());
            orderDetail.setProductId(cart.getProductId());
            orderDetail.setProductNum(cart.getCount());
            orderDetail.setProductPrice(cart.getPrice());
            int insert = orderDetailMapper.insert(orderDetail);
            if (insert != 1) {
                throw new OrderException(ResponseEnum.INSERT_DETAIL_ERROR);
            }
        }
        // 2. 获取地址信息
        QueryWrapper<Address> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id",user.getUserId())
                .eq("address_id", addressId);
        Address address = addressService.getOne(wrapper);
        //总价大于0且地址不为空，生成订单
        if (totalPrice.compareTo(BigDecimal.ZERO) == 1 && address != null) {
            StringBuffer strAddress = new StringBuffer();
            strAddress.append(address.getProvince())
                    .append("省")
                    .append(address.getCity())
                    .append("市")
                    .append(address.getArea())
                    .append("区")
                    .append(address.getDetail())
                    .append("（")
                    .append(address.getName())
                    .append("收）电话：")
                    .append(address.getMobile());
            order.setAddress(strAddress.toString());
            order.setTotalPrice(totalPrice);
            order.setUserId(user.getUserId());
            int insert = orderMapper.insert(order);
            if (insert != 1) {
                throw new OrderException(ResponseEnum.INSERT_ORDER_ERROR);
            }
        } else {
            throw new OrderException(ResponseEnum.ADDRESS_NULL);
        }
        //减少商品库存
        productService.subSurplus(carts);
        //清空购物车
        shoppingCartService.delCartByUserId(user.getUserId());
        return order;
    }

    @Override
    public List<OrderVO> getOrderVO(Integer userId) {
        QueryWrapper<Orders> wrapper = new QueryWrapper<>();
        List<OrderVO> orderVOs = new ArrayList<>();
        wrapper.eq("user_id",userId);
        List<Orders> orders = orderMapper.selectList(wrapper);
        for (Orders order:orders) {
            OrderVO orderVO = new OrderVO();
            QueryWrapper<OrderDetail> detailWrapper = new QueryWrapper<>();
            detailWrapper.eq("order_id",order.getOrderId());
            List<OrderDetail> orderDetails = orderDetailMapper.selectList(detailWrapper);
            BeanUtils.copyProperties(order,orderVO);
            orderVO.setOrderDetails(orderDetails);
            orderVOs.add(orderVO);
        }
        return orderVOs;
    }
}
