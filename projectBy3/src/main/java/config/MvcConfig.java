package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages={"controller"}) // <context:component-scan base-package="com.example.controller"/>
@EnableWebMvc //<mvc:annotation-driven />
//mvc-config.xml을 대체
public class MvcConfig extends WebMvcConfigurerAdapter{

	/*@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/img/**")
		.addResourceLocations("/WEB-INF/images/")
		.setCachePeriod(60 * 60 * 24 * 365);
		
		registry.addResourceHandler("/css/**")
		.addResourceLocations("/WEB-INF/assets/css/");
		
		registry.addResourceHandler("/fonts/**")
		.addResourceLocations("/WEB-INF/assets/fonts/");
		
		registry.addResourceHandler("/js/**")
		.addResourceLocations("/WEB-INF/assets/js/");
	}*/
	
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
		
		/*registry.addResourceHandler("/layout/**")
		.addResourceLocations("/WEB-INF/layout/");*/
	}
	
	@Bean
	public ViewResolver InternalResourceViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/view/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/searchIdPage").setViewName("searchId");
		registry.addViewController("/searchPassPage").setViewName("searchPass");
		registry.addViewController("/setupPage").setViewName("setup");
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver(){
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("utf-8");
		resolver.setMaxUploadSize(1024*1024*1024);
		return resolver;
	}
	/*<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
	        <!-- Example: a logical view name of 'showMessage' is mapped to '/WEB-INF/jsp/showMessage.jsp' -->
	        <property name="prefix" value="/WEB-INF/view/"/>
	        <property name="suffix" value=".jsp"/>
	</bean>*/
}
