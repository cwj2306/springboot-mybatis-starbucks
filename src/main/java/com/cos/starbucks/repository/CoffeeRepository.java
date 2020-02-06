package com.cos.starbucks.repository;


import java.util.List;

import com.cos.starbucks.model.Coffee;


public interface CoffeeRepository {
	List<Coffee> findAll();
	List<Coffee> findBlonde();
	List<Coffee> findMedium();
	List<Coffee> findDark();
	Coffee findById(int id);
	Coffee findCoffee(String flavor,String feel,String strong);
	void uploadCoffee(String name,String detail,int price,String flavor,String feel,String strong,String roast,String image);
	void deleteCoffee(int id);
	List<Coffee> findByIds(List<Integer> ids);
}
