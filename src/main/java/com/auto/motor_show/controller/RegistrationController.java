package com.auto.motor_show.controller;


import com.auto.motor_show.repository.UserRepository;
import com.auto.motor_show.repository.entity.Role;
import com.auto.motor_show.repository.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {

        User userFrom = userRepository.findByUsername(user.getUsername());

        if (userFrom != null) {
            model.put("message", "Пользователь существует!!");
            return "registration";
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepository.save(user);


        return "redirect:/login";
    }
}
