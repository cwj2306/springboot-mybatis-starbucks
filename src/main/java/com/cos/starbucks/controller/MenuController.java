package com.cos.starbucks.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@GetMapping("/card_list")
	public String cardList() {
		return "menu/card_list";
	}
	
	@GetMapping("/drink_list")
	public String drinkList() {
		return "menu/drink_list";
	}
	
	@GetMapping("/food_list")
	public String foodList() {
		return "menu/food_list";
	}
	
}
