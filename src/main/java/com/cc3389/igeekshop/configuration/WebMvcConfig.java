package com.cc3389.igeekshop.configuration;

import com.cc3389.igeekshop.interceptor.CookieInterceptor;
import com.cc3389.igeekshop.interceptor.UserInterceptor;
import com.cc3389.igeekshop.interceptor.VisitorInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private CookieInterceptor cookieInterceptor;

    @Autowired
    private VisitorInterceptor visitorInterceptor;

    @Autowired
    private UserInterceptor userInterceptor;

    public void addInterceptors(InterceptorRegistry registry) {
        //定义需要拦截的路径
        String[] cookieAddPathPatterns = {
                "/**",
        };
        String[] cookieExcludePathPatterns = {
                "/login",
                "/register",
                "/shopRegister"
        };
        registry.addInterceptor(cookieInterceptor)
                .addPathPatterns(cookieAddPathPatterns)
                .excludePathPatterns(cookieExcludePathPatterns);

        String[] visitorAddPathPatterns = {
                "/shoppingcart/**",
                "/address/**",
                "/order/**",
                "/orderDetail/**",
        };
        registry.addInterceptor(visitorInterceptor)
                .addPathPatterns(visitorAddPathPatterns);

        String[] userAddPathPatterns = {
                "/manage",
                "/upload",
        };
        registry.addInterceptor(userInterceptor)
                .addPathPatterns(userAddPathPatterns);

    }
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //需要添加映射的绝对路径（路径最后的/一定要加）
        String imgPath = "D:\\IDEA workplace\\igeekshop\\src\\main\\resources\\static\\images/";
        //设置映射规则，源路径（ResourceLocations）被设置成可以通过映射路径（ip:port/images）来访问
        registry.addResourceHandler("/images/**").
                addResourceLocations("file:" + imgPath);
    }
}
