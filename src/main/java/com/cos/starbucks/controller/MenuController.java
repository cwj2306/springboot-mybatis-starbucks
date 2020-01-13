package com.cos.starbucks.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.starbucks.model.Beverage;
import com.cos.starbucks.model.Card;
import com.cos.starbucks.model.Food;
import com.cos.starbucks.repository.MenuRepository;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuRepository mRepo;
	
	@GetMapping("/card_list")
	public String cardList(Model model) {
		List<Card> cardList=mRepo.findAllCard();
		model.addAttribute("cardList",cardList);
		
		return "menu/card_list";
	}
	
	@GetMapping("/drink_list")
	public String drinkList(Model model) {
		
		List<Beverage> bever=mRepo.findAll();
		List<Beverage> cold=mRepo.findCold();
		List<Beverage> brud=mRepo.findBrud();
		List<Beverage> espr=mRepo.findEspr();
		List<Beverage> prap=mRepo.findPrap();
		List<Beverage> blend=mRepo.findBlend();
		List<Beverage> fiz=mRepo.findFiz();
		List<Beverage> etc=mRepo.findEtc();
		List<Beverage> tea=mRepo.findTea();
		List<Beverage> juice=mRepo.findJuice();
		
		model.addAttribute("bever",bever);
		model.addAttribute("cold",cold);
		model.addAttribute("brud",brud);
		model.addAttribute("espr",espr);
		model.addAttribute("prap",prap);
		model.addAttribute("blend",blend);
		model.addAttribute("fiz",fiz);
		model.addAttribute("tea",tea);
		model.addAttribute("etc",etc);
		model.addAttribute("juice",juice);
		
		return "menu/drink_list";
	}
	
	@GetMapping("/food_list")
	public String foodList(Model model) {
		
		List<Food> food=mRepo.findAllFood();
		List<Food> bake=mRepo.findBake();
		List<Food> cake=mRepo.findCake();
		List<Food> sand=mRepo.findSand();
		List<Food> hot=mRepo.findHot();
		List<Food> fruit=mRepo.findFruit();
		List<Food> snack=mRepo.findSnack();
		List<Food> ice=mRepo.findIce();

		model.addAttribute("food",food);
		model.addAttribute("bake",bake);
		model.addAttribute("cake",cake);
		model.addAttribute("sand",sand);
		model.addAttribute("hot",hot);
		model.addAttribute("fruit",fruit);
		model.addAttribute("snack",snack);
		model.addAttribute("ice",ice);

		
		return "menu/food_list";
	}
	
	
	
	@GetMapping("/detail/{id}")
	public @ResponseBody Beverage detail(@PathVariable int id,Model model) {
		Beverage bev=mRepo.findById(id);
				
		return bev;
	}
	
	@GetMapping("/card/detail/{id}")
	public @ResponseBody Card cardDetail(@PathVariable int id,Model model) {
		Card card=mRepo.findByIdCard(id);
		
		return card;
	}
	
	
}
