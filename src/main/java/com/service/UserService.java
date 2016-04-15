package com.service;

import java.util.List;

import com.model.User;

public interface UserService {
	
	int addUser(User user);
	int checkUserByUsername(String username);
	int checkUsernamePassword(User user);
}
