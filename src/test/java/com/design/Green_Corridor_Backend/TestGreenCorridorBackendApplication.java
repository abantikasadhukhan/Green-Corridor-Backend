package com.design.Green_Corridor_Backend;

import org.springframework.boot.SpringApplication;

public class TestGreenCorridorBackendApplication {

	public static void main(String[] args) {
		SpringApplication.from(GreenCorridorBackendApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
