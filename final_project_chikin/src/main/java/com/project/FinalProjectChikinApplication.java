package com.project;


import com.project.config.listener.SessionListener;
import jakarta.servlet.http.HttpSessionListener;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class FinalProjectChikinApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(FinalProjectChikinApplication.class, args);
	}

	@Bean
	public HttpSessionListener httpSessionListener() {
		return new SessionListener();
	}

}
