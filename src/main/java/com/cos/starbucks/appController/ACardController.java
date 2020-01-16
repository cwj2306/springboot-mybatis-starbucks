package com.cos.starbucks.appController;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cos.starbucks.model.Card;
import com.cos.starbucks.model.Food;
import com.cos.starbucks.repository.MenuRepository;

@RestController
@RequestMapping("/android")
public class ACardController {
	@Autowired
	private MenuRepository mRepo;
	
	@GetMapping("/card")
	public HashMap<String, Object> json() {
		List<Card> cards = mRepo.findAllCard();
		
		HashMap<String, Object> cardDTO = new HashMap<>();
		
		cardDTO.put("cards", cards);
		return cardDTO;
	}
}
