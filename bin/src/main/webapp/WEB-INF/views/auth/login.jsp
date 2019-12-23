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

	<form action="/user/loginProc" method="POST" onsubmit="return validateCheck()">
		<table>
			<tr>
				<th>Username</th>
				<td><input type="text" name="username" id="username" value="username" /></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="password" id="password"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="로그인" /></td>
			</tr>
		</table>
	</form>
	<button onclick='location.href="/user/join"'>회원가입</button>


	<%@include file="../include/footer.jsp"%>
</body>
</html>