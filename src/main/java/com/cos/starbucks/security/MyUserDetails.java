package com.cos.starbucks.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.cos.starbucks.model.User;

//Principal(접근주체) = 세션처럼 사용 = Spring Security Context에 보관됨
public class MyUserDetails implements UserDetails {

	private User user;
	
		
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	//계정의 패스워드를 리턴한다.
	@Override
	public String getPassword() {
		//MyUser와 MyUserDetails는 다르니까 MyUser를 get한다.
		return user.getPassword();
	}
	
	//계정의 이름을 리턴한다.
	@Override
	public String getUsername() {
		
		return user.getUsername();
	}
	
	//계정이 만료되지 않았는지를 리턴한다.(true를 리턴하면 만료되지 않음을 의미)
	@Override
	public boolean isAccountNonExpired() {
		//true를 해주면 만료되게 만들어준다. (1년: 부정확)
		//1년이 지나면 필드에 체크가 되고 로그인이 안된다.
		return true;
	}
	
	//계정이 잠겨있지 않은지를 리턴한다(true를 리턴하면 계정이 잠겨있지 않음을 의미)
	@Override
	public boolean isAccountNonLocked() {
		//false password 를 xx회 틀렸을때 잠기고 만료된다
		//true 비밀번호를 몇번 틀려도 잠기지 않는다.
		return true;
	}

	//계정의 패스워드가 만료되지 않았는지를 리턴(true를 리턴하면 패스워드가 만료되지 않음을 의미)
	@Override
	public boolean isCredentialsNonExpired() {
		//비밀번호 변경기간체크용으로 쓴다 
		//true를 쓰면 만료되지 않는다.
		return true;
	}

	//계정이 사용가능한 계정인지를 리턴(true 리턴하면 사용가능한 계정인지를 의미)
	@Override
	public boolean isEnabled() {
		//계정이 정지됐는지 본다.
		return true;
	}
	
	//계정이 갖고있는 권한 목록을 리턴
	// Role 얘는 화요일에 하게 될 것 같다.
	// 권한을 가지고 있음
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

}

