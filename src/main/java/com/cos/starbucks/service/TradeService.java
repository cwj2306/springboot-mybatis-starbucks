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
	public void coffeeTrade() {
		try {
			mRepo.coffeeTrade();
			mRepo.minusPoint();
		} catch (Exception e) {
			System.out.println(" increaseCountAndTimeupdate 오류 : 트랜잭션 실패");
			throw new RuntimeException(e);
		}
		
	}
		
	
	
}
