package com.DemoStudent.service;

import java.util.List;

import com.DemoStudent.Entity.Student;

public interface StudentService {
	public Student saveStudent(Student student);
	public void updateStudent(Student student);
	public List<Student> getStudent();
	public void deleteStudent(int id);
}
