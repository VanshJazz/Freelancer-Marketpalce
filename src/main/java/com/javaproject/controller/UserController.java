package com.javaproject.controller;

import com.javaproject.model.User;
import com.javaproject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/signup")
    public String showSignupForm(Model model) {
        model.addAttribute("user", new User());
        return "signup";
    }

    @PostMapping("/signup")
    public String processSignup(@ModelAttribute User user, Model model) {
        if (userRepository.findByEmail(user.getEmail()) != null) {
            model.addAttribute("error", "Email already exists");
            return "signup";
        }

        
        if (!user.isFreelancer()) {
            user.setInterestField(null);
        }

        userRepository.save(user);
        return "redirect:/login";
    }

    
}
