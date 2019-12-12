package com.cos.starbucks.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/store")
public class StoreController {
	
	@GetMapping("/store_map")
	public String storeMap() {
		return "매장지도페이지입니다.";
	}
}
