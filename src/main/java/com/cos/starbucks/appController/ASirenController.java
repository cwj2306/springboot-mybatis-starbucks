package com.cos.starbucks.appController;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cos.starbucks.model.Beverage;
import com.cos.starbucks.model.Coffee;
import com.cos.starbucks.repository.CoffeeRepository;
import com.cos.starbucks.repository.MenuRepository;

@RestController
@RequestMapping("/android")
public class ASirenController {
	@Autowired
	private CoffeeRepository cRepo;
	@Autowired
	private MenuRepository mRepo;
	
	@GetMapping("/siren")
	public JSONObject json() {
		List<Coffee> items = cRepo.findAll();
		List<Beverage> items2 = mRepo.findAll();
		JSONObject jsonObject = new JSONObject();
		JSONArray coffees = new JSONArray();
		JSONArray beverages = new JSONArray();
		for (Coffee item : items) {
			JSONObject coffee = new JSONObject();			
			coffee.put("id", item.getId());
			coffee.put("detail", item.getDetail());
			coffee.put("name", item.getName());
			coffee.put("image", item.getImage());
			coffee.put("price", item.getPrice());
			coffee.put("roast", item.getRoast());
			coffee.put("feel", item.getFeel());
			coffee.put("strong", item.getStrong());
			coffees.add(coffee);
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
		
		jsonObject.put("coffees", coffees);
		jsonObject.put("beverages", beverages);
		return jsonObject;
	}


}
