package com.javaproject.controller;

import com.javaproject.model.User;
import com.javaproject.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("error", null);  // Clear previous error
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String email,
                               @RequestParam String password,
                               HttpSession session,
                               Model model) {

        User user = userRepository.findByEmail(email);

        if (user != null && user.getPassword().equals(password)) {  // In production, use hashed password comparison!
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("userName", user.getName());
            session.setAttribute("isFreelancer", user.isFreelancer());
            return "redirect:/"; // logged in, redirect to home or dashboard
        } else {
            model.addAttribute("error", "Invalid email or password.");
            return "login";  // reload login page with error message
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // This will remove all session attributes including isLoggedIn
        return "redirect:/login"; // redirect to login page after logout
    }

}
