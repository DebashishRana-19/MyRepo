package com.DemoStudent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DemoStudent.Entity.Student;
import com.DemoStudent.repository.StudentRepository;

@Service
public class StudentServiceImplementation implements StudentService{

	@Autowired
	private StudentRepository studentRepo;
	
	@Override
	public Student saveStudent(Student student) {
		return studentRepo.save(student);
	}

	@Override
	public void updateStudent(Student student) {
		int id = student.getId();
		if(id != 0) {
			studentRepo.save(student);
		}
	}

	@Override
	public List<Student> getStudent() {
		
		return studentRepo.findAll();
	}

	@Override
	public void deleteStudent(int id) {
		studentRepo.deleteById(id);
	}

}
