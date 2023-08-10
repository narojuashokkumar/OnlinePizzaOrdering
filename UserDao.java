package com.onlinepizza.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.onlinepizza.model.User;

@Repository
public interface UserDao extends JpaRepository<User, Integer> {
	
	User findByEmailidAndPassword(String email, String password);

}
