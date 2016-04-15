package com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.UserMapper;
import com.model.User;
import com.service.UserService;
import com.sun.org.apache.bcel.internal.generic.RETURN;

@SuppressWarnings("restriction")
@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Resource
	public UserMapper userMapper;
	
	@Override
	public int  addUser(User user){
		// TODO Auto-generated method stub
		int userid= userMapper.addUser(user);
		return userid;
	}
	
	@Override
	public int checkUserByUsername(String username) {
		// TODO Auto-generated method stub
		return userMapper.checkUserByUsername(username);
	}
	public int checkUsernamePassword(User user)
	{
		return userMapper.checkUsernamePassword(user);
	}

}
