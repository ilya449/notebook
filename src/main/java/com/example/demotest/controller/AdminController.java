package com.example.demotest.controller;

import com.example.demotest.entity.Contact;
import com.example.demotest.service.ContactService;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
@Log4j
public class AdminController {
    private final ContactService contactService;

    public AdminController(ContactService contactService) {
        this.contactService = contactService;
    }

    @GetMapping("/admin")
    public String getAdminPage(Model model) {
        model.addAttribute("contacts", contactService.getAll());
        return "admin";
    }

    @PostMapping("/admin/create")
    public String createContact(@ModelAttribute("contact") Contact contact, Model model) {
        contactService.create(contact);
        log.info("Created new contact: " + contact);
        return "redirect:/admin";
    }

    @PostMapping("/admin/update/{id}")
    public String updateContact(@PathVariable Long id,
                                @ModelAttribute("contact") Contact contact, Model model) {
        contactService.update(id, contact);
        log.info("Updated contact: " + contact);
        return "redirect:/admin";
    }

    @GetMapping("/admin/delete/{id}")
    public String deleteContact(@PathVariable Long id, Model model) {
        contactService.delete(id);
        log.info("Deleted contact with id: " + id);
        return "redirect:/admin";
    }
}
