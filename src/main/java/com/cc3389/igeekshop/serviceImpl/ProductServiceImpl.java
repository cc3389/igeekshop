package com.cc3389.igeekshop.serviceImpl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cc3389.igeekshop.entity.Product;
import com.cc3389.igeekshop.entity.User;
import com.cc3389.igeekshop.exception.ShopException;
import com.cc3389.igeekshop.form.GetProductPageForm;
import com.cc3389.igeekshop.form.UploadProductFrom;
import com.cc3389.igeekshop.mapper.ProductCategoryMapper;
import com.cc3389.igeekshop.mapper.ProductMapper;
import com.cc3389.igeekshop.mapper.UserMapper;
import com.cc3389.igeekshop.result.ResponseEnum;
import com.cc3389.igeekshop.service.ProductService;
import com.cc3389.igeekshop.vo.CartVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
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
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

    @Autowired
    private ProductCategoryMapper productCategoryMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private UserMapper userMapper;

    public Page<Product> categoryProducts(int categoryId, int currentPage, int pagesSize) {
        if (pagesSize > 40) {
            pagesSize = 40;
        }
        if (pagesSize < 8) {
            pagesSize = 8;
        }
        Page<Product> productPage = new Page<>(currentPage,pagesSize);
        QueryWrapper<Product> wrapper = new QueryWrapper<>();
        wrapper.eq("category_id",categoryId);
        productMapper.selectPage(productPage,wrapper);
        log.info("【商品分类显示】查询结果：页面总数："+productPage.getPages()+";页面大小："+productPage.getSize());
        return productPage;
    }
    public Map<String, Object> productDetail(int id) {
        Product product = productMapper.selectById(id);
        if (product == null) {
            log.info("【商品详情】商品id"+id+"未找到");
            throw new ShopException(ResponseEnum.PRODUCT_NOT_FOUND);
        }
        User user = userMapper.selectById(product.getStoreId());
        Map<String,Object> productMap = new HashMap<>();
        productMap.put("product",product);
        productMap.put("storeName",user.getUserName());
        return productMap;
    }

    @Transactional
    @Override
    public void subSurplus(List<CartVO> carts) {
        for (CartVO cart:carts) {
            Product product = new Product();
            product.setProductId(cart.getProductId());
            int currentNum = cart.getSurplus() - cart.getCount();
            product.setSurplus(currentNum);
            productMapper.updateById(product);
        }
    }

    @Override
    public IPage<Product> getPage(Integer userId, GetProductPageForm productPageForm) {
        IPage<Product> page = new Page<>(productPageForm.getPageNum(),productPageForm.getPageSize());
        QueryWrapper<Product> wrapper = new QueryWrapper<>();
        wrapper.eq("store_id",userId);
        IPage<Product> productIPage = productMapper.selectPage(page, wrapper);
        return productIPage;
    }
    @Transactional
    public boolean upload(Integer userId, UploadProductFrom productForm, MultipartFile pic) throws IOException {
        Product product = new Product();
        product.setStoreId(userId);
        BeanUtils.copyProperties(productForm,product);
        int insert = productMapper.insert(product);
        if (insert == 1) {
            QueryWrapper<Product> wrapper = new QueryWrapper<>();
            wrapper.eq("name",product.getName())
            .eq("store_id",userId);
            Product product1 = productMapper.selectOne(wrapper);
            if (null != pic) {
                log.info("【上传商品】","上传图片");
                String originalFilename = pic.getOriginalFilename();
                String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
                String path = "D:\\IDEA workplace\\igeekshop\\src\\main\\resources\\static\\images/";
                File file = new File(path+product1.getProductId()+suffix);
                pic.transferTo(file);
                product1.setPhoto(product1.getProductId()+suffix);
                productMapper.updateById(product1);
            }
            return true;
        }
        return false;
    }
}
