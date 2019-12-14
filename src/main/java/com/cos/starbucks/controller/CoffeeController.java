package com.cos.starbucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.starbucks.model.Coffee;
import com.cos.starbucks.repository.CoffeeRepository;


@Controller
@RequestMapping("/coffee")
public class CoffeeController {

	@Autowired
	private CoffeeRepository cRepo;
	
	
	@GetMapping("/product_list")
	public String productList(Model model) {
		
		List<Coffee> coffee= cRepo.findAll();
		List<Coffee> blonde= cRepo.findBlonde();
		List<Coffee> medium= cRepo.findMedium();
		List<Coffee> dark= cRepo.findDark();
		model.addAttribute("blonde",blonde);
		model.addAttribute("coffees",coffee);
		model.addAttribute("medium",medium);
		model.addAttribute("dark",dark);
		
		
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
