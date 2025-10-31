package com.FitnessApplication.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.FitnessApplication.model.User;
import com.FitnessApplication.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.FitnessApplication.model.User;
import com.FitnessApplication.repository.UserRepository;
import com.FitnessApplication.repository.WorkoutRepository;
import com.FitnessApplication.repository.GoalRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private WorkoutRepository workoutRepository;

    @Autowired
    private GoalRepository goalRepository;

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("pageTitle", "Register");
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") User user) {
        userRepository.save(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("pageTitle", "Login");
        return "login";
    }

    @PostMapping("/login")
    public String loginUser(@ModelAttribute("user") User user, Model model, HttpSession session) {
        return userRepository.findByUsername(user.getUsername())
            .filter(u -> u.getPassword().equals(user.getPassword()))
            .map(u -> {
                session.setAttribute("loggedInUser", u);
                return "redirect:/home";
            })
            .orElseGet(() -> {
                model.addAttribute("error", "Invalid username or password");
                model.addAttribute("pageTitle", "Login");
                return "login";
            });
    }

    @GetMapping("/home")
    public String showDashboard(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        long totalWorkouts = workoutRepository.findByUserId(user.getId()).size();
        long totalGoals = goalRepository.findByUserId(user.getId()).size();

        model.addAttribute("totalWorkouts", totalWorkouts);
        model.addAttribute("totalGoals", totalGoals);
        model.addAttribute("username", user.getUsername());
        model.addAttribute("pageTitle", "Dashboard");

        return "home";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
