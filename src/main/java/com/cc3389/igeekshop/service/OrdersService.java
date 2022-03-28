package com.cc3389.igeekshop.service;

import com.cc3389.igeekshop.entity.Orders;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cc3389.igeekshop.entity.User;
import com.cc3389.igeekshop.vo.OrderVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author cc3389
 * @since 2022-02-11
 */
public interface OrdersService extends IService<Orders> {
    Orders create(User user, int addressId);

    List<OrderVO> getOrderVO(Integer userId);
}
