package com.ToDoApplication.repository;

//import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ToDoApplication.model.UserEntity;

@Repository
public interface UserDao extends JpaRepository<UserEntity, String>{
	UserEntity findByName( String username);
//	Optional<UserEntity> findByUsernameAndPassword(String username, String password);

}
