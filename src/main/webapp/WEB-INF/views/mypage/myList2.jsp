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
<title>Starbucks Coffee Korea ::MyBeverage</title>
</head>
<body>
	<%@include file="../include/nav.jsp"%>
	<form action="/mypage/deleteBev" method="post">
		<table>
			<tr>
				<th>선택</th>
				<th>음료명</th>
				<th>등록일</th>
			</tr>

			<c:forEach var="bev" items="${bevList}">
				<tr>
					<td><input type="checkbox" name="check" value="${bev.id}"></td>
					<td>${bev.beverageName}</td>
					<td>${bev.createDate}</td>
				</tr>
			</c:forEach>
		</table>
		<button>선택삭제</button>
	</form>
	<%@include file="../include/footer.jsp"%>
</body>
</html>