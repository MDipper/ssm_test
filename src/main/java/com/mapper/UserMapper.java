package com.mapper;

import java.util.List;

import com.model.User;

public interface UserMapper {
	int addUser(User user);
	int checkUserByUsername(String username);
	int checkUsernamePassword(User user);
	List<User> findAllUser();
}
