package com.cos.starbucks.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cos.starbucks.model.Card;
import com.cos.starbucks.model.MyBeverage;
import com.cos.starbucks.model.MyCoffee;
import com.cos.starbucks.model.User;
import com.cos.starbucks.model.User_card;
import com.cos.starbucks.repository.MypageRepository;
import com.cos.starbucks.security.MyUserDetails;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageRepository mRepo;
	
	//deleteMapping으로 바꿔야함 체크박스로 삭제 어캐하는지 몰겠음 ㅠㅠ
	@GetMapping("/deleteCoffee/{id}")
	public String coffeeDelete(@PathVariable int id ,@AuthenticationPrincipal MyUserDetails userDetail) {
		int result=mRepo.CheckCoffeeDelete(id);
		System.out.println(result);
		if(result==userDetail.getUser().getId())
			mRepo.deleteCoffee(id);
		else return "index";
		
		
		return "redirect:/mypage/mylist";
	}
	
	//deleteMapping으로 바꿔야함 체크박스로 삭제 어캐하는지 몰겠음 ㅠㅠ
	@GetMapping("/deleteBev/{id}")
	public String bevDelete(@PathVariable int id,@AuthenticationPrincipal MyUserDetails userDetail) {
		int result=mRepo.CheckBevDelete(id);
		System.out.println(result);
		if(result==userDetail.getUser().getId())
			mRepo.deleteBev(id);
		else return "index";
		
		
		
		
		return "redirect:/mypage/mybev";
	}
	
	//deleteMapping으로 바꿔야함
	@GetMapping("/deleteCard/{id}")
	public String cardDelete(@PathVariable int id,@AuthenticationPrincipal MyUserDetails userDetail) {
		int result=mRepo.CheckCardDelete(id);
		System.out.println(result);
		if(result==userDetail.getUser().getId())
			mRepo.deleteCard(id);
		else return "index";
		
		
		
		return "redirect:/menu/card_list";
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
	public String cardSave(@PathVariable int id , @AuthenticationPrincipal MyUserDetails userDetail,
			@RequestParam("name") String name,@RequestParam("image") String image) {
		int cardCheck=mRepo.countByUserId(userDetail.getUser().getId());
		if(cardCheck==0) {
			mRepo.cardSave(id,userDetail.getUser().getId(),name,image);
		}else {
			return "index";
		}
		
		
		return "redirect:/mypage/mycard";
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
	
	@PostMapping("/pointup")
	public String pointUp(@AuthenticationPrincipal MyUserDetails userDetail,@RequestParam int point){
		User_card mycard=mRepo.findByUserIdCard(userDetail.getUser().getId());
		int result=mycard.getPoint()+point;
		mRepo.updatePoint(userDetail.getUser().getId(),result);
		
		return "redirect:/mypage/mycard";
	}
	
}
