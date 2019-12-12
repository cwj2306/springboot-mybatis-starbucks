package com.cos.starbucks.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User_card {

	private int id;
	
	private int userId;
	private int cardId;
	private int point;
	private Timestamp createDate;

}
