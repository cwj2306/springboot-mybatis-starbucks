package com.cos.starbucks.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.cos.starbucks.model.User;
import com.cos.starbucks.repository.UserRepository;

@Service
public class MyUserDetailsService implements UserDetailsService{
	
	@Autowired
	private UserRepository mRepo;
	
	// loginForm에서 action="user/loginProcess"
	// 로그인 버튼을 누르면 컨피그에서 낚아채서 여기가 작동한다.
	// 내부를 구현해주면 끝
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = mRepo.findByUsername(username);
		MyUserDetails userDetails = null;
		
		if(user != null) {
			userDetails = new MyUserDetails();
			userDetails.setUser(user);
		}else {
			throw new UsernameNotFoundException("유저네임이 없어요: "+username);
		}
		return userDetails;
	}

	
}

