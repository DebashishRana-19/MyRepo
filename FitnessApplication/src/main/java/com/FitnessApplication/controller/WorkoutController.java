package com.FitnessApplication.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.FitnessApplication.model.User;
import com.FitnessApplication.model.Workout;
import com.FitnessApplication.repository.WorkoutRepository;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/workouts")
public class WorkoutController {

    @Autowired
    private WorkoutRepository workoutRepository;

    @GetMapping
    public String listWorkouts(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        model.addAttribute("workouts", workoutRepository.findByUserId(user.getId()));
        model.addAttribute("username", user.getUsername());
        model.addAttribute("pageTitle", "Workouts");
        return "workouts";
    }

    @GetMapping("/add")
    public String showAddForm(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        model.addAttribute("workout", new Workout());
        model.addAttribute("username", user.getUsername());
        model.addAttribute("pageTitle", "Add Workout");
        return "add-workout";
    }

    @PostMapping("/add")
    public String addWorkout(@ModelAttribute Workout workout, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        workout.setUser(user);
        workoutRepository.save(workout);
        return "redirect:/workouts";
    }
}
