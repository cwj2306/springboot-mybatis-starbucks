package com.cos.starbucks.appController;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cos.starbucks.model.Beverage;
import com.cos.starbucks.model.Coffee;
import com.cos.starbucks.model.Food;
import com.cos.starbucks.repository.CoffeeRepository;
import com.cos.starbucks.repository.MenuRepository;

@RestController
@RequestMapping("/android")
public class AMenuController {
	@Autowired
	private CoffeeRepository cRepo;
	@Autowired
	private MenuRepository mRepo;
	
	@GetMapping("/menu")
	public HashMap<String, Object> json() {
		List<Coffee> coffees = cRepo.findAll();
		List<Beverage> beverages = mRepo.findAll();
		List<Food> foods = mRepo.findAllFood();
		
		HashMap<String, Object> menuDTO = new HashMap<>();
			
		menuDTO.put("coffees", coffees);
		menuDTO.put("beverages", beverages);
		menuDTO.put("foods", foods);
		return menuDTO;
	}

}
