package com.cos.starbucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.starbucks.model.Trade;
import com.cos.starbucks.model.MyBeverage;
import com.cos.starbucks.model.MyCoffee;
import com.cos.starbucks.model.User;
import com.cos.starbucks.model.User_card;
import com.cos.starbucks.repository.MypageRepository;
import com.cos.starbucks.repository.UserRepository;
import com.cos.starbucks.security.MyUserDetails;
import com.cos.starbucks.service.TradeService;
import com.cos.starbucks.util.Script;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageRepository mRepo;
	@Autowired
	private UserRepository uRepo;
	@Autowired
	private TradeService service;

	
	@GetMapping("/myStarBucks")
	public String myCard(@AuthenticationPrincipal MyUserDetails userDetail, Model model) {

		User_card card = mRepo.findByUserIdCard(userDetail.getUser().getId());
		try {
			int amount=mRepo.findAmountByUserId(userDetail.getUser().getId());
			model.addAttribute("amount",amount);
		} catch (Exception e) {
			int amount=0;
			model.addAttribute("amount",amount);
		}
		
		
		model.addAttribute("card", card);
	
		return "/mypage/myStarBucks";
	}

	
	@PostMapping("/deleteCoffee")
	public @ResponseBody String coffeeDelete(@AuthenticationPrincipal MyUserDetails userDetail,
			@RequestParam String[] check) {
		for (String ids : check) {
			int id = Integer.parseInt(ids);
			int result = mRepo.checkMyCoffee(id);
			System.out.println(result);
			if (result == userDetail.getUser().getId())
				mRepo.deleteCoffee(id);
			else
				return Script.alertAndHref("비정상적인 접근입니다.", "/");
		}

		return Script.href("/mypage/myMenu");
	}

	@PostMapping("/deleteBev")
	public @ResponseBody String bevDelete(@AuthenticationPrincipal MyUserDetails userDetail,
			@RequestParam String[] check) {
		for (String ids : check) {
			int id = Integer.parseInt(ids);
			int result = mRepo.checkMyBev(id);
			System.out.println(result);
			if (result == userDetail.getUser().getId())
				mRepo.deleteBev(id);
			else
				return Script.alertAndHref("비정상적인 접근입니다.", "/");
		}

		return Script.href("/mypage/myMenu");
	}

	@PostMapping("/buyCoffee")
	public @ResponseBody String buyCoffee(@AuthenticationPrincipal MyUserDetails userDetail,
			@RequestParam String[] check,@RequestParam int[] amount) {
		int principalId = userDetail.getUser().getId();
		User_card userCard=mRepo.CheckCardExist(principalId);
		if(userCard==null) return Script.alertAndHref("카드등록후 사용해주세요.", "/menu/card_list");
		int price = 0;
		int sum=0;
		int count=0;
		for (String ids : check) {
			int id = Integer.parseInt(ids);
			int result = mRepo.checkMyCoffee(id);
			if (result == principalId) {
				price = service.findCoffeePrice(principalId, id);
				sum+=price*amount[count];
				count++;
			} else
				return Script.alertAndHref("비정상적인 접근입니다.", "/");
		}
		System.out.println("컨트롤러:"+price);
		boolean bl = service.cardPoint(principalId, sum);

		if (bl) {
			int ident=0;
			for (String ids : check) {
				int id = Integer.parseInt(ids);
				int coffeeId = mRepo.findCoffeeId(id);
				String name=mRepo.findCoffeeName(coffeeId);
				price = service.findCoffeePrice(principalId, id);
				service.trade(principalId, price,name,amount[ident]);
				ident++;
			}
				int amountCheck=mRepo.findAmountByUserId(principalId);
				if(amountCheck>=20 && amountCheck<50) {
					uRepo.changeSilverLevel(principalId);
					userDetail.getUser().setLevel("Silver");
				}else if(amountCheck>=50) {
					userDetail.getUser().setLevel("Gold");
					uRepo.changeGoldLevel(principalId);
				}
		} else
			return Script.alertAndHref("잔액부족, 충전하세요", "/mypage/pay");

		return Script.alertAndHref("구매완료", "/mypage/mylog");
	}
	
	@PostMapping("/buyBev")
	public @ResponseBody String buyBev(@AuthenticationPrincipal MyUserDetails userDetail,
			@RequestParam String[] check,@RequestParam int[] amount) {
		int principalId = userDetail.getUser().getId();
		User_card userCard=mRepo.CheckCardExist(principalId);
		if(userCard==null) return Script.alertAndHref("카드등록후 사용해주세요.", "/menu/card_list");
		int price = 0;
		int sum=0;
		int count=0;
		for (String ids : check) {
			int id = Integer.parseInt(ids);
			int result = mRepo.checkMyBev(id);
			if (result == principalId) {
				price = service.findBevPrice(principalId, id);
				sum+=price*amount[count];
				count++;
			} else
				return Script.alertAndHref("비정상적인 접근입니다.", "/");
		}
		System.out.println("컨트롤러:"+price);
		boolean bl = service.cardPoint(principalId, sum);
		if (bl) {
			int ident=0;
			for (String ids : check) {
				int id = Integer.parseInt(ids);
				int bevId = mRepo.findBevId(id);
				String name=mRepo.findBevName(bevId);
				price = service.findBevPrice(principalId, id);
				service.trade(principalId, price,name,amount[ident]);
				ident++;
			}

			int amountCheck=mRepo.findAmountByUserId(principalId);
			if(amountCheck>=20 && amountCheck<50) {
				uRepo.changeSilverLevel(principalId);
				userDetail.getUser().setLevel("Silver");
			}else if(amountCheck>=50) {
				userDetail.getUser().setLevel("Gold");
				uRepo.changeGoldLevel(principalId);
			}
			
		} else
			return Script.alertAndHref("잔액부족, 충전하세요", "/mypage/pay");

		return Script.alertAndHref("구매완료 ", "/mypage/mylog");
	}

	@PostMapping("/deleteCard/{id}")
	public @ResponseBody String cardDelete(@PathVariable int id, @AuthenticationPrincipal MyUserDetails userDetail) {
		int result = mRepo.checkMyCard(id);
		System.out.println(result);
		if (result == userDetail.getUser().getId())
			mRepo.deleteCard(id);
		else
			return Script.alertAndHref("비정상적인 접근입니다.", "/mypage/myMenu");

		return Script.href("/menu/card_list");
	}

	@PostMapping("/coffeeSave/{id}")
	public String coffeeSave(@PathVariable int id, @AuthenticationPrincipal MyUserDetails userDetail,
			@RequestParam("name") String name,@RequestParam("price") int price) {
		mRepo.coffeeSave(id, userDetail.getUser().getId(), name,price);

		return "redirect:/mypage/myMenu";
	}

	@PostMapping("/bevSave/{id}")
	public String bevSave(@PathVariable int id, @AuthenticationPrincipal MyUserDetails userDetail,
			@RequestParam("name") String name,@RequestParam("price") int price) {
		mRepo.bevSave(id, userDetail.getUser().getId(), name,price);

		return "redirect:/mypage/myMenu";
	}

	@PostMapping("/cardSave/{id}")
	public @ResponseBody String cardSave(@PathVariable int id, @AuthenticationPrincipal MyUserDetails userDetail,
			@RequestParam("name") String name, @RequestParam("image") String image) {
		int cardCheck = mRepo.countByUserId(userDetail.getUser().getId());
		if (cardCheck == 0) {
			mRepo.cardSave(id, userDetail.getUser().getId(), name, image);
		} else {
			return Script.alertAndHref("이미 사용중인 카드가 있습니다. 내카드는 한장만 등록가능합니다. ", "/mypage/myStarBucks");
		}

		return Script.href("/mypage/myStarBucks");
	}

	@GetMapping("/myMenu")
	public String myList(@AuthenticationPrincipal MyUserDetails userDetail, Model model) {
		List<MyCoffee> coffeeList = mRepo.findByUserId(userDetail.getUser().getId());
		List<MyBeverage> bevList = mRepo.findByUserIdBev(userDetail.getUser().getId());
		model.addAttribute("coffeeList", coffeeList);
		model.addAttribute("bevList", bevList);
		return "/mypage/myMenu";
	}



	@GetMapping("/pay")
	public String pay() {

		return "/mypage/pay";
	}
	
	@GetMapping("/mylog")
	public String myCoffeelog(@AuthenticationPrincipal MyUserDetails userDetail, Model model) {
		List<Trade> log=mRepo.findTradeLog(userDetail.getUser().getId());
		model.addAttribute("log",log);
		return "/mypage/mylog";
	}
	

	@PostMapping("/pointup")
	public String pointUp(@AuthenticationPrincipal MyUserDetails userDetail, @RequestParam int point) {
		User_card mycard = mRepo.findByUserIdCard(userDetail.getUser().getId());
		User user = uRepo.findByUsername(userDetail.getUser().getUsername());
		System.out.println(point);
		System.out.println(user.getMoney());
		int money = user.getMoney() + point;
		System.out.println(money);
		int result = mycard.getPoint() + point;

		mRepo.updatePoint(userDetail.getUser().getId(), result);
		uRepo.moneyUp(money, userDetail.getUser().getId());
		return "redirect:/mypage/myStarBucks";
	}
	
	
}
