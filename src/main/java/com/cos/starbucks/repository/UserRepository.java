package com.cos.starbucks.repository;

import com.cos.starbucks.model.User;

public interface UserRepository {
	User findByUsername(String username);
	void join(User user);
}
