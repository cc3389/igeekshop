package com.cc3389.igeekshop.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cc3389.igeekshop.entity.Address;
import com.cc3389.igeekshop.form.AddAddressFrom;
import com.cc3389.igeekshop.form.EditAddressFrom;
import com.cc3389.igeekshop.mapper.AddressMapper;
import com.cc3389.igeekshop.service.AddressService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cc3389
 * @since 2022-01-23
 */
@Service
public class AddressServiceImpl extends ServiceImpl<AddressMapper, Address> implements AddressService {

    @Autowired
    private AddressMapper addressMapper;

    @Override
    public List<Address> getAddressByUserId(int userId) {
        QueryWrapper<Address> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id",userId);
        List<Address> addresses = addressMapper.selectList(wrapper);
        return addresses;
    }

    @Override
    public boolean addAddress(AddAddressFrom addressFrom,int userId) {
        Address address = new Address();
        BeanUtils.copyProperties(addressFrom,address);
        address.setUserId(userId);
        int insert = addressMapper.insert(address);
        if (insert >= 1) {
            return true;
        }
        return false;
    }

    @Override
    public boolean delAddress(int userId, int addressId) {
        QueryWrapper<Address> wrapper = new QueryWrapper<>();
        wrapper.eq("address_id",addressId)
                .eq("user_id",userId);
        int delete = addressMapper.delete(wrapper);
        if (delete == 1) {
            return true;
        }
        return false;
    }

    @Override
    public boolean updateAddressById(Integer userId, EditAddressFrom addressFrom) {
        Address address = new Address();
        QueryWrapper<Address> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id",userId)
                .eq("address_id",addressFrom.getAddressId());
        BeanUtils.copyProperties(addressFrom,address);
        address.setUserId(userId);
        int update = addressMapper.update(address, wrapper);
        if (update == 1) {
            return true;
        }
        return false;
    }
}
