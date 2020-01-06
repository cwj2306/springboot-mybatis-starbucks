package com.cos.starbucks.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.starbucks.repository.MypageRepository;

@Service
public class TradeService {

	@Autowired
	private MypageRepository mRepo;

	@Transactional
	public void coffeeTrade(int principalId,int price,int coffeeId) {
		try {
			int point = mRepo.findCardPoint(principalId);
			System.out.println("포인트:"+point);
			System.out.println("프라이스:"+price);
			int result=point-price;
			mRepo.coffeeTrade(principalId,price,coffeeId);
			mRepo.updatePoint(principalId,result);
		} catch (Exception e) {
			System.out.println(" increaseCountAndTimeupdate 오류 : 트랜잭션 실패");
			throw new RuntimeException(e);
		}

	}
	
	@Transactional
	public void bevTrade(int principalId,int price,int bevId) {
		try {
			int point = mRepo.findCardPoint(principalId);
			System.out.println("포인트:"+point);
			System.out.println("프라이스:"+price);
			int result=point-price;
			mRepo.bevTrade(principalId,price,bevId);
			mRepo.updatePoint(principalId,result);
		} catch (Exception e) {
			System.out.println(" increaseCountAndTimeupdate 오류 : 트랜잭션 실패");
			throw new RuntimeException(e);
		}

	}

	

	public int findCoffeePrice(int userId, int id) {
		int price = mRepo.findCoffeePrice(userId, id);
		return price;
	}

	public int findBevPrice(int userId, int id) {
		int price = mRepo.findBevPrice(userId, id);
		return price;
	}

	public boolean cardPoint(int userId, int price) {
		
		int point = mRepo.findCardPoint(userId);
		if (price > point)
			return false;
		else
			return true;
	}

	


}
