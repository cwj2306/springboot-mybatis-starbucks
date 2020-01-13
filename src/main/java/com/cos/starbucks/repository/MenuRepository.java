package com.cos.starbucks.repository;

import java.util.List;

import com.cos.starbucks.model.Beverage;
import com.cos.starbucks.model.Card;
import com.cos.starbucks.model.Food;

public interface MenuRepository {
	
	Beverage findById(int id);
	Card findByIdCard(int id);
	List<Beverage> findAll();
	List<Beverage> findCold();
	List<Beverage> findBrud();
	List<Beverage> findEspr();
	List<Beverage> findPrap();
	List<Beverage> findBlend();
	List<Beverage> findFiz();
	List<Beverage> findEtc();
	List<Beverage> findTea();
	List<Beverage> findJuice();
	
	List<Food> findAllFood();
	List<Food> findBake();
	List<Food> findCake();
	List<Food> findSand();
	List<Food> findHot();
	List<Food> findFruit();
	List<Food> findSnack();
	List<Food> findIce();
	
	List<Card> findAllCard();
	
	void uploadBev(String name,int price,String category,String image);
	
	void deleteBev(int id);
}
