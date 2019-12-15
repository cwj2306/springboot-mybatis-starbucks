package com.cos.starbucks.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int id;
	private String title;
	private String content;
	private int userId;
	private Timestamp createDate;
	

}
