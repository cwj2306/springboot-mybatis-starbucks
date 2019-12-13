<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="/js/jquery.bxslider.min.js"></script>
<script>
  $(document).ready(function(){
    $('.slider').bxSlider({
        auto:true,
        controls:false,
        pager:false
    });
  });
</script>
<title>Starbucks Coffee Korea :: index </title>
</head>
<body>
<div class="wrap">
    <div id="header_include"></div>
    
    <%@include file="include/nav.jsp"%>
    
    <!-- christmas promo 이미지 시작 -->
    <div class="top_promo_div">
    </div>
    <!-- christmas promo 이미지 끝 -->
    <!-- 음료 / 카드 / 메뉴 하이퍼링크 시작 -->
    <div class="slider main_img_section" style="margin:0;padding:0;">
        <div class="main_drink_section">
            <div class="main_img_section_textbox">
            <p>음료</p>
            <p>스타벅스의 특별함을 경험해보세요.</p>
            <p>특별한 스타벅스 경험을 고객 한 분, 한 분에게<br/>한잔의 음료를 통해 전달합니다.</p>
            <p><a href="#">자세히 보기</a></p>
            </div>
        </div>
        <div class="main_card_section">
            <div class="main_img_section_textbox">
            <p>카드</p>
            <p>따뜻한 커피와 마음을 전하기 가장 좋은 방법!</p>
            <p>주는 사람도 받는 사람도 모두 행복해지는<br/>스타벅스만의 특별함을 느껴보세요.</p>
            <p><a href="#">자세히 보기</a></p>
            </div>
        </div>
        <div class="main_menu_section">
            <div class="main_img_section_textbox">
            <p>메뉴 이야기</p>
            <p>스타벅스에서 만날 수 있는 특별한 메뉴를 소개합니다.</p>
            <p>자유롭고 세련된 감각의<br/>콜드브루와 스타벅스 타바나를 만나 보세요.</p>
            <p><a href="#">자세히 보기</a></p>
            </div>
        </div>
    </div>
    <!-- 음료 / 푸드 / 상품 / 카드 / 메뉴 하이퍼링크 끝 -->
    
    <%@include file="include/footer.jsp"%>
    
</div>
</body>
</html>