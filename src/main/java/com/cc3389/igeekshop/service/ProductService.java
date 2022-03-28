package com.cc3389.igeekshop.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.cc3389.igeekshop.entity.Product;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cc3389.igeekshop.form.GetProductPageForm;
import com.cc3389.igeekshop.form.UploadProductFrom;
import com.cc3389.igeekshop.vo.CartVO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author cc3389
 * @since 2022-01-23
 */
public interface ProductService extends IService<Product> {

    void subSurplus(List<CartVO> carts);

    IPage<Product> getPage(Integer userId, GetProductPageForm productPageForm);

    boolean upload(Integer userId, UploadProductFrom productForm, MultipartFile file) throws IOException;
}
