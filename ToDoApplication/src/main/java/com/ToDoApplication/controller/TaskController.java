package com.ToDoApplication.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ToDoApplication.binding.Task;
import com.ToDoApplication.model.TaskEntity;
import com.ToDoApplication.model.UserEntity;
import com.ToDoApplication.repository.TaskDao;
import com.ToDoApplication.repository.UserDao;

import jakarta.servlet.http.HttpSession;

@Controller
public class TaskController {
	
	@Autowired
	private UserDao dao;
	
	@Autowired
	private TaskDao taskDao;
	
	@GetMapping("/tasks/new")
	public String showt(Model model)
	{
		System.out.println("hiii");
		model.addAttribute("task", new Task());
		return "task";
	}
	
	@PostMapping("/tasks")
	public String savetask(Model model,Task task,HttpSession session)
	{
		System.out.println("hiii");
		String username=(String)session.getAttribute("user");
		System.out.println(username);
		UserEntity userentity = dao.findByName(username);
		TaskEntity entity=new TaskEntity();
		entity.setUserEntity(userentity);
		BeanUtils.copyProperties(task, entity);
		TaskEntity save = taskDao.save(entity);
if (save!=null) {
	model.addAttribute("msg", "task saved");
	return "home";
}
else
{
	return "task";
}
	}
	
	@GetMapping("/tasks")
	public String viewtasks(HttpSession session,Model model)
	{
		
		String username=(String)session.getAttribute("user");
		UserEntity entity=dao.findByName(username);
		List<TaskEntity> taks=taskDao.findByUserEntity(entity);
		model.addAttribute("tasks", taks);
		return "viewtask";
	}
	
	@GetMapping("/tasks/edit/{name}")
	public String editTask(@PathVariable("name") String name, Model model) {
		TaskEntity entity = taskDao.findById(name).orElse(null);
		if (entity != null) {
			Task task = new Task();
			BeanUtils.copyProperties(entity, task);
			model.addAttribute("task", task);
			model.addAttribute("taskId", name);
			return "task";  // reuse task.html for editing
		}
		return "redirect:/tasks";
	}

	@PostMapping("/tasks/update/{name}")
	public String updateTask(@PathVariable("name") String name, Task task, HttpSession session) {
		TaskEntity entity = taskDao.findById(name).orElse(null);
		if (entity != null) {
			BeanUtils.copyProperties(task, entity);
			String username = (String) session.getAttribute("user");
			UserEntity userentity = dao.findByName(username);
			entity.setUserEntity(userentity);
			taskDao.save(entity);
		}
		return "redirect:/tasks";
	}

	// ----------- Delete Task ----------
	@GetMapping("/tasks/delete/{name}")
	public String deleteTask(@PathVariable("name") String name) {
		taskDao.deleteById(name);
		return "redirect:/tasks";
	}

}
