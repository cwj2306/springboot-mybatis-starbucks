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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    
<title>Starbucks Coffee Korea :: coffee </title>
</head>
<body>
<div class="wrap">
    <div id="header_include"></div>
    
    <%@include file="../include/nav.jsp"%>
    
    <!-- 본문 시작 -->
    <div class="content">
        <h1>커피</h1>
        <div class="content_category">
            <h4>분류 보기</h4>
            <hr>
            <ul class="content_category_selectAll">
                <li><a href="#">전체 상품보기</a></li>
            </ul>
            <form class="content_category_list">
                <label><input type="checkbox" name="content_coffee" value="blonde_roase">블론드 로스트</label>
                <label><input type="checkbox" name="content_coffee" value="medium_roast">미디엄 로스트</label>
                <label><input type="checkbox" name="content_coffee" value="dark_roast">다크 로스트</label>
            </form>
        </div>
        <!-- 블론드 로스트 시작 -->
        <div class="coffee_divBox">
            <div class="content_item_title">
                <div class="content_item_title_icon" style="background-color: #9b704d;">
                    <img src="../img/coffee/coffee_bean_icon.png" />
                </div>
                <p>블론드 로스트</p>
            </div>
            <!-- item 있는만큼 for문 돌려야 함, 테스트 아이템 넣음-->
            <div class="content_item_container">
                <div class="content_item_img_container"><img src="/image/adventure.jpg" /></div>
                <p class="content_item_name">크리스마스 블론드 로스트 250g</p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
            <div class="content_item_container">
                <div class="content_item_img_container"><img src="../img/coffee/espresso_classlcs_img01.jpg" /></div>
                <p class="content_item_name">크리스마스 블론드 로스트 250g</p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
            <div class="content_item_container">
                <div class="content_item_img_container"><img src="../img/coffee/[11031517].jpg" /></div>
                <p class="content_item_name">크리스마스 블론드 로스트 250g</p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
            <div class="content_item_container">
                <div class="content_item_img_container"><img src="../img/coffee/[11031517].jpg" /></div>
                <p class="content_item_name">크리스마스 블론드 로스트 250g</p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
            <div class="content_item_container">
                <div class="content_item_img_container"><img src="../img/coffee/[11031517].jpg" /></div>
                <p class="content_item_name">크리스마스 블론드 로스트 250g</p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
        </div>
        <div style="clear:both;"></div>
        <!-- 블론드 로스트 끝 -->
        <!-- 미디엄 로스트 시작 -->
        <div class="coffee_divBox">
            <div class="content_item_title">
                <div class="content_item_title_icon" style="background-color: #924c2e;">
                    <img src="../img/coffee/coffee_bean_icon.png" />
                </div>
                <p>미디엄 로스트</p>
            </div>
            <!-- item 있는만큼 for문 돌려야 함, 테스트 아이템 넣음-->
            <div class="content_item_container">
                <div class="content_item_img_container"><img src="../img/coffee/[11031517].jpg" /></div>
                <p class="content_item_name">크리스마스 블론드 로스트 250g</p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
        </div>
        <div style="clear:both;"></div>
        <!-- 미디엄 로스트 끝 -->
        <!-- 다크 로스트 시작 -->
        <div class="coffee_divBox">
            <div class="content_item_title">
                <div class="content_item_title_icon" style="background-color: #4f2c1d;">
                    <img src="../img/coffee/coffee_bean_icon.png" />
                </div>
                <p>다크 로스트</p>
            </div>
            <!-- item 있는만큼 for문 돌려야 함, 테스트 아이템 넣음-->
            <div class="content_item_container">
                <div class="content_item_img_container"><img src="../img/coffee/[11031517].jpg" /></div>
                <p class="content_item_name">크리스마스 블론드 로스트 250g</p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
            <div class="content_item_container">
                <div class="content_item_img_container"><img src="../img/coffee/[11031517].jpg" /></div>
                <p class="content_item_name">크리스마스 블론드 로스트 250g</p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
        </div>
        <div style="clear:both;"></div>
        <!-- 다크 로스트 끝 -->
    </div>
    
    <%@include file="../include/footer.jsp"%>
    
</div>
</body>
</html>