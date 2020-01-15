package com.cos.starbucks.appController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cos.starbucks.model.User;
import com.cos.starbucks.repository.UserRepository;

@RestController
@RequestMapping("/android")
public class AUserController {

	@Autowired
	UserRepository uRepo;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@PostMapping("/joinProc")
	public String create(User user) {
		String rawPassword = user.getPassword();
		String encPassword = passwordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		try {
			uRepo.join(user);	
		} catch (Exception e) {
			return "join fail";
		}
		
		return "join success";
	}
	
}
