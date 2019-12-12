package com.cos.starbucks.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/menu")
public class MenuController {
	
	@GetMapping("/drink_list")
	public String drinkList() {
		return "메뉴에 음료입니다.";
	}
	
}
