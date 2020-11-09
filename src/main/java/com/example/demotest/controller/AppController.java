package com.example.demotest.controller;

import com.example.demotest.service.ContactService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
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
    public String getUserPage() {
        return "user";
    }

    @GetMapping("/admin")
    public String getAdminPage() {
        return "admin";
    }

    @GetMapping("/denied")
    public String getAccessDeniedPage() {
        return "denied";
    }

//    @GetMapping("/test")
//    public String test() {
////        Contact contact = new Contact();
////        contact.setName("John");
////        contact.setSurname("Doe");
////        contact.setPhone("0677777777");
////        repository.save(contact);
////        return repository.findById(1L).get().toString();
//
//        contactService.inject();
//        return contactService.getContact(1L).toString();
//    }
}
