package com.cos.starbucks.appController;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.starbucks.model.Beverage;
import com.cos.starbucks.model.Food;
import com.cos.starbucks.model.Trade;
import com.cos.starbucks.model.User_card;
import com.cos.starbucks.repository.MenuRepository;
import com.cos.starbucks.repository.MypageRepository;
import com.cos.starbucks.security.MyUserDetails;
import com.cos.starbucks.service.TradeService;
import com.cos.starbucks.util.Script;

@RestController
@RequestMapping("/android")
public class ASirenController {

	@Autowired
	private MenuRepository mRepo;
	@Autowired
	private MypageRepository mpRepo;
	@Autowired
	private TradeService service;

	@GetMapping("/siren")
	public HashMap<String, Object> json() {
		List<Food> foods = mRepo.findAllFood();
		List<Beverage> beverages = mRepo.findAll();
		HashMap<String, Object> sirenDTO = new HashMap<>();
		sirenDTO.put("foods", foods);
		sirenDTO.put("beverages", beverages);

		return sirenDTO;
	}

	@PostMapping("/order")
	public String Sirenorder(Trade trade) {
		// 안드에서 넘긴다
		int principalId = trade.getUserId();
		// 카드 있는지 체크
		User_card userCard = mpRepo.CheckCardExist(principalId);
		// 여기서 리턴해줘서 안드에서 카드등록후 사용해주세요 -> 인텐트 카드등록페이지
		if (userCard == null) {
			return "noCard";
		} else {
			int price = trade.getPrice();
			int amount = trade.getAmount();
			int sum = price * amount;
			// 카드금액이 넘는지 넘지 않는지
			boolean bl = service.cardPoint(principalId, sum);// 안드에서 넘어온 총 금액 넣어주기

			if (bl) {
				service.trade(principalId, trade.getPrice(), trade.getName(), trade.getAmount());// 1.가격, 2.개수
				// 구매가 완료되었습니다.
				return "tradeSuccess";
			} else {
				// 잔액이 부족합니다.
				return "noPoint";
			}

		}

	}
}
