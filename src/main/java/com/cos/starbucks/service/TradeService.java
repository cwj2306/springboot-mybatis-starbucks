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
	public void trade(int principalId, int price, String name) {
		try {
			int point = mRepo.findCardPoint(principalId);
			int result = point - price;
			mRepo.trade(principalId, price, name);
			mRepo.updatePoint(principalId, result);
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
