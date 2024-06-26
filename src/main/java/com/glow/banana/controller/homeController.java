package com.glow.banana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping("/shareForm")
    public String shareForm() {
        return "shareForm";
    }


    @GetMapping("/deliveryAdd")
    public String deliveryAdd() {
        return "deliveryAdd";
    }

    @GetMapping("/clickForm")
    public String clickFrom(@RequestParam(name = "id", required = false) String id, Model model) {
        model.addAttribute("id", id);
        return "clickForm";
    }

    @GetMapping("/chatList")
    public String chatList(){
        return "chatList";
    }

    @GetMapping("/chatForm")
    public String chatForm(@RequestParam(name = "id", required = false) String id, Model model){
        model.addAttribute("id",id);
        return "chatForm";
    }

    @GetMapping("/userInformation")
    public String userInformation(){
        return "userInformation";
    }
}
