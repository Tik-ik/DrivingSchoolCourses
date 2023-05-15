package com.base.config.home;
/**
 * 用来配置前台拦截器的配置类
 */
import com.base.constant.RuntimeConstant;
import com.base.interceptor.home.HomeLoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class HomeWebConfig implements WebMvcConfigurer {
	
	@Autowired
	private HomeLoginInterceptor homeLoginInterceptor;

	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	    registry.addInterceptor(homeLoginInterceptor).addPathPatterns("/**").excludePathPatterns(RuntimeConstant.homeLoginExcludePathPatterns);
	}

}
