package com.cos.starbucks.repository;

import java.util.List;

import com.cos.starbucks.model.Beverage;

public interface MenuRepository {
	
	List<Beverage> findById(int id);
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
	
}
