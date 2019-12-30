package com.cos.starbucks.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Mycafe {

	private int id;
	private int userId;
	private String name;
	private String address;
	private String tel;
	private String lat;
	private String lng;
	private Timestamp createDate;
}
