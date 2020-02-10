<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
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
    <!-- header 시작 -->
    <%@include file="include/nav.jsp"%>
    <!-- header 끝 -->
    <!-- promo 이미지 시작 -->
    <div class="top_promo_div">
        <div class="promo_img_01"><img src="img/index/20_newyear_emblem.png"></div>
        <div class="promo_img_02"><img src="img/index/20_newyear_bev1_cup.png"></div>
        <div class="promo_img_03"><img src="img/index/20_newyear_bev2_cup.png"></div>
        <div class="promo_img_04"><img src="img/index/20_newyear_bev3_cup.png"></div>
    </div>
    <!-- promo 이미지 끝 -->
    <!-- 음료 / 카드 / 메뉴 하이퍼링크 시작 -->
    <div class="slider main_img_section" style="margin:0;padding:0;">
        <div class="main_drink_section">
            <div class="main_img_section_textbox">
                <p class="line_button_box" style="left:1745px;">
                    <a href="/coffee/product_list" style=" color:#fff;">자세히 보기</a>
                </p>
            </div>
        </div>
        <div class="main_card_section">
            <div class="main_img_section_textbox">
                <p class="line_button_box" style="left:125px;">
                    <a href="/menu/card_list" style=" color:#fff;">자세히 보기</a>
                </p>
            </div>
        </div>
        <div class="main_menu_section">
            <div class="main_img_section_textbox">
                <p class="line_button_box" style="left:1680px;">
                    <a href="/menu/drink_list" style=" color:#fff;">자세히 보기</a>
                </p>
            </div>
        </div>
    </div>
    <!-- 음료 / 푸드 / 상품 / 카드 / 메뉴 하이퍼링크 끝 -->
    <!-- 원두 시작 -->
    <div class="coffee_bean_div">
        <div style="float:left;" class="coffee_bean_pattern"><img src="img/index/coffee_bean_pattern.png" /></div>
        <div style="float:left;"><img src="img/index/pick_fav_img_1.png" style="margin-left:3%; margin-top:130px;"></div>
        <div style="float:left;"><img src="img/index/20_newyear_reserve_txt.png" style="margin-left:50px; margin-top:100px;"></div>
        <div class="coffee_bean_fadein" style="float:right;"><img src="img/index/coffee_top_bg.png" style="position: relative; bottom: -5px;"></div>
    </div>
    <!-- 원두 끝 -->
    <!-- 나와 어울리는 커피 시작 -->
    <div class="pick_fav_div">
        <div class="pick_fav_text_div">
            <div class="pick_text_01">
                <p>PICK<br></p>
                <p>Y O U R<br></p>
                <p>F A V O R I T E</p>
            </div>
            <div class="pick_text_02">
                <P>
                    <b>다양한 메뉴</b>를<br>
                    <b>스타벅스</b>에서 즐겨보세요.
                </P>
            </div>
            <div class="pick_text_03">
                <P>
                    스타벅스만의 특별함을 경험할 수 있는 <b>최상의 선택 음료</b><br>
                    스타벅스 커피와 완벽한 어울림을 <b>자랑하는 푸드</b><br>
                    다양한 시도와 디자인으로 <b>가치를 더하는 상품</b><br>
                    소중한 사람에게 마음을 전하는 가장 좋은 방법 <b>스타벅스 카드</b>
                </P>
            </div>
            <div class="pick_text_04">
                <p class="line_button_box" style="float:right;">
                    <a href="/coffee/productFinder" style=" color:#fff;">자세히 보기</a>
                </p>
            </div>
        </div>
        <div class="pick_fav_img_div">
            <img src="img/index/pick_fav_bg.png">
        </div>
    </div>
    <!-- 나와 어울리는 커피 끝  -->
    <!-- 공지 확인 시작 -->
    <div class="whats_new_div">
        <div class="whats_new_circle_div">
            <div class="whats_new_circle"
                onmouseover="$('.whats_new_text').show()"
                onmouseout="$('.whats_new_text').hide()">
            </div>
            <div class="whats_new_text" style="display:none;">
                <h1>What's new</h1>
                <p style="margin-top:10px;">공지 확인 버튼을 누르고</p>
                <p style="margin-bottom:10px;">스타벅스의 새로운 소식을 확인해보세요</p>
                <button class="line_button_box" style="width:120px; height:35px;" onclick="location.href='/board'">공지 확인</button>
            </div>
        </div>
    </div>
    <!-- 공지 확인 끝 -->
    <!-- 매장 찾기 시작 -->
    <div class="store_search">
        <div class="store_search_img">
            <img src="img/index/search_store.png" />
        </div>
        <div class="store_search_text_div">
            <div>
                <div>
                    <h1>스타벅스를 가까이에서 경험해보세요.</h1>
                    <h2>고객님과 가장 가까이 있는 매장을 찾아보세요!</h2>
                </div>
                <div>
                    <p>차별화된 커피 경험을 누릴 수 있는 <b>리저브 매장</b></p>
                    <p>다양한 방법으로 편리하게 즐길 수 있는 <b>드라이브 스루 매장</b></p>
                    <p>함게해서 더 따뜻할 수 있는 지역사회 소통 공간 <b>커뮤니티 매장</b></p>
                </div>
                <div>
                    <button class="line_button_box" style="width:120px; height:35px;" onclick="location.href='/store_map'">매장 찾기</button>
                </div>
            </div>
        </div>
        <div style="clear:both; animation: none;"></div>
    </div>
    <!-- 매장 찾기 끝 -->
    <!-- footer 시작 -->
    <%@include file="include/footer.jsp"%>
    <!-- footer 끝 -->
</div>
</div>
</body>
</html>