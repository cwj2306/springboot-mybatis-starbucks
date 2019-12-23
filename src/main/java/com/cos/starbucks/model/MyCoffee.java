package com.cos.starbucks.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyCoffee {

	private int id;
	private int coffeeId;
	private int userId;
	private String coffeeName;
	private Timestamp createDate;
}
