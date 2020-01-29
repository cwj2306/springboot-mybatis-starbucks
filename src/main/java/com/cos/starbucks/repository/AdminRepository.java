package com.cos.starbucks.repository;

import java.util.List;


import com.cos.starbucks.model.Trade;

public interface AdminRepository {

	List<Trade> findTrade();
	
	int findAmount();
	
}
