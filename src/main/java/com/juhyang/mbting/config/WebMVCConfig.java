package com.juhyang.mbting.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.juhyang.mbting.common.FileManagerService;
import com.juhyang.mbting.common.PermissionInterceptor;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {
  @Autowired
  PermissionInterceptor permissionInterceptor;

  // 컴퓨터(서버)내 특정 경로를 클라이언트(브라우저) 에서 특정 path로 접근 하도록 하는 설정
  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/images/**") // 클라이언트에서 접근하도록 하는 path
        .addResourceLocations("file://" + FileManagerService.FILE_UPLOAD_PATH);
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(permissionInterceptor).addPathPatterns("/**") // 어떤 path가 인터셉터를 거쳐서 수행될지 설정

        .excludePathPatterns("/static/**", "/images/**", "/user/sign_out"); // 제외할 path
  }

}
