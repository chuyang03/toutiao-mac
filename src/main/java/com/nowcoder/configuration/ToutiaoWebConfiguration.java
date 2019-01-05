package com.nowcoder.configuration;

import com.nowcoder.interceptor.LoginRequiredInterceptor;
import com.nowcoder.interceptor.PassportInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 *   注册拦截器
 */
@Component
public class ToutiaoWebConfiguration extends WebMvcConfigurerAdapter {
    @Autowired
    PassportInterceptor passportInterceptor;

    @Autowired
    LoginRequiredInterceptor loginRequiredInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        //先执行注册用户的拦截器，执行过这个拦截器后，用户的信息被存储在hostholder中，
        // 当下一个拦截器需要获取用户信息时，就可以直接从hostholder中取出来
        registry.addInterceptor(passportInterceptor);

        //这个拦截器可以让没有登陆的用户无法访问某些页面、
        //通过url匹配指定拦截的页面。
        //首先要让前一个拦截器来判断用户的状态，然后根据用户状态执行后续的拦截器
        registry.addInterceptor(loginRequiredInterceptor).addPathPatterns("/setting*");
        super.addInterceptors(registry);
    }
}
