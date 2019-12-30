<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>음료명</th>
			<th>등록일</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="coffee" items="${coffeeList}">
			<tr>
				<td>${coffee.coffeeName}</td>
				<td>${coffee.createDate}</td>
				<td><a href="/mypage/deleteCoffee/${coffee.id}">삭제</a></td> <!--체크박스로바꿔야함 체크박스 삭제 요청 어캐하지-->
			</tr>
		</c:forEach>
	</table>
</body>
</html>