package com.example.demotest.service;

import com.example.demotest.entity.Contact;
import com.example.demotest.repository.ContactRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.stereotype.Service;

@Service
public class ContactService {
    private final ContactRepository contactRepository;

    public ContactService(ContactRepository contactRepository) {
        this.contactRepository = contactRepository;
    }

    public void inject() {
        contactRepository.saveAll(getContactsList());
    }

    public void create(Contact contact) {
        contactRepository.save(contact);
    }

    public void delete(Long id) {
        contactRepository.deleteById(id);
    }

    public void update(Long id, Contact contact) {
        Optional<Contact> existing = contactRepository.findById(id);
        existing.ifPresent(value -> contact.setId(value.getId()));
        contactRepository.save(contact);
    }

    public List<Contact> getAll() {
        return contactRepository.findAll();
    }

    private List<Contact> getContactsList() {
        Contact contactJohn = new Contact();
        contactJohn.setName("John");
        contactJohn.setSurname("Doe");
        contactJohn.setPhoneNumber("0666666666");

        Contact contactJane = new Contact();
        contactJane.setName("Jane");
        contactJane.setSurname("Doe");
        contactJane.setPhoneNumber("0677777777");

        Contact contactBob = new Contact();
        contactBob.setName("Bod");
        contactBob.setSurname("Alison");
        contactBob.setPhoneNumber("0933333333");

        Contact contactAlice = new Contact();
        contactAlice.setName("Alice");
        contactAlice.setSurname("Alison");
        contactAlice.setPhoneNumber("0999999999");

        Contact contactSmith = new Contact();
        contactSmith.setName("John");
        contactSmith.setSurname("Smith");
        contactSmith.setPhoneNumber("0931111111");

        return List.of(contactJohn, contactJane, contactBob, contactAlice, contactSmith);
    }
}
