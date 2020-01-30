package com.cos.starbucks.appController;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cos.starbucks.model.User;
import com.cos.starbucks.repository.UserRepository;
import com.cos.starbucks.security.MyUserDetailsService;

@RestController
@RequestMapping("/android")
public class AUserController {

	@Autowired
	private UserRepository uRepo;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private MyUserDetailsService mMyUserDetailsService;
	
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
	
	@PostMapping("/kakaoJoinProc")
	public String kCreate(User user) {

		try {
			uRepo.join(user);	
		} catch (Exception e) {
			return "join fail";
		}
		
		return "join success";
	}
	
	@PostMapping("/kakaoSubscribeCheck")
	public User KLogin(User user, HttpSession session) {
		
		user = uRepo.findByProviderAndProviderId("kakao", user.getProviderId());
		
		if(user==null) {
			//미가입
			return new User();
			
		}else {
			//가입
			UserDetails userDetail =
	        		 mMyUserDetailsService.loadUserByUsername(user.getUsername());
	         Authentication authentication = 
	                new UsernamePasswordAuthenticationToken(userDetail, userDetail.getPassword(), userDetail.getAuthorities());
	          
	          SecurityContext securityContext = SecurityContextHolder.getContext();
	          
	          securityContext.setAuthentication(authentication);
	          
	          session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
	          	          
			return user;
		}
	}
	

	
}
