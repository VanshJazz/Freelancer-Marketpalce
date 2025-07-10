package com.javaproject.controller;

import com.javaproject.model.Freelancer;
import com.javaproject.repository.FreelancerRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class FreelancerController {

    @Autowired
    private FreelancerRepository freelancerRepository;

    @GetMapping("/")
    public String home() {
        return "index";
    }
    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/register")
    public String checkFreelancerAccess(HttpSession session, Model model) {
        Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");

        if (isLoggedIn == null || !isLoggedIn) {
            return "redirect:/login";
        }

        Boolean isFreelancer = (Boolean) session.getAttribute("isFreelancer");
        if (isFreelancer != null && isFreelancer) {
            return "register";
        } else {
            model.addAttribute("error", "You need to login as a freelancer to register for services.");
            return "accessDenied";
        }
    }

    @PostMapping("/register")
    public String registerFreelancer(@ModelAttribute Freelancer freelancer) {
        freelancerRepository.save(freelancer);
        return "redirect:/freelancers";
    }

    @GetMapping("/freelancers")
    public String viewFreelancers(Model model) {
        model.addAttribute("freelancers", freelancerRepository.findAll());
        return "freelancers";
    }
    @GetMapping("/registerFreelancer")
    public String registerFreelancer(HttpSession session, Model model) {
        Boolean isFreelancer = (Boolean) session.getAttribute("isFreelancer");

        if (isFreelancer != null && isFreelancer) {
            return "registerFreelancer"; 
        } else {
            model.addAttribute("error", "You need to login as a freelancer to register for services.");
            return "accessDenied";
        }
    }
    @GetMapping("/help")
    public String help() {
        return "help";
    }

}
