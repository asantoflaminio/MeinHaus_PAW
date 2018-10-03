package ar.edu.itba.paw.webapp.config;

import java.nio.charset.StandardCharsets;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.jdbc.datasource.init.DataSourceInitializer;
import org.springframework.jdbc.datasource.init.DatabasePopulator;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import ar.edu.itba.paw.interfaces.FileUploadDao;
import ar.edu.itba.persistence.FileUpload;

@EnableWebMvc
@ComponentScan({ "ar.edu.itba.paw.webapp.controller", "ar.edu.itba.paw.services", "ar.edu.itba.paw.persistence", "ar.edu.itba.paw.webapp.models" })
@Configuration
@EnableTransactionManagement
public class WebConfig extends WebMvcConfigurerAdapter {
	@Value("classpath:schema.sql")
    private Resource scriptSql;
	
	@Bean
	public DataSourceInitializer dataSourceInitializer(final DataSource ds) {
		final DataSourceInitializer dsi = new DataSourceInitializer();
		dsi.setDataSource(ds);
		dsi.setDatabasePopulator(databasePopulator());
		return dsi;
	}
	
	@Bean
	public LocalSessionFactoryBean sessionFactory() {
	   LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
	   sessionFactory.setDataSource(dataSource());
	   sessionFactory.setPackagesToScan(
	       new String[] { "ar.edu.itba.paw"  }
	   );
	   //sessionFactory.setHibernateProperties(hibernateProperties());

	   return sessionFactory;
	}

	@Autowired
	@Bean(name = "fileUploadDao")
	public FileUploadDao getUserDao(SessionFactory sessionFactory) {
	    return new FileUpload(sessionFactory);
	}

	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver getCommonsMultipartResolver() {
	    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
	    multipartResolver.setMaxUploadSize(20971520);   // 20MB
	    multipartResolver.setMaxInMemorySize(1048576);  // 1MB
	    return multipartResolver;
	}
	
	
	private DatabasePopulator databasePopulator() {
		final ResourceDatabasePopulator dbp = new ResourceDatabasePopulator();
		dbp.addScript(scriptSql);
		return dbp;
	}
	
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
	
	@Bean
	@Autowired
	public HibernateTransactionManager transactionManager(
	    SessionFactory sessionFactory) {
	    HibernateTransactionManager txManager = new HibernateTransactionManager();
	    txManager.setSessionFactory(sessionFactory);
	    return txManager;
	}
	
	//Creo q hay que cambiar lo de abajo para que sea la base de datos nuestra
	
	@Bean
	public static DataSource dataSource() {
		final SimpleDriverDataSource ds = new SimpleDriverDataSource();
		ds.setDriverClass(org.postgresql.Driver.class);
		
		ds.setUrl("jdbc:postgresql://localhost/postgres");
		ds.setUsername("postgres");
		ds.setPassword("3296");
		
//		ds.setUrl("jdbc:postgresql://localhost/paw-2018b-10");
//		ds.setUsername("paw-2018b-10");
//		ds.setPassword("eWAh0kb4x");
		return ds;
	}
	
	@Bean
	public MessageSource messageSource() {
		final ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("resources/i18n/messages");
		messageSource.setDefaultEncoding(StandardCharsets.UTF_8.displayName());
		messageSource.setCacheSeconds(5);
		return messageSource;
	}
	
	
    @Bean
    public JavaMailSender getMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
 
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        mailSender.setUsername("meinhauspaw@gmail.com");
        mailSender.setPassword("pawgrupo10");
 
        Properties javaMailProperties = new Properties();
        javaMailProperties.put("mail.smtp.starttls.enable", "true");
        javaMailProperties.put("mail.smtp.auth", "true");
        javaMailProperties.put("mail.transport.protocol", "smtp");
        javaMailProperties.put("mail.debug", "true");
        javaMailProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
 
        mailSender.setJavaMailProperties(javaMailProperties);
        return mailSender;
    }
}
