<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/mypage/bevSave/${bev.id}" method="post">
<img src="${detail.image}"><input type="hidden" name="name" value="${detail.name}">
<div>${detail.name}</div><div>${detail.price}원</div><button>내상품 등록</button>
</form>
</body>
</html>