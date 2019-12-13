package com.cos.starbucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/coffee")
public class CoffeeController {

	@GetMapping("/product_list")
	public String productList() {
		return "coffee/product_list";
	}

	@GetMapping("/productFinder")
	public @ResponseBody String productFinder() {
		return "나와 어울리는 커피입니다.";
	}

	@GetMapping("/espresso")
	public String espresso() {
		return "coffee/espresso";
	}

}
