package com.cos.starbucks.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Food {

	private int id;
	private String name;
	private String image;
	private int price;
	private Timestamp createDate;
	
	private String category;
	

}
