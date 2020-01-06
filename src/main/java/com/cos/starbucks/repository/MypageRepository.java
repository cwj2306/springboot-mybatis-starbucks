package com.cos.starbucks.repository;

import java.util.List;


import com.cos.starbucks.model.MyBeverage;
import com.cos.starbucks.model.MyCoffee;
import com.cos.starbucks.model.User_card;


public interface MypageRepository {
	
	List<MyBeverage> findByUserIdBev(int id);
	List<MyCoffee> findByUserId(int id);
	User_card findByUserIdCard(int id);
	void updatePoint(int id,int point);
	int countByUserId(int id);
	void coffeeSave(int coffeeId,int userId,String coffeeName);
	void bevSave(int bevId,int userId,String bevName);
	void cardSave(int cardId,int userId,String cardName,String cardImage);
	void deleteCoffee(int id);
	void deleteBev(int id);
	void deleteCard(int id);
	int checkMyCoffee(int id);
	int checkMyBev(int id);
	int checkMyCard(int id);
	
	void coffeeTrade(int userId , int price , int coffeeId);
	void bevTrade(int userId , int price , int bevId);
	int findCoffeePrice(int userId,int id);
	int findCoffeeId(int id);
	int findBevPrice(int userId,int id);
	int findBevId(int id);
	int findCardPoint(int userId);
}
