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
<title>Starbucks Coffee Korea ::Pay</title>
</head>
<body>
<%@include file="../include/nav.jsp"%>
	
<form action="/mypage/pointup" method="post">
	카드번호<input type="number" required="required"><br />
	카드유효기간<input type="date" required="required"><br /> 
	카드비밀번호<input type="password" required="required"><br /> 
	충전금액<input type="number" name="point">원
	<button>충전하기</button>
</form>
	
<%@include file="../include/footer.jsp"%>

</body>
</html>