package com.cos.starbucks.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/mypage")
public class MypageController {
	
	@GetMapping("/")
	public String drinkList() {
		return "내 페이지다 임마";
	}
	
}
