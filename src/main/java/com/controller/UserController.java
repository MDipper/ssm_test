package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.User;
import com.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/add")
	public @ResponseBody Map<String, Object> addUser(
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String username_ = request.getParameter("username");
		String password_ = request.getParameter("password");
		Map<String, Object> map = new HashMap<String, Object>();
		if (userService.CheckUserByUsername(username_) == 0) {
			User user = new User(username_, password_);
			int id = userService.addUser(user);
			map.put("msg", "注册成功！");
		} else {
			map.put("msg", "用户已存在！");
		}
		return map;
	}
	@RequestMapping(value = "/register")
	public String toregister()
	{
		return "success";
	}

	
}
