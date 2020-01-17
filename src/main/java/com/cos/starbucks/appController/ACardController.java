package com.cos.starbucks.appController;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cos.starbucks.model.Card;
import com.cos.starbucks.model.User_card;
import com.cos.starbucks.repository.MenuRepository;
import com.cos.starbucks.repository.MypageRepository;


@RestController
@RequestMapping("/android")
public class ACardController {
	@Autowired
	private MenuRepository mRepo;
	
	@Autowired
	private MypageRepository mpRepo;
	
	@GetMapping("/card")
	public HashMap<String, Object> json() {
		List<Card> cards = mRepo.findAllCard();
		
		HashMap<String, Object> cardDTO = new HashMap<>();
		
		cardDTO.put("cards", cards);
		return cardDTO;
	}
	
	
	@PostMapping("/enrollment")
	public String Enrollment(User_card userCard) {

		try {
			mpRepo.AcardSave(userCard);
		} catch (Exception e) {
			return "enrollment fail";
		}
		return "enrollment success";
	}
	
	@PostMapping("/existCard")
	public String findUsercard(int userId) {
		int findUsercard = mpRepo.countByUserId(userId);
		if(findUsercard == 0) {
			//카드가 없는 경우
			return "0";
		}else {
			//카드가 있는 경우
			return "1";			
		}

	}
}
