package com.cc3389.igeekshop.controller;

import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController("/api")
public class ApiController {
    public Map<String,Object> test() {
        Map<String, Object> map = new HashMap<>();
        map.put("code",200);
        map.put("msg","ok");
        Map<String, Object> data = new HashMap<>();
        data.put("page",1);
        data.put("size",10);
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        data.put("list",list);
        map.put("data",data);
        return map;
    }
}
