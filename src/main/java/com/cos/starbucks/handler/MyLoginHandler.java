package com.cos.starbucks.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.cos.starbucks.model.User;
import com.cos.starbucks.security.MyUserDetails;
import com.fasterxml.jackson.databind.ObjectMapper;


public class MyLoginHandler implements AuthenticationSuccessHandler, AuthenticationFailureHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		if(request.getHeader("User-Agent").equals("Android")) {
			
			MyUserDetails userDetail = (MyUserDetails)authentication.getPrincipal();
			User user = userDetail.getUser();
			
			ObjectMapper objectMapper = new ObjectMapper();
			// 객체를 json으로 변환할 때 날짜 형식 설정하기
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			objectMapper.setDateFormat(df);
			String jsonData = objectMapper.writeValueAsString(user);
			
			PrintWriter out = response.getWriter();
			out.print(jsonData);
			out.flush();
			out.close();
		
			return;
		}
				
		
		String username = request.getParameter("username");
		String rememberMe = request.getParameter("rememberMe");
		
		if (rememberMe != null) {

			Cookie c = new Cookie("username", username);
			// 쿠키는 타임을 따로 지정해줘야 한다.
			c.setMaxAge(6000);// 100분
			response.addCookie(c);
		} else {

			Cookie c = new Cookie("username", null);
			c.setMaxAge(0);// 즉시 사라짐
			response.addCookie(c);
		}
		
		response.sendRedirect("/");
		
	}
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		PrintWriter out = response.getWriter();
		
		if(request.getHeader("User-Agent").equals("Android")) {
			out.print("loginfail");
			out.flush();
			out.close();
		
			return;
		}
		
		response.setContentType("text/html; charset=UTF-8");
        out.println("<script>alert('아이디 또는 비밀번호를 정확하게 입력해주세요.'); history.go(-1);</script>");
        out.flush();
        out.close();
	}
	
}
