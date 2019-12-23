<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/mypage/coffeeSave/${coffee.id}" method="post">
<img src="${coffee.image}">
<input type="hidden" name="name" value="${coffee.name}">
<div>${coffee.name}</div>${coffee.price}원 <button>내상품 등록</button>
</form>
</body>
</html>