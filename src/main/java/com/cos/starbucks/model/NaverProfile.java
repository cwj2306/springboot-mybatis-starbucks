package com.cos.starbucks.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class NaverProfile {
	private Response response = new Response();

	@Data
	public class Response {
		private String id;
		private String email;
		private String name;
		private String profile_image;
	}

}
