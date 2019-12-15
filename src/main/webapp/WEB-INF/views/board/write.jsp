<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/content.css">
    <link rel="stylesheet" href="/css/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@include file="../include/nav.jsp"%>
	<form action="/board/writeProc" method="post">
		<input type="text" name="title" placeholder="title" /><br />
		<textarea rows="5" cols="20" name="content">
	
	    </textarea><br />
	    <input type="submit" value="작성완료" />
	</form>
<%@include file="../include/footer.jsp"%>
</body>
</html>