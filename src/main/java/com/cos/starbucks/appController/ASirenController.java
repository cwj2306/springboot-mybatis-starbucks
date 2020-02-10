package com.cos.starbucks.appController;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cos.starbucks.model.Beverage;
import com.cos.starbucks.model.Cart;
import com.cos.starbucks.model.Food;
import com.cos.starbucks.model.Trade;
import com.cos.starbucks.model.User;
import com.cos.starbucks.model.User_card;
import com.cos.starbucks.repository.MenuRepository;
import com.cos.starbucks.repository.MypageRepository;
import com.cos.starbucks.repository.UserRepository;
import com.cos.starbucks.service.TradeService;
import com.google.gson.Gson;

@RestController
@RequestMapping("/android")
public class ASirenController {
	@Autowired
	private UserRepository uRepo;
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
				// 어플에는 사용하지 않지만 웹에서 등급상승위해 등급로직
				int amountCheck=mpRepo.findAmountByUserId(principalId);
				if(amountCheck>=20 && amountCheck<50) {
					uRepo.changeSilverLevel(principalId);
				}else if(amountCheck>=50) {
					uRepo.changeGoldLevel(principalId);
				}
				// 구매가 완료되었습니다.
				int restPoint = mpRepo.findCardPoint(principalId);
				return Integer.toString(restPoint);
			} else {
				// 잔액이 부족합니다.
				return "noPoint";
			}

		}

	}
	
	@PostMapping("/orderCart")
	public String CartOrder(@RequestBody JSONObject jsonObject) {
		//앞에 name달고 들어온 jsonobject
		String a =jsonObject.toJSONString();
		//name 제거한 jsonarray
		String b = a.substring(9,a.length()-1);
		//객체로 변환
		Gson gson = new Gson();
		Trade[] trade = gson.fromJson(b, Trade[].class);
		//=================================
		int principalId = trade[0].getUserId();
		//장바구니에 물건 있는지 체크
		//카드있는지 체크
		User_card userCard = mpRepo.CheckCardExist(principalId);
		if(userCard==null) {
			//카드 없음
			return "noCard";
		}else {
			//카드 있음
			int sum = 0;
			//총 금액 구하기
			for (int i = 0; i < trade.length; i++) {
				sum = sum+trade[i].getPrice()*trade[i].getAmount();
			}
			//잔액체크
			boolean bl = service.cardPoint(principalId, sum);
			if(bl) {
				//잔액 있음
				//구매기록 디비 등록
				for (int i = 0; i < trade.length; i++) {
					service.trade(principalId, trade[i].getPrice(),trade[i].getName(),trade[i].getAmount());
				}
				//해당 유저 장바구니 목록 제거
				mpRepo.AdeleteCartOrder(principalId);
				// 어플에는 사용하지 않지만 웹에서 등급상승위해 등급로직
				int amountCheck=mpRepo.findAmountByUserId(principalId);
				if(amountCheck>=20 && amountCheck<50) {
					uRepo.changeSilverLevel(principalId);
				}else if(amountCheck>=50) {
					uRepo.changeGoldLevel(principalId);
				}
				// 구매가 완료되었습니다.
				int restPoint = mpRepo.findCardPoint(principalId);
				return Integer.toString(restPoint);
			}else {
				// 잔액이 부족합니다.
				return "noPoint";
			}
		}
	}

	@PostMapping("/cartAction")
	public String SirenCart(Cart cart) {

		int principalId = cart.getUserId();
		int price = cart.getPrice();
		String name = cart.getName();

		cart = mpRepo.AfindExistProduct(principalId, name);

		if (cart != null) {
			// 이미 로그인한 회원의 장바구니에 해당 제품이 담겨있는 경우
			return "existProduct";
		} else {
			// 카트에 담기 성공
			mpRepo.Acart(principalId, name, price);
			return "cartSuccess";
		}

	}

	@PostMapping("/cart")
	public HashMap<String, Object> json2(Cart cart) {

		List<Cart> carts = mpRepo.AcartfindbyuserId(cart.getUserId());
		HashMap<String, Object> cartDTO = new HashMap<>();
		cartDTO.put("carts", carts);
		return cartDTO;
	}

	@PostMapping("/deleteCart")
	public String CartDelete(Cart cart) {
		int cartId = cart.getId();
		try {
			mpRepo.AdeleteCart(cartId);
			return "deleteSuccess";
		} catch (Exception e) {
			e.printStackTrace();
			return "deleteFail";
		}

	}
	


}
