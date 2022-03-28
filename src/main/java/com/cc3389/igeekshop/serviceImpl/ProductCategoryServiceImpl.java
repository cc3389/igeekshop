package com.cc3389.igeekshop.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cc3389.igeekshop.entity.ProductCategory;
import com.cc3389.igeekshop.mapper.ProductCategoryMapper;
import com.cc3389.igeekshop.service.ProductCategoryService;
import lombok.extern.slf4j.Slf4j;
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
@Slf4j
public class ProductCategoryServiceImpl extends ServiceImpl<ProductCategoryMapper, ProductCategory> implements ProductCategoryService {
    @Autowired
    private ProductCategoryMapper productCategoryMapper;

    public List<ProductCategory> category() {
        log.info("【首页信息加载】正在查询商品列表");
        List<ProductCategory> productCategories = productCategoryMapper.selectList(new QueryWrapper<>());
        return productCategories;
    }
    public ProductCategory currentCategory(int categoryId) {
        ProductCategory productCategory = productCategoryMapper.selectById(categoryId);
        return productCategory;
    }


}
