<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/content.css">
    <link rel="stylesheet" href="../css/jquery.bxslider.css">
    <link rel="stylesheet" href="../css/auth.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Starbucks Coffee Korea :: MyCard</title>
</head>
<body>
	<%@include file="../include/nav.jsp"%>
	<img src="${card.cardImage}">
	<form action="/mypage/deleteCard/${card.id}" method="post">
		<table>
			<tr>
				<th>카드명</th>
				<th>등록일</th>
				<th>포인트</th>
			</tr>
			<tr>
				<td>${card.cardName}</td>
				<td>${card.createDate}</td>
				<td>${card.point}원</td>
			</tr>
		</table>
		<button>삭제</button>
	</form>
	<form action="/mypage/pay">
		<input type="number" name="point" placeholder="충전할 금액 입력" required="required">
		<button>충전하기</button>
	</form>

	<%@include file="../include/footer.jsp"%>
</body>
</html>