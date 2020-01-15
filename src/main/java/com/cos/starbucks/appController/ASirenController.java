package com.cos.starbucks.appController;

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
	public JSONObject json() {
		List<Food> items = mRepo.findAllFood();
		List<Beverage> items2 = mRepo.findAll();
		JSONObject jsonObject = new JSONObject();
		JSONArray foods = new JSONArray();
		JSONArray beverages = new JSONArray();
		for (Food item : items) {
			JSONObject food = new JSONObject();			
			food.put("id", item.getId());
			food.put("name", item.getName());
			food.put("image", item.getImage());
			food.put("price", item.getPrice());
			food.put("category", item.getCategory());
			foods.add(food);
		}
		
		for (Beverage item2 : items2) {
			JSONObject beverage =  new JSONObject();
			beverage.put("id", item2.getId());
			beverage.put("name", item2.getName());
			beverage.put("image", item2.getImage());
			beverage.put("price", item2.getPrice());
			beverage.put("category", item2.getCategory());
			beverages.add(beverage);
		}
		
		jsonObject.put("foods", foods);
		jsonObject.put("beverages", beverages);
		return jsonObject;
	}


}
