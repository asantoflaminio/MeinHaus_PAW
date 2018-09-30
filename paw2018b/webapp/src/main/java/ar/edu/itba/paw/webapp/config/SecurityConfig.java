package ar.edu.itba.paw.webapp.config;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
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
	
	@Order(2)
	@Configuration
	public static class WebAuthConfig extends WebSecurityConfigurerAdapter {
		
		@Autowired
		private UserDetailsService userDetailsService;
		
		@Override
		protected void configure(final HttpSecurity http) throws Exception {
		http.antMatcher("/meinHaus/**")
		.userDetailsService(userDetailsService)
		.sessionManagement()
		.invalidSessionUrl("/meinHaus/home")
		.and().authorizeRequests()
		.antMatchers("/meinHaus/publish*").authenticated()
		.antMatchers("/meinHaus/profile").authenticated()
		.anyRequest().permitAll()
		.and().formLogin()
		.usernameParameter("j_username")
		.passwordParameter("j_password")
		.loginPage("/meinHaus/home")
		.defaultSuccessUrl("/meinHaus/home", false)
		.failureUrl("/meinHaus/home?error=true")
		.and().rememberMe().rememberMeParameter("j_rememberme")
		.userDetailsService(userDetailsService)
		.key(encryptKey(randomAlphaNumeric(Math.round(Math.random()*10+1))))
		.tokenValiditySeconds((int) TimeUnit.DAYS.toSeconds(30))
		.and().logout()
		.logoutUrl("/meinHaus/logout")
		.logoutSuccessUrl("/meinHaus/home")
		.and().exceptionHandling()
		.accessDeniedPage("/meinHaus/403")
		.and().csrf().disable();
		}
		
		@Override
		public void configure(final WebSecurity web) throws Exception {
		web.ignoring()
		.antMatchers("/css/**", "/js/**", "/img/**","/favicon.ico", "/403");
		}
		
		public static String encryptKey(String username) throws NoSuchAlgorithmException {
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-512");
			byte[] hash = messageDigest.digest(username.getBytes(StandardCharsets.UTF_8));
			String encryptedString = new String(hash);
			return encryptedString;
		}
		

		
		public static String randomAlphaNumeric(long count) {
			final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			StringBuilder builder = new StringBuilder();
			
			while (count-- != 0) {
				int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
				builder.append(ALPHA_NUMERIC_STRING.charAt(character));
			}
			return builder.toString();
		}
	}
	
	@Configuration
	@Order(1)
	public static class WebAuthConfigSignUp extends WebSecurityConfigurerAdapter {

		@Autowired
		private UserDetailsService userDetailsService;
		
		@Override
		protected void configure(final HttpSecurity http) throws Exception {
		http.antMatcher("/meinHaus/signUp/**")
		.userDetailsService(userDetailsService)
		.sessionManagement()
		.invalidSessionUrl("/meinHaus/signUp")
		.and().authorizeRequests()
		.antMatchers("/meinHaus/signUp/**").permitAll()
		.and().formLogin()
		.usernameParameter("j_username")
		.passwordParameter("j_password")
		.loginPage("/meinHaus/signUp")
		.defaultSuccessUrl("/meinHaus/home", false)
		.failureUrl("/meinHaus/signUp?error=true")
		.and().rememberMe()
		.rememberMeParameter("j_rememberme")
		.userDetailsService(userDetailsService)
		.key(encryptKey(randomAlphaNumeric(Math.round(Math.random()*32+1))))
		.tokenValiditySeconds((int) TimeUnit.DAYS.toSeconds(30))
		.and().logout()
		.logoutUrl("/meinHaus/logout")
		.logoutSuccessUrl("/meinHaus/home")
		.and().exceptionHandling()
		.accessDeniedPage("/meinHaus/403")
		.and().csrf().disable();
		}
		
		@Override
		public void configure(final WebSecurity web) throws Exception {
		web.ignoring()
		.antMatchers("/css/**", "/js/**", "/img/**","/favicon.ico", "/403");
		}
		
		public static String encryptKey(String username) throws NoSuchAlgorithmException {
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-512");
			byte[] hash = messageDigest.digest(username.getBytes(StandardCharsets.UTF_8));
			String encryptedString = new String(hash);
			return encryptedString;
		}
		

		
		public static String randomAlphaNumeric(long count) {
			final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			StringBuilder builder = new StringBuilder();
			
			while (count-- != 0) {
				int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
				builder.append(ALPHA_NUMERIC_STRING.charAt(character));
			}
			return builder.toString();
		}
		
		
	}



}
