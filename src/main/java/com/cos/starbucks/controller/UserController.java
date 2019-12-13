package com.cos.starbucks.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.starbucks.model.User;
import com.cos.starbucks.repository.UserRepository;;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserRepository URepo;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/user")
	public @ResponseBody User getUser() {
		User user = URepo.findByUsername("cos");
		return user;
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "join";
	}
	
	@PostMapping("/join")
	public String create(User user) {
		String rawPassword = user.getPassword();
		String encPassword = passwordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		URepo.join(user);
		return "home";
	}
	
	@GetMapping("/login")
	public @ResponseBody String login() {
		return "로그인페이지입니다";
	}
	
	@GetMapping("/join1")
	public @ResponseBody String join1() {
		return "회원가입 인증페이지입니다.";
	}
	
	@GetMapping("/join2")
	public @ResponseBody String join2() {
		return "회원가입 정보입력페이지입니다.";
	}
	
}
