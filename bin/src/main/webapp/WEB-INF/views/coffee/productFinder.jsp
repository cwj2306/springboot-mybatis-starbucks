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
<title>Starbucks Coffee Korea :: 내게 어울리는 커피</title>
</head>
<body>
	<%@include file="../include/nav.jsp"%>
	<form action="/coffee/favorite">

		맛: <label><input type="radio" name="flavor" value="짭짤한 맛">짭짤한 맛 </label>
		<label><input type="radio" name="flavor" value="과일 맛">과일 맛 </label>
		<label> <input type="radio" name="flavor" value="구운 맛">구운 맛 </label>
		<label> <input type="radio" name="flavor" value="달콤한(캐러멜) 맛">달콤한(캐러멜) 맛</label>
		 <br />
		느낌: <label><input type="radio" name="feel" value="상쾌하고 부드러운 느낌">상쾌하고 부드러운 느낌 </label>
				<label><input type="radio" name="feel" value="오랫동안 여운이 남는 느낌">오랫동안 여운이 남는 느낌 </label>
				<br />
		강도: <label><input type="radio" name="strong" value="은은하고 부드러움">은은하고 부드러움</label>
				<label> <input type="radio" name="strong" value="강도가 세고 강렬함">강도가 세고 강렬함</label>
				 <br />
				
		<button>내취향 커피찾기</button>
	</form>
	<%@include file="../include/footer.jsp"%>
</body>
</html>