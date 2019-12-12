package com.cos.starbucks.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Coffee {

	private int id;
	private String name;
	private String detail;
	private String image;
	private int price;
	
	private String roast;
	private String box;
	private String flavor;
	private String feel;
	private String strong;
	private Timestamp createDate;

}
