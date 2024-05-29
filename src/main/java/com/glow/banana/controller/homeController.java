package com.glow.banana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class homeController {
    @GetMapping("/loginForm")
    public String loginForm() {
        return "loginForm";
    }

    @GetMapping("/deliveryForm")
    public String deliveryForm() {
        return "deliveryForm";
    }


    @GetMapping("/deliveryAdd")
    public String deliveryAdd() {
        return "deliveryAdd";
    }

    @GetMapping("/clickForm")
    public String clickFrom(){
        return "clickForm";
    }
}
