package com.cos.starbucks.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyBeverage {

	private int id;
	private int beverageId;
	private String beverageName;
	private int userId;
	private int price;
	private Timestamp createDate;
}
