package com.esc.ecs.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test/welcome")
public class WelcomeController {
    @GetMapping
    public String welcome() {
        return "index.html";
    }
}
