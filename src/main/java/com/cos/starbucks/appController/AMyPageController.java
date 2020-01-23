package com.cos.starbucks.appController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cos.starbucks.model.User_card;
import com.cos.starbucks.repository.MypageRepository;
import com.cos.starbucks.security.MyUserDetails;

@RestController
@RequestMapping("/android")
public class AMyPageController {

	@Autowired
	private MypageRepository mpRepo;
	
	@GetMapping("/mypage")
	public User_card androidMyPage(@AuthenticationPrincipal MyUserDetails userDetail) {
		
		if(userDetail != null) {
			User_card userCard = mpRepo.findByUserIdCard(userDetail.getUser().getId());
			
			return userCard;
		}
		
		return null;
	}
	
}
