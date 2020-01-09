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
<title>Starbucks Coffee Korea ::MyCoffee log</title>
</head>
<body>
	<%@include file="../include/nav.jsp"%>
		<table>
			<tr>
				<th>커피명</th>
				<th>구매일</th>
				<th>가격</th>
			</tr>
			<c:forEach var="log" items="${log}">
				<tr>
					<td>${log.name}</td>
					<td>${log.createDate}</td>
					<td>${log.price}</td>
				</tr>
			</c:forEach>
		</table>
	<%@include file="../include/footer.jsp"%>
</body>
</html>