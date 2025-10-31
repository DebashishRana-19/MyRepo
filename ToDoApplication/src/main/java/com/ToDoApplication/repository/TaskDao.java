package com.ToDoApplication.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ToDoApplication.model.TaskEntity;
import com.ToDoApplication.model.UserEntity;

@Repository
public interface TaskDao extends JpaRepository<TaskEntity, String>{
	List<TaskEntity> findByUserEntity(UserEntity userEntity);

	void deleteById(String taskname);

	Optional<TaskEntity> findById(String taskname);
}
