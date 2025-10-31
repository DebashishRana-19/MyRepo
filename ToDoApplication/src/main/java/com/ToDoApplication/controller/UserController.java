package com.ToDoApplication.controller;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ToDoApplication.binding.LoginUser;
import com.ToDoApplication.binding.User;
import com.ToDoApplication.model.UserEntity;
import com.ToDoApplication.repository.UserDao;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserDao dao;

	@GetMapping("/showform")
	public String showregisterform(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}

	@PostMapping("/saveuser")
	public String registeruser(User user, Model model) {

		UserEntity entity = new UserEntity();
		BeanUtils.copyProperties(user, entity);
		UserEntity save = dao.save(entity);
		if (save != null) {
			System.out.println("data saved!!! but login not trigger!!!");
			model.addAttribute("user", new LoginUser());
			return "login";
		} else {
			model.addAttribute("msg", "Regsitration Failed Try Again!!!!!");
			return "register";
		}
	}

	// Display login page
	@GetMapping("/login")
	public String showLoginPage(Model model) {
		model.addAttribute("user", new LoginUser());
		return "login";
	}
	

	@PostMapping("/login")
	public String login(LoginUser user, Model model, HttpSession session) {
		String username = user.getUsername();
		String paswd = user.getPassword();

		UserEntity dbUser = dao.findByName(username);

		if (dbUser != null) {
			session.setAttribute("user", dbUser.getName());
			session.setAttribute("paswd", dbUser.getPswd());
			return "home"; // success
		} else {
			model.addAttribute("user", new LoginUser());
			model.addAttribute("msg", "LOGIN FAILED!!!!!");
			return "login"; // failure
		}

	}

	@GetMapping("/signout")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("msg", "Logout successfull!!!");
		model.addAttribute("user", new LoginUser());
		return "login";
	}

}
