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
    <link rel="stylesheet" href="../css/modal.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Starbucks Coffee Korea :: Favorite</title>
</head>
<body>
	<%@include file="../include/nav.jsp"%>
	
	<label class="favorite" param="${coffee.id}"><div class="content_item_container">
	<div class="content_item_img_container"><img src="${coffee.image}"></div>
	<p>${coffee.name}</p>
</div></label>

<!-- 디테일 Modal 시작 -->
		<div id="modal">
			<div id="detailBox">
				<div class="detailPopupItem"></div>
				<div class="detailPoupClose">
					<button type="button">닫기</button>
				</div>
			</div>
		</div>
	<!-- 디테일 Modal 끝 -->
	<script type="text/javascript" src="/js/modal.js"></script>
</body>
</html>