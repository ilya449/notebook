package com.example.demotest.controller;

import com.example.demotest.entity.Contact;
import com.example.demotest.service.ContactService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
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
        model.addAttribute("message", "Contact " + contact.getName() + " was created!");
        return "redirect:/admin";
    }

    @PostMapping("/admin/update/{id}")
    public String updateContact(@PathVariable Long id,
                                @ModelAttribute("contact") Contact contact, Model model) {
        contactService.update(id, contact);
        model.addAttribute("message", "Contact " + contact.getName() + " was updated!");
        return "redirect:/admin";
    }

    @GetMapping("/admin/delete/{id}")
    public String deleteContact(@PathVariable Long id, Model model) {
        contactService.delete(id);
        model.addAttribute("message", "Contact was deleted!");
        return "redirect:/admin";
    }
}
