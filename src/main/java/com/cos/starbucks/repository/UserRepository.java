package com.cos.starbucks.repository;

import java.util.List;

import com.cos.starbucks.model.User;

public interface UserRepository {
	User findByUsername(String username);
	void join(User user);
	User findByProviderAndProviderId(String provider, String providerId);
	void changePw(String password);
	void moneyUp(int money,int id);
	List<User> findAll();
	int findSum();
	
	int usernameCheck(String username);
}
