package ar.edu.itba.paw.webapp.config;

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
@Order(2)
public class WebAuthConfigSignUp extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Override
	protected void configure(final HttpSecurity http) throws Exception {
	http.userDetailsService(userDetailsService)
	.sessionManagement()
	.and().authorizeRequests()
	.antMatchers("/hello/signUp").permitAll()
	.and().formLogin()
	.usernameParameter("j_username")
	.passwordParameter("j_password")
	.loginPage("/hello/signUp")
	.defaultSuccessUrl("/hello/home", false)
	.failureUrl("/hello/signUp?error")
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
}
