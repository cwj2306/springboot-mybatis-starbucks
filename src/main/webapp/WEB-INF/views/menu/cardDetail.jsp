<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Starbucks Coffee Korea :: CardDetail</title>
</head>
<body>
	<%@include file="../include/nav.jsp"%>
	<form action="/mypage/cardSave/${card.id}" method="post">
		<input type="hidden" name="image" value="${detail.image}"><img
			src="${detail.image}"> <input type="hidden" name="name"
			value="${detail.name}">
		<div>${detail.name}</div>
		<button>내카드 등록</button>
	</form>
	<%@include file="../include/footer.jsp"%>
</body>
</html>