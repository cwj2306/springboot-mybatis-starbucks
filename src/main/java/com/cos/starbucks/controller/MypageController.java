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

import com.cos.starbucks.model.MyBeverage;
import com.cos.starbucks.model.MyCoffee;

import com.cos.starbucks.model.User_card;
import com.cos.starbucks.repository.MypageRepository;
import com.cos.starbucks.security.MyUserDetails;
import com.cos.starbucks.util.Script;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageRepository mRepo;
	
	
	@PostMapping("/deleteCoffee")
	public @ResponseBody String coffeeDelete(@AuthenticationPrincipal MyUserDetails userDetail,@RequestParam String[] check) {
		for (String ids : check) {
			int id=Integer.parseInt(ids);
			int result=mRepo.CheckCoffeeDelete(id);
			System.out.println(result);
			if(result==userDetail.getUser().getId())
				mRepo.deleteCoffee(id);
			else return Script.alertAndHref("비정상적인 접근입니다.","/");
		}
	
		
		return Script.href("/mypage/mylist");
	}
	
	@PostMapping("/deleteBev")
	public @ResponseBody String bevDelete(@AuthenticationPrincipal MyUserDetails userDetail,@RequestParam String[] check) {
		for (String ids : check) {
			int id=Integer.parseInt(ids);
			int result=mRepo.CheckBevDelete(id);
			System.out.println(result);
			if(result==userDetail.getUser().getId())
				mRepo.deleteBev(id);
			else return Script.alertAndHref("비정상적인 접근입니다.", "/");
		}
		
		return Script.href("/mypage/mybev");
	}
	
	
	@PostMapping("/deleteCard/{id}")
	public @ResponseBody String cardDelete(@PathVariable int id,@AuthenticationPrincipal MyUserDetails userDetail) {
		int result=mRepo.CheckCardDelete(id);
		System.out.println(result);
		if(result==userDetail.getUser().getId())
			mRepo.deleteCard(id);
		else return Script.alertAndHref("비정상적인 접근입니다.", "/");
		
		
		
		return Script.href("/menu/card_list");
	}
	
	
	@PostMapping("/coffeeSave/{id}")
	public String coffeeSave(@PathVariable int id , @AuthenticationPrincipal MyUserDetails userDetail,@RequestParam("name") String name) {
		mRepo.coffeeSave(id,userDetail.getUser().getId(),name);
		
		return "redirect:/mypage/mylist";
	}
	
	@PostMapping("/bevSave/{id}")
	public String bevSave(@PathVariable int id , @AuthenticationPrincipal MyUserDetails userDetail,@RequestParam("name") String name) {
		mRepo.bevSave(id,userDetail.getUser().getId(),name);
		
		return "redirect:/mypage/mybev";
	}
	
	@PostMapping("/cardSave/{id}")
	public @ResponseBody String cardSave(@PathVariable int id , @AuthenticationPrincipal MyUserDetails userDetail,
			@RequestParam("name") String name,@RequestParam("image") String image) {
		int cardCheck=mRepo.countByUserId(userDetail.getUser().getId());
		if(cardCheck==0) {
			mRepo.cardSave(id,userDetail.getUser().getId(),name,image);
		}else {
			return Script.alertAndHref("내카드는 한장만 등록가능합니다. 내카드페이지로 이동합니다.","/mypage/mycard");
		}
		
		
		return Script.href("/mypage/mycard");
	}
	
	
	
	
	@GetMapping("/mylist")
	public String myList(@AuthenticationPrincipal MyUserDetails userDetail,Model model) {
		List<MyCoffee> coffeeList= mRepo.findByUserId(userDetail.getUser().getId());

		
		model.addAttribute("coffeeList",coffeeList);
		return "/mypage/myList";
	}
	
	@GetMapping("/mybev")
	public String myBev(@AuthenticationPrincipal MyUserDetails userDetail,Model model) {
		List<MyBeverage> bevList= mRepo.findByUserIdBev(userDetail.getUser().getId());

		
		model.addAttribute("bevList",bevList);
		return "/mypage/myList2";
	}
	
	@GetMapping("/mycard")
	public String myCard(@AuthenticationPrincipal MyUserDetails userDetail,Model model) {
		
		User_card card= mRepo.findByUserIdCard(userDetail.getUser().getId());

		model.addAttribute("card",card);
		return "/mypage/myCard";
	}
	
	
	@GetMapping("/pay")
	public String pay(@RequestParam int point,Model model) {
		model.addAttribute("point",point);
	
		return "/mypage/pay";
	}
	@PostMapping("/pointup")
	public String pointUp(@AuthenticationPrincipal MyUserDetails userDetail,@RequestParam int point){
		User_card mycard=mRepo.findByUserIdCard(userDetail.getUser().getId());
		int result=mycard.getPoint()+point;
		mRepo.updatePoint(userDetail.getUser().getId(),result);
		
		return "redirect:/mypage/mycard";
	}

}
