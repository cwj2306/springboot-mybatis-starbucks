package com.cos.starbucks.repository;

import java.util.List;

import com.cos.starbucks.model.Beverage;
import com.cos.starbucks.model.Card;

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
	
	List<Card> findAllCard();
	
	void uploadBev(String name,int price,String category,String image);
	
}
