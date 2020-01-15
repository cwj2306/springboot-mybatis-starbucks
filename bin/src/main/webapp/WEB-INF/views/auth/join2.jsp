<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/content.css">
<link rel="stylesheet" href="/css/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="../include/nav.jsp"%>

	<form action="/user/joinProc" method="POST"
		onsubmit="return validateCheck()">

		<div>
			아이디:<input type="text" name="username" id="username" value="username" />
			<a style="cursor: pointer;"  onClick="usernameCheck()">중복확인</a>
		</div>
			<span id="username_input" style="font-size:10px; color:red"></span>
		<div>
			이름:<input type="text" name="name" id="name" value="name" />
		</div>
		<div>
			이메일:<input type="email" name="email" id="email" value="email" />
		</div>
		<div>
			비밀번호:<input type="password" name="password" id="password" />
		</div>
		<div>
			비밀번호 확인:<input type="password" name="passwordCheck"
				id="passwordCheck" />
		</div>
		<div>
			<input type="submit" value="가입완료" onClick="usernameCheck()" />
		</div>

	</form>

	<script>
		function validateCheck() {
			var password = document.querySelector('#password').value;
			var passwordCheck = document.querySelector('#passwordCheck').value;

			if (password === passwordCheck) {
				return true;
			} else {
				alert('비밀번호가 동일하지 않습니다. 다시 입력해주세요.');
				return false;
			}
		}

		//아이디 중복 확인
		function usernameCheck(){
			var username = document.querySelector("#username").value;
			
			fetch("/user/usernameCheck/"+username).then(function(r){
				return r.text();
			}).then(function(r){
				console.log(r);
				var status = r; //ok 중복되지 않음.
				var et = document.querySelector("#username_input");

				if(status === "ok"){
					et.innerHTML = "사용할 수 있는 아이디 입니다.";
				}else{
					et.innerHTML = "이미 존재하는 아이디 입니다. 다른 아이디로 시도해주세요.";
				}
			});
		}
	</script>

	<%@include file="../include/footer.jsp"%>
</body>
</html>