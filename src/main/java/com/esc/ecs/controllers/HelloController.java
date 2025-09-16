package com.esc.ecs.controllers;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/")
    public String hello() {
        return "App is running with Spring Boot! and updated blue green";
    }
    @GetMapping("/health")
    public String health() {
        return "App is healthy!";
    }
}
