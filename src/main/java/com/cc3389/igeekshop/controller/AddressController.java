package com.cc3389.igeekshop.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cc3389.igeekshop.entity.Address;
import com.cc3389.igeekshop.entity.User;
import com.cc3389.igeekshop.form.AddAddressFrom;
import com.cc3389.igeekshop.form.EditAddressFrom;
import com.cc3389.igeekshop.serviceImpl.AddressServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
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
@Slf4j
@RestController
@RequestMapping("/address")
public class AddressController {

    @Autowired
    private AddressServiceImpl addressService;

    @GetMapping("/get")
    @ResponseBody
    public Map<String, Object> getAddress(@SessionAttribute("user") User user) {
        Map<String,Object> resultMap = new HashMap<>();
        if (user != null) {
            List<Address> addressByUserId = addressService.getAddressByUserId(user.getUserId());
            resultMap.put("code",0);
            resultMap.put("msg","success");
            resultMap.put("data",addressByUserId);
        } else {
            resultMap.put("code",1);
            resultMap.put("msg","fail");
        }
        return resultMap;
    }
    @PostMapping("/add")
    @ResponseBody
    public Map<String, Object> addAddress(@SessionAttribute("user") User user, @Valid AddAddressFrom addressFrom, BindingResult result) {
        Map<String,Object> resultMap = new HashMap<>();
        if (result.hasErrors()) {
            List<ObjectError> allErrors = result.getAllErrors();
            for(ObjectError error:allErrors) {
                log.info("【添加地址】"+error.getDefaultMessage());
            }
            resultMap.put("code",1);
            resultMap.put("msg","fail");
            return resultMap;
        }
        boolean isSuccess = addressService.addAddress(addressFrom,user.getUserId());
        if (isSuccess) {
            log.info("【添加地址】添加成功");
            resultMap.put("code",0);
            resultMap.put("msg","success");
        } else{
            log.info("【添加地址】添加失败");
            resultMap.put("code",2);
            resultMap.put("msg","fail");
        }
        return resultMap;
    }
    @PostMapping("/delete")
    @ResponseBody
    public Map<String, Object> deleteAddress(@SessionAttribute("user") User user, int addressId) {
        Map<String,Object> resultMap = new HashMap<>();
        boolean isSuccess = addressService.delAddress(user.getUserId(), addressId);
        if (isSuccess) {
            resultMap.put("code",0);
            resultMap.put("msg","success");
        }else {
            resultMap.put("code",1);
            resultMap.put("msg","fail");
        }
        return resultMap;
    }

    @PostMapping("/getone")
    @ResponseBody
    public Map<String, Object> getOneAddress(@SessionAttribute("user") User user, int addressId) {
        Map<String,Object> resultMap = new HashMap<>();
        QueryWrapper<Address> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id",user.getUserId())
                .eq("address_id",addressId);
        Address one = addressService.getOne(wrapper);
        if (one != null) {
            resultMap.put("code",0);
            resultMap.put("msg","success");
            resultMap.put("data",one);
        } else {
            resultMap.put("code",1);
            resultMap.put("msg","fail");
        }
        return resultMap;
    }
    @PostMapping("/update")
    @ResponseBody
    public Map<String, Object> upadateAddress(@SessionAttribute("user") User user, @Valid EditAddressFrom addressFrom, BindingResult result) {
        Map<String,Object> resultMap = new HashMap<>();
        if (result.hasErrors()) {
            List<ObjectError> allErrors = result.getAllErrors();
            for(ObjectError error:allErrors) {
                log.info("【修改地址】"+error.getDefaultMessage());
            }
            resultMap.put("code",1);
            resultMap.put("msg","fail");
            return resultMap;
        }
        boolean isSuccess = addressService.updateAddressById(user.getUserId(),addressFrom);
        if (isSuccess) {
            log.info("【修改地址】修改成功");
            resultMap.put("code",0);
            resultMap.put("msg","success");
        } else{
            log.info("【修改地址】修改失败");
            resultMap.put("code",1);
            resultMap.put("msg","fail");
        }
        return resultMap;
    }

}

