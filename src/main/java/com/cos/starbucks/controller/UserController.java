package com.cos.starbucks.controller;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.starbucks.model.User;
import com.cos.starbucks.repository.UserRepository;
import com.cos.starbucks.util.Script;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserRepository uRepo;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	@GetMapping("/join1")
	public String join1() {
		return "auth/join1";
	}
	
	@GetMapping("/join2")
	public String join2() {
		return "auth/join2";
	}
	
	@PostMapping("/joinProc")
	public @ResponseBody String create(User user) {
		String rawPassword = user.getPassword();
		String encPassword = passwordEncoder.encode(rawPassword);
		String username=user.getUsername();
		int result=uRepo.usernameCheck(username);
		if(result==0) {
			user.setPassword(encPassword);
			uRepo.join(user);
			return Script.alertAndHref("가입완료", "/user/login");
		}else
		return Script.alertAndHref("중복확인 해주세요.","/user/join2");
	}
	
	@GetMapping("/login")
	public String login() {
		return "auth/login";
	}
	
	@GetMapping("/usernameCheck/{username}")
	public @ResponseBody String usernameCheck(@PathVariable String username) {
		System.out.println(username);
		int result=uRepo.usernameCheck(username);
		System.out.println(result);
		if(result==0) {
			return "ok";
		}else
		return "exist";
	}
	
}
