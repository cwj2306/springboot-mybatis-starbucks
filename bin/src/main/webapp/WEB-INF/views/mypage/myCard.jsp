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
	<img src="${card.cardImage}">
	<table>
		<tr>
			<th>카드명</th>
			<th>등록일</th>
			<th>포인트</th>
			<th>삭제</th>
		</tr>
		<tr>
			<td>${card.cardName}</td>
			<td>${card.createDate}</td>
			<td>${card.point}원</td>
			<td><a href="/mypage/deleteCard/${card.id}">삭제</a></td>
		</tr>
	</table>

	<form action="/mypage/pointup" method="post">
		<input type="number" name="point" placeholder="충전할 금액 입력">
		<button>충전하기</button>
	</form>


</body>
</html>