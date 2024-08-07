package com.gcuconnect;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableOpenApi
public class GcuConnectApplication {
	public static void main(String[] args) {
		SpringApplication.run(GcuConnectApplication.class, args);
	}
	
}
