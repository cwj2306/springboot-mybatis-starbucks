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
    <link rel="stylesheet" href="../css/notice.css">
   <link rel="stylesheet" href="../css/modal.css">
   <script type="text/javascript" src="/js/modal.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Starbucks Coffee Korea :: favorite</title>
</head>
<body>
<div class="wrap">
    <!-- header 시작 (나중에 include로 빼서 넣기) -->
    <%@include file="../include/nav.jsp"%>
    <!-- header 끝 -->
    <!-- 본문 시작 -->
    <div class="content_product_finder_view">
        <div class="content">
            <div class="notice_title">
                <h1>나와 어울리는 커피</h1>
                <p style="margin-top:10px; font-size:14px;">당신과 잘 어울릴 것 같은 스타벅스의 커피 입니다.</p>
                <ul class="notice_nav">
                    <li><a  href="#">나와 어울리는 커피</a></li>
                    <li>&ensp;>&ensp;</li>
                    <li><a href="#">HOME</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 나와 어울리는 커피 시작 -->
    <div class="product_finder_view_div">
        <div class="product_finder_content_div">
             <!-- 커피 사진 시작 -->
            <div class="finder_view_left_div">
                <a class="favorite" param="${coffee.id}" href="#"><img class="finder_view_img" src="${coffee.image}"/></a>
            </div>
            <!-- 커피 사진 끝 -->
            <!-- 커피 텍스트 시작 -->
            <div class="finder_view_right_div">
                <h1>${coffee.name}</h1>
                <hr/>
                <p><b>${coffee.price}원</b></p>
                
            </div>
            <!-- 커피 텍스트 끝 -->
        </div>
    </div>
    <!-- 나와 어울리는 커피 끝 -->
    <!-- 본문 끝 -->

    <!-- footer 시작 (나중에 include로 빼서 넣기) -->
    <%@include file="../include/footer.jsp"%>
    <!-- footer 끝 -->
</div>

<!-- 디테일 Modal 시작 -->
		<div id="modal">
			<div id="detailBox">
				<div class="detailPoupClose" style="text-align:right;">
					<button type="button" style="width:30px; height:30px; text-align:center; border:1px solid #fff; border-radius:5px; color:#FFF; background-color:#222;">X</button>
				</div>
				<div class="detailPopupItem"></div>
			</div>
		</div>
		<!-- 디테일 Modal 끝 -->

 <script type="text/javascript" src="/js/modal.js"></script>
</body>
</html>