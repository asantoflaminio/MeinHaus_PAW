package ar.edu.itba.paw.services;

import org.mockito.Mockito;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import ar.edu.itba.paw.interfaces.UserDao;

@ComponentScan({ "ar.edu.itba.paw.services", "ar.edu.itba.paw.persistence" })
@Configuration
public class TestConfig {
	
	
}