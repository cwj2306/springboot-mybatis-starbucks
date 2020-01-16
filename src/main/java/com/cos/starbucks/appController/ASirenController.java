package com.cos.starbucks.appController;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cos.starbucks.model.Beverage;
import com.cos.starbucks.model.Food;
import com.cos.starbucks.repository.MenuRepository;

@RestController
@RequestMapping("/android")
public class ASirenController {

	@Autowired
	private MenuRepository mRepo;
	
	@GetMapping("/siren")
	public HashMap<String, Object> json() {
		List<Food> foods = mRepo.findAllFood();
		List<Beverage> beverages = mRepo.findAll();
		HashMap<String, Object> sirenDTO = new HashMap<>();
		sirenDTO.put("foods", foods);
		sirenDTO.put("beverages", beverages);
		
		return sirenDTO;
	}


}
