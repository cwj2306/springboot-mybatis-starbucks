package com.cos.starbucks.repository;

import java.util.List;

import com.cos.starbucks.model.Mycafe;

public interface StoreRepository {
	List<Mycafe> findAll(int userId);
	void save(Mycafe myCafe);
	void delete(Mycafe myCafe);
}
