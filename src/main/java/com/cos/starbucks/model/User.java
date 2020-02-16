package com.cos.starbucks.model;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

	private int id;
	@Pattern(regexp = "^[ㄱ-ㅎㅏ-ㅣ가-힣]*$",message = "이름은 한글만 입력될 수 있습니다.")
	private String name;
	@Pattern(regexp = "^[a-zA-Z0-9]*$",message = "아이디에 한글이 입력될 수 없습니다.")
	@Size(max=10,message = "아이디의 길이가 초과되었습니다.(10자이내)")
	@NotBlank(message = "아이디를 입력하세요.")
	private String username;
	@Size(max=20,message = "비밀번호의 길이가 초과되었습니다.(20자이내)")
	@NotBlank(message = "비밀번호를 입력하세요.")
	private String password;
	private int money;
	@NotBlank(message = "이메일을 입력하세요.")
	private String email;
	
	private String provider;
	private String providerId;
	
	private String level;
	private Timestamp createDate;

}
