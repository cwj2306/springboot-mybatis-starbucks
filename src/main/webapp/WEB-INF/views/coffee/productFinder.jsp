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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Starbucks Coffee Korea :: product finder </title>
</head>
<body>
<div class="wrap">
    <!-- header 시작 (나중에 include로 빼서 넣기) -->
    <%@include file="../include/nav.jsp"%>
    <!-- header 끝 -->
    <!-- 본문 시작 -->
    <div class="content">
        <div class="notice_title">
            <h1>나와 어울리는 커피</h1>
            <p style="margin-top:10px; font-size:14px;">여러분에게 잘 맞는 커피를 찾기 위한 3가지 질문입니다.</p>
            <ul class="notice_nav">
                <li><a href="#">나와 어울리는 커피</a></li>
                <li>&ensp;>&ensp;</li>
                <li><a href="#">HOME</a></li>
            </ul>
        </div>
    </div>
    <!-- 나와 어울리는 커피 시작 -->
    <div class="product_finder_div">
        <div class="product_finder_content_div">
            <form action="/coffee/favorite">
                <div class="check_flavor">
                    <div>
                        <img class="product_finder_title" src="../img/coffee/taste_find_ttl1.png" />
                    </div>
                    <div>
                        <input id="flavor1" type="radio" name="flavor" class="radio_button" value="짭짤한 맛">
                        <label for="flavor1">
                            <img src="../img/coffee/taste1_1.png" />
                            <p>짭짤한 맛</p>
                        </label>
                    </div>
                    <div>
                        <input id="flavor2" type="radio" name="flavor" class="radio_button" value="과일 맛">
                        <label for="flavor2">
                            <img src="../img/coffee/taste1_2.png" />
                            <p>과일 맛</p>
                        </label>
                    </div>
                    <div>
                        <input id="flavor3" type="radio" name="flavor" class="radio_button" value="구운 맛">
                        <label for="flavor3">
                            <img src="../img/coffee/taste1_3.png" />
                            <p>구운 맛</p>
                        </label>
                    </div>
                    <div>
                        <input id="flavor4" type="radio" name="flavor" class="radio_button" value="달콤한(캐러멜) 맛">
                        <label for="flavor4">
                            <img src="../img/coffee/taste1_4.png" />
                            <p>달콤한 (캐러멜) 맛</p>
                        </label>
                    </div>
                </div>
                <div class="check_feel">
                    <div>
                        <img class="product_finder_title" src="../img/coffee/taste_find_ttl2.png" />
                    </div>
                    <div>
                        <input id="feel1" type="radio" name="feel" class="radio_button" value="상쾌하고 부드러운 느낌">
                        <label for="feel1">
                            <img src="../img/coffee/taste2_1.png" />
                            <p>상쾌하고 부드러운 느낌</p>
                        </label>
                    </div>
                    <div>
                        <input id="feel2" type="radio" name="feel" class="radio_button" value="오랫동안 여운이 남는 느낌">
                        <label for="feel2">
                            <img src="../img/coffee/taste2_2.png" />
                            <p>오랫동안 여운이 남는 느낌</p>
                        </label>
                    </div>
                </div>
                <div class="check_strong">
                    <div>
                        <img class="product_finder_title" src="../img/coffee/taste_find_ttl3.png" />
                    </div>
                    <div>
                        <input id="strong1" type="radio" name="strong" class="radio_button" value="은은하고 부드러움">
                        <label for="strong1">
                            <img src="../img/coffee/taste3_1.png" />
                            <p>은은하고 부드러움</p>
                        </label>
                    </div>
                    <div>
                        <input id="strong2" type="radio" name="strong" class="radio_button" value="강도가 세고 강렬함">
                        <label for="strong2">
                            <img src="../img/coffee/taste3_1.png" />
                            <p>강도가 세고 강렬함</p>
                        </label>
                    </div>
                </div>
                <button class="fund_button">내취향 커피찾기</button>
            </form>
        </div>
    </div>
    <!-- 나와 어울리는 커피 끝 -->
    <!-- 본문 끝 -->
    <!-- footer 시작 (나중에 include로 빼서 넣기) -->
    <%@include file="../include/footer.jsp"%>
    <!-- footer 끝 -->
</div>
<script>
$(document).ready(function() {
    $("input:radio[name=flavor]").click(function() {
        $(".check_flavor").slideUp(1000);
        $(".check_feel").show();
    });

    $("input:radio[name=feel]").click(function() {
        $(".check_feel").slideUp(1000);
        $(".check_strong").show();
    });
    $("input:radio[name=strong]").click(function() {
        $(".fund_button").trigger("click");
    });
});
</script>
</body>
</html>