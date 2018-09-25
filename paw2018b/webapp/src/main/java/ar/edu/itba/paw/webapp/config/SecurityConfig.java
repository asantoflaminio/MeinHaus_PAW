package ar.edu.itba.paw.webapp.config;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
@ComponentScan("ar.edu.itba.paw.webapp.auth")
public class SecurityConfig {
	
	@Order(1)
	@Configuration
	public static class WebAuthConfig extends WebSecurityConfigurerAdapter {
		
		@Autowired
		private UserDetailsService userDetailsService;
		
		@Override
		protected void configure(final HttpSecurity http) throws Exception {
		http.antMatcher("/hello/**")
		.userDetailsService(userDetailsService)
		.sessionManagement()
		.invalidSessionUrl("/hello/home")
		.and().authorizeRequests()
		.antMatchers("/hello/home").permitAll()
		.antMatchers("/hello/**").authenticated()
		.and().formLogin()
		.usernameParameter("j_username")
		.passwordParameter("j_password")
		.loginPage("/hello/home")
		.defaultSuccessUrl("/hello/home", false)
		.failureUrl("/hello/home?error")
		.and().rememberMe()
		.userDetailsService(userDetailsService)
		.key("mysupersecretketthatnobodyknowsabout") //esto hay q modificar porqeu sino chau tp
		.tokenValiditySeconds((int) TimeUnit.DAYS.toSeconds(30))
		.and().exceptionHandling()
		.accessDeniedPage("/hello/403")
		.and().csrf().disable();
		}
		
		@Override
		public void configure(final WebSecurity web) throws Exception {
		web.ignoring()
		.antMatchers("/css/**", "/js/**", "/img/**","/favicon.ico", "/403");
		}
		
		public String encryptKey(String username) throws NoSuchAlgorithmException {
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
			messageDigest.update(username.getBytes());
			String encryptedString = new String(messageDigest.digest());
			return encryptedString;
		}
	}
	
	@Configuration
	@Order(2)
	public static class WebAuthConfigSignUp extends WebSecurityConfigurerAdapter {

		@Autowired
		private UserDetailsService userDetailsService;
		
		@Override
		protected void configure(final HttpSecurity http) throws Exception {
		http.antMatcher("/signUp/**")
		.userDetailsService(userDetailsService)
		.sessionManagement()
		.invalidSessionUrl("/signUp/signUp")
		.and().authorizeRequests()
		.antMatchers("/signUp/**").permitAll()
		.and().formLogin()
		.usernameParameter("j_username")
		.passwordParameter("j_password")
		.loginPage("/signUp/signUp")
		.defaultSuccessUrl("/hello/home", false)
		.failureUrl("/signUp/signUp?error")
		.and().rememberMe()
		.rememberMeParameter("j_rememberme")
		.userDetailsService(userDetailsService)
		.key("mysupersecretketthatnobodyknowsabout") //esto hay q modificar porqeu sino chau tp
		.tokenValiditySeconds((int) TimeUnit.DAYS.toSeconds(30))
		.and().exceptionHandling()
		.accessDeniedPage("/hello/403")
		.and().csrf().disable();
		}
		
		@Override
		public void configure(final WebSecurity web) throws Exception {
		web.ignoring()
		.antMatchers("/css/**", "/js/**", "/img/**","/favicon.ico", "/403");
		}
		
		public String encryptKey(String username) throws NoSuchAlgorithmException {
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
			messageDigest.update(username.getBytes());
			String encryptedString = new String(messageDigest.digest());
			return encryptedString;
		}
		
		
	}



}
