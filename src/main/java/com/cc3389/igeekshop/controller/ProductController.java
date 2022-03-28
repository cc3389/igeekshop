package com.cc3389.igeekshop.controller;


import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cc3389.igeekshop.entity.Product;
import com.cc3389.igeekshop.entity.ProductCategory;
import com.cc3389.igeekshop.entity.User;
import com.cc3389.igeekshop.form.GetProductPageForm;
import com.cc3389.igeekshop.form.UpdateProductFrom;
import com.cc3389.igeekshop.form.UploadProductFrom;
import com.cc3389.igeekshop.serviceImpl.ProductCategoryServiceImpl;
import com.cc3389.igeekshop.serviceImpl.ProductServiceImpl;
import com.cc3389.igeekshop.serviceImpl.ShoppingCartServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.ArrayList;
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
@Controller
@Slf4j
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private Product product;
    @Autowired
    private ShoppingCartServiceImpl shoppingCartService;

    @Autowired
    private ProductCategoryServiceImpl productCategoryService;

    @Autowired
    private ProductServiceImpl productSercice;

    @GetMapping("/category/{id}/{pageSize}/{pageNum}")
    public ModelAndView productcategory(@PathVariable("id")int categoryId,
                                        @PathVariable("pageSize") int pageSize,
                                        @PathVariable("pageNum")int pageNum,
                                        HttpSession session) {
        //分页展示分类中的商品
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("products");
        log.info("【商品分类显示】 提交查询：分类id为"+categoryId+";页面大小为"+pageSize+";查询第"+pageNum+"页");
        Page<Product> productPage = productSercice.categoryProducts(categoryId, pageNum, pageSize);
        modelAndView.addObject("productPage",productPage);
        User user = (User)session.getAttribute("user");
        List<ProductCategory> category = productCategoryService.category();

        modelAndView.addObject("categorys",category);
        modelAndView.addObject("currentCategory",
                productCategoryService.currentCategory(categoryId));
        if (user != null) {
            //加载购物车数量与总价格
            log.info("【商品分类显示】正在查询购物车价格与数量");
            Map<String, Integer> map = shoppingCartService.countAndPrice(user.getUserId());
            modelAndView.addObject("cart", map);
        }
        return modelAndView;
    }
    @GetMapping("/{categoryId}/{productId}")
    public ModelAndView productDetail(@PathVariable("productId")int productId,
                                      @PathVariable("categoryId")int categoryId,
                                      HttpSession session) {
        log.info("【商品详情】正在加载编号为"+productId+"的商品");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("product");
        User user = (User)session.getAttribute("user");
        //加载用户信息、购物车信息、商品分类、商品详情
        if (user != null) {
            //加载购物车数量与总价格
            log.info("【商品详情】正在查询购物车价格与数量");
            Map<String, Integer> map = shoppingCartService.countAndPrice(user.getUserId());
            modelAndView.addObject("cart", map);
        }
        log.info("【商品详情】正在查询商品分类");
        List<ProductCategory> category = productCategoryService.category();
        modelAndView.addObject("categorys",category);
        modelAndView.addObject("currentCategory",
                productCategoryService.currentCategory(categoryId));
        log.info("【商品详情】正在查询商品信息");
        Map<String, Object> stringObjectMap = productSercice.productDetail(productId);
        modelAndView.addObject("product",stringObjectMap.get("product"));
        modelAndView.addObject("storeName",stringObjectMap.get("storeName"));
        return modelAndView;

    }
    @ResponseBody
    @PostMapping("/getPage")
    public Map<String,Object> getPage(@SessionAttribute("user")User user,
                                      @Valid GetProductPageForm productPageForm, BindingResult bindingResult) {
        Map<String,Object> resultMap = new HashMap<>();
        if (bindingResult.hasErrors()) {
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            resultMap.put("code",1);
            resultMap.put("msg","fail");
            List<String> errs = new ArrayList<>();
            for (ObjectError e:allErrors) {
                errs.add(e.getDefaultMessage());
            }
            resultMap.put("error",errs);
        } else {
            IPage<Product> page = productSercice.getPage(user.getUserId(), productPageForm);
            resultMap.put("code",0);
            resultMap.put("msg","success");
            resultMap.put("data",page);
        }
        return resultMap;
    }
    @PostMapping("/update")
    public String updateProduct(@SessionAttribute("user")User user, @Valid UpdateProductFrom productFrom, BindingResult result) {
        if (result.hasErrors()) {
            List<ObjectError> allErrors = result.getAllErrors();
            for (ObjectError e:allErrors) {
                log.info("【更新商品】"+e.getDefaultMessage());
            }
            return "redirect:/error";
        } else {
            BeanUtils.copyProperties(productFrom,product);
            UpdateWrapper<Product> wrapper = new UpdateWrapper<>();
            wrapper.eq("store_id",user.getUserId());
            wrapper.eq("product_id",productFrom.getProductId());
            boolean update = productSercice.update(product, wrapper);
            if (update) {
                log.info("【更新商品】更新成功");
                return "redirect:/manage";
            } else {
                log.info("【更新商品】更新失败");
                return "redirect:/error";
            }
        }
    }
    @ResponseBody
    @PostMapping("/delete")
    public Map<String,Object> deleteProduct(@SessionAttribute("user")User user,Integer productId ){
        Map<String,Object> resultMap = new HashMap<>();
        if (productId != null) {
            Map<String,Object> removeMap = new HashMap<>();
            removeMap.put("store_id",user.getUserId());
            removeMap.put("product_id",productId);
            boolean b = productSercice.removeByMap(removeMap);
            if (b) {
                resultMap.put("msg","success");
                resultMap.put("code",0);
                return resultMap;
            } else {
                resultMap.put("msg","删除失败");
                resultMap.put("code",1);
            }
        } else {
            resultMap.put("msg","产品号为空");
            resultMap.put("code",2);
        }
        return resultMap;
    }
    @PostMapping("/upload")
    public String uploadProduct(@SessionAttribute("user")User user,
                              @RequestParam("photo") MultipartFile file,
                              @Valid UploadProductFrom productForm,BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for (ObjectError e:allErrors) {
                log.info("【上传商品】"+e.getDefaultMessage());
            }
            return "error";
        }
        boolean upload = false;
        try {
            upload = productSercice.upload(user.getUserId(), productForm, file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (upload) {
            return "success";
        }
        return "error";
    }
}

