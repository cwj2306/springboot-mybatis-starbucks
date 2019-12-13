<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 수정중 -->
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
<title>Starbucks Coffee Korea :: food </title>
</head>
<body>
<div class="wrap">
    <div id="header_include"></div>
    
    <%@include file="../include/nav.jsp"%>
    
    <!-- 본문 시작 -->
    <div class="content">
        <h1>푸드</h1>
        <div class="content_category">
            <h4>분류 보기</h4>
            <hr>
            <ul class="content_category_selectAll">
                <li><a href="#">전체 상품보기</a></li>
            </ul>
            <form class="content_category_list">
                <label><input type="checkbox" name="content_food" value="bakery">베이커리</label>
                <label><input type="checkbox" name="content_food" value="cake">케이크</label>
                <label><input type="checkbox" name="content_food" value="sandwich_salad">샌드위치 & 샐러드</label>
                <label><input type="checkbox" name="content_food" value="hot_food">따뜻한 푸드</label>
                <label><input type="checkbox" name="content_food" value="fruit_yogurt">과일 & 요거트</label>
                <label><input type="checkbox" name="content_food" value="snack_dessert">스낵 & 미니 디저트</label>
                <label><input type="checkbox" name="content_food" value="icecream"">아이스크림</label>
            </form>
        </div>
        <!-- 음료 메뉴 시작 -->
        <!-- 카테고리 박스 시작 (샘플로 4종류만 출력함) -->
        <div class="coffee_divBox">
            <div class="content_item_title">
                <div class="content_item_title_icon" style="background-color: #006633;">
                    <img src="../img/menu/coffee_cup_icon.png" />
                </div>
                <p>콜드 브루 커피</p>
                <p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</p>
            </div>
            <!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
            <div class="content_item_container">
                <div class="content_item_img_container"><a href="#"><img src="../img/menu/coffee_sample.jpg"/></a></div>
                <p class="content_item_name">커피 이름 (샘플) </p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
            <div class="content_item_container">
                <div class="content_item_img_container"><a href="#"><img src="../img/menu/coffee_sample.jpg"/></a></div>
                <p class="content_item_name">커피 이름 (샘플) </p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
            <div class="content_item_container">
                <div class="content_item_img_container"><a href="#"><img src="../img/menu/coffee_sample.jpg"/></a></div>
                <p class="content_item_name">커피 이름 (샘플) </p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
            <div class="content_item_container">
                <div class="content_item_img_container"><a href="#"><img src="../img/menu/coffee_sample.jpg"/></a></div>
                <p class="content_item_name">커피 이름 (샘플) </p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
            <div class="content_item_container">
                <div class="content_item_img_container"><a href="#"><img src="../img/menu/coffee_sample.jpg"/></a></div>
                <p class="content_item_name">커피 이름 (샘플) </p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
        </div>
        <div style="clear:both;"></div>
        <!-- 카테고리 박스 끝 -->
        <!-- 카테고리 박스 시작 -->
        <div class="coffee_divBox">
            <div class="content_item_title">
                <div class="content_item_title_icon" style="background-color: #006633;">
                    <img src="../img/menu/coffee_cup_icon.png" />
                </div>
                <p>프라푸치노</p>
                <p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</p>
            </div>
            <!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
            <div class="content_item_container">
                <div class="content_item_img_container"><a href="#"><img src="../img/menu/coffee_sample.jpg"/></a></div>
                <p class="content_item_name">커피 이름 (샘플) </p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
        </div>
        <div style="clear:both;"></div>
        <!-- 카테고리 박스 끝 -->
        <!-- 카테고리 박스 시작 -->
        <div class="coffee_divBox">
            <div class="content_item_title">
                <div class="content_item_title_icon" style="background-color: #006633;">
                    <img src="../img/menu/coffee_cup_icon.png" />
                </div>
                <p>브루드 커피</p>
                <p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</p>
            </div>
            <!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
            <div class="content_item_container">
                <div class="content_item_img_container"><a href="#"><img src="../img/menu/coffee_sample.jpg"/></a></div>
                <p class="content_item_name">커피 이름 (샘플) </p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
        </div>
        <div style="clear:both;"></div>
        <!-- 카테고리 박스 끝 -->
        <!-- 카테고리 박스 시작 -->
        <div class="coffee_divBox">
            <div class="content_item_title">
                <div class="content_item_title_icon" style="background-color: #006633;">
                    <img src="../img/menu/coffee_cup_icon.png" />
                </div>
                <p>에스프레소</p>
                <p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</p>
            </div>
            <!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
            <div class="content_item_container">
                <div class="content_item_img_container"><a href="#"><img src="../img/menu/coffee_sample.jpg"/></a></div>
                <p class="content_item_name">커피 이름 (샘플) </p>
                <p class="content_item_price">가격 : 7000원</p>
            </div>
        </div>
        <div style="clear:both;"></div>
        <!-- 카테고리 박스 끝 -->
        <!--음료 메뉴 끝-->
    </div>
    <!-- 본문 끝 -->
    
    <%@include file="../include/footer.jsp"%>
    
</div>
</body>
</html>