package com.cc3389.igeekshop.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cc3389.igeekshop.entity.Address;
import com.cc3389.igeekshop.form.AddAddressFrom;
import com.cc3389.igeekshop.form.EditAddressFrom;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author cc3389
 * @since 2022-01-23
 */
public interface AddressService extends IService<Address> {
    List<Address>  getAddressByUserId(int userId);

    boolean addAddress(AddAddressFrom addressFrom,int userId);

    boolean delAddress(int userId,int addressId);


    boolean updateAddressById(Integer userId, EditAddressFrom addressFrom);
}
