package com.cos.starbucks.model;

import lombok.Data;

@Data
public class OAuth2Token2 {
	
	private String access_token;
	private String token_type;
	private String refresh_token;
	private int expires_in;
	private String error;
	private String error_description;
	
}

