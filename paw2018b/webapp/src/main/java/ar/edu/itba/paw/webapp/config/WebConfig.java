package ar.edu.itba.paw.webapp.config;

import java.nio.charset.StandardCharsets;

import javax.sql.DataSource;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@EnableWebMvc
@ComponentScan({ "ar.edu.itba.paw.webapp.controller", "ar.edu.itba.paw.services", "ar.edu.itba.paw.persistence" })
@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
	@Bean
	public ViewResolver viewResolver() {
		final InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/jsp/");
		viewResolver.setSuffix(".jsp");
		
		
		return viewResolver;
	}
	
	//Creo q hay que cambiar lo de abajo para que sea la base de datos nuestra
	
	@Bean
	public static DataSource dataSource() {
		final SimpleDriverDataSource ds = new SimpleDriverDataSource();
		ds.setDriverClass(org.postgresql.Driver.class);
		ds.setUrl("jdbc:postgresql://localhost/postgres");
		ds.setUsername("postgres");
		ds.setPassword("Bvma141511");
		return ds;
	}
	
	@Bean
	public MessageSource messageSource() {
		final ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("classpath:i18n/messages");
		messageSource.setDefaultEncoding(StandardCharsets.UTF_8.displayName());
		messageSource.setCacheSeconds(5);
		return messageSource;
	}
}