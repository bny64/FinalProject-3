package com.example.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages={"com.example.controller"})
@EnableWebMvc
public class MvcConfig extends WebMvcConfigurerAdapter{

	@Bean
	public ViewResolver internalResourceViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/view/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver(){
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("utf-8");
		return resolver;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/img/**")
		.addResourceLocations("/WEB-INF/assets/images/")
		.setCachePeriod(60 * 60 * 24 * 365);
		
		registry.addResourceHandler("/css/**")
		.addResourceLocations("/WEB-INF/assets/css/");
		
		registry.addResourceHandler("/fonts/**")
		.addResourceLocations("/WEB-INF/assets/fonts/");
		
		registry.addResourceHandler("/js/**")
		.addResourceLocations("/WEB-INF/assets/js/");
	}
	
}
