package com.cos.starbucks.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/coffee")
public class CoffeeController {

	@GetMapping("/product_list")
	public String productList() {
		return "커피 리스트입니다";
	}

	@GetMapping("/productFinder")
	public String productFinder() {
		return "나와 어울리는 커피입니다.";
	}

	@GetMapping("/espresso")
	public String espresso() {
		return "에스프레소 음료입니다.";
	}

}
