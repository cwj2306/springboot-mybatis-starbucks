<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/mypage/cardSave/${card.id}" method="post">
<input type="hidden" name="image" value="${detail.image}"><img src="${detail.image}">
<input type="hidden" name="name" value="${detail.name}"><div>${detail.name}</div>
<button>내카드 등록</button>
</form>
</body>
</html>