package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.User;
import com.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value="/add")
	public Map<String,Object> addUser(HttpServletRequest request,HttpServletResponse response) throws IOException{
		 String username_= request.getParameter("name").trim();
		 String password_ = request.getParameter("pwd").trim();
		 System.out.println(username_);
		 Map<String,Object> map = new HashMap<String,Object>();  
	/*	if (userService.CheckUserByUsername(username_) == 0) {
			User user = new User(username_, password_);
			int id = userService.addUser(user);*/
		 if(username_.equals("2")){
			 map.put("msg", "成功");			
		} else
		{
			  map.put("msg", "失败"); 
		}
		System.out.println(map);
		return map;
	}
}
