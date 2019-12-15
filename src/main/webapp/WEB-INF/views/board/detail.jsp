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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@include file="../include/nav.jsp"%>
제목 : ${board.title}<br/>
작성자 아이디 : ${board.userId}<br/>
내용 : ${board.content}<br/>
<a href ="/board/update/${board.id}">수정하기</a>
<a href ="/board/delete/${board.id}">삭제하기</a>
<button onclick="location.href='/board'">목록</button>
	
	<table border="1">
		<c:if test="${!empty pan[1].id}">
		<tr>
			<th>윗글</th>
			<td><a href="/board/${pan[1].id}">${pan[1].title}</a></td>
		</tr>
		</c:if>

		<c:if test="${!empty pan[0].id}">
		<tr>
			<th>아랫글</th>
			<td><a href="/board/${pan[0].id}">${pan[0].title}</a></td>
		</tr>
		</c:if>
	</table>
<%@include file="../include/footer.jsp"%>
</body>
</html>