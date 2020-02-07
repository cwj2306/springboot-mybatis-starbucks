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
	int findCount();
	
	void changeSilverLevel(int id);
	void changeGoldLevel(int id);
	
	
	int usernameCheck(String username);
	void changeUserInfo(int id,String name,String password);
	
	User findById(int id);
}
