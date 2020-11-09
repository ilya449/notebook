package com.example.demotest.controller;

import com.example.demotest.service.ContactService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class AppController {
    private final ContactService contactService;

    public AppController(ContactService contactService) {
        this.contactService = contactService;
    }

    @GetMapping(value = {"", "/index"})
    public String getIndex() {
        return "index";
    }

    @GetMapping("/user")
    public String getUserPage(Model model) {
        model.addAttribute("contacts", contactService.getAll());
        return "user";
    }

    @GetMapping("/denied")
    public String getAccessDeniedPage() {
        return "denied";
    }

    @GetMapping("/inject")
    public String test(Model model) {
        contactService.inject();
        model.addAttribute("message", "Data was successfully injected!");
        return "index";
    }
}
