package com.DemoStudent.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.DemoStudent.Entity.Student;
import com.DemoStudent.service.StudentService;

@RestController
@RequestMapping("/students")
public class StudentController {

	@Autowired
	private StudentService service;
	
	@PostMapping("/save")
	public Student saveData(@RequestBody Student student) {
		return service.saveStudent(student);
	}
	
	@PutMapping("/update")
	public String updateData(@RequestBody Student student) {
		service.updateStudent(student);
		return "Data Upadted";
	}
	
	@GetMapping("/get")
	public List<Student> getAllStudents(){
		return service.getStudent();
	}
	
	@DeleteMapping("/delete/{id}")
	public String deleteStudent(@PathVariable int id) {
		service.deleteStudent(id);
		return "Data Deleted";
	}
}