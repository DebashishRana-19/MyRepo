package com.FitnessApplication.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.FitnessApplication.model.Goal;
import com.FitnessApplication.model.User;
import com.FitnessApplication.repository.GoalRepository;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/goals")
public class GoalController {

    @Autowired
    private GoalRepository goalRepository;

    @GetMapping
    public String listGoals(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        model.addAttribute("goals", goalRepository.findByUserId(user.getId()));
        model.addAttribute("username", user.getUsername());
        model.addAttribute("pageTitle", "Goals");
        return "goals";
    }

    @GetMapping("/add")
    public String showAddForm(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        model.addAttribute("goal", new Goal());
        model.addAttribute("username", user.getUsername());
        model.addAttribute("pageTitle", "Add Goal");
        return "add-goal";
    }

    @PostMapping("/add")
    public String addGoal(@ModelAttribute Goal goal, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        goal.setUser(user);
        goalRepository.save(goal);
        return "redirect:/goals";
    }
}
