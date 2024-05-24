package com.glow.banana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/loginForm")
    public String loginForm() {
        return "loginForm";
    }
}
