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
<title>Starbucks Coffee Korea :: espresso </title>
</head>
<body>
<div class="wrap">
    <div id="header_include"></div>
    
     <%@include file="../include/nav.jsp"%>
    
    <!-- 본문 intro 시작 -->
    <div class="content">
        <h1>에스프레소 음료</h1>
        <div class="espresso_intro_box">
            <img src="../img/coffee/espresso_classlcs_img01.jpg">
            <div><q>오늘날, 스타벅스에 있어 꼼꼼하고 세심한 노력은 다양한 음료 메뉴만큼이나 중요합니다.</q></div>
            <p>1983년 하워드 슐츠는 이탈리아 밀라노의 한 커피숍에서 카페라떼를 한 잔 주문했습니다. 앞에 준비된 에스프레소를 봤을 때 그는 갑자기 무엇인가를 느꼈습니다.<br/>
               그것은 바로 자신의 음료를 만들기 위해 들어간 엄청난 열정과, 오랫동안 지속되는 감동을 이루어내는 훌륭한 커피를 둘러싸고 형성된 공동체였습니다.<br/>
               그는 자신이 특별한 무언가를 발견했다는 것을 깨달았습니다.</p><br/>
            <p>오늘날, 스타벅스에 있어 이처럼 꼼꼼하고 세심한 노력은 다양한 음료 메뉴만큼이나 중요합니다.<br/>
               순수하고 강렬한 에스프레소 풍미의 도피오 한 잔이나, 완벽하게 만들어진 부드러운 크림 블렌드의 라떼 한 잔 등, 모든 커피 한 잔 한 잔에는 열정이 담겨있습니다.</p>
        </div>
    </div>
    <!-- 본문 intro 끝 -->
    <!-- 컨텐츠 시작 -->
    <div class="espresso_content_box">
        <div class="espresso_content_div">
            <div class="espresso_content_div_2">
                <div class="espresso_content_item">
                    <div class="espresso_img_container"><a href="#"><img src="../img/coffee/espresso_list_img01.jpg"></a></div>
                    <p>모든 에스프레소 음료의 생명이자 영혼입니다.<br/>스타벅스에서 추출하는 모든 샷에는 깊고 강렬한 풍미를 내는 독특한 세 개의 층이 형성됩니다.</p> 
                </div>
                <div class="espresso_content_item">
                    <div class="espresso_img_container"><a href="#"><img src="../img/coffee/espresso_list_img02.jpg"></a></div>
                    <p>완벽하고 강렬한 에스프레소 샷에<br/>우유 거품이 살짝 올라갑니다.</p> 
                </div>
                <div class="espresso_content_item">
                    <div class="espresso_img_container"><a href="#"><img src="../img/coffee/espresso_list_img03.jpg"></a></div>
                    <p>에스프레소의 풍미를 느낄 수 있습니다.<br/>진한 에스프레소에 뜨거운 물을 부어서 만든 아메리카노는<br/>커피콩 그 자체만큼이나 깊이 있고 다크한 맛을 냅니다.</p> 
                </div>
                <div class="espresso_content_item">
                    <div class="espresso_img_container"><a href="#"><img src="../img/coffee/espresso_list_img04.jpg"></a></div>
                    <p>달콤한 드리즐, 빽빽한 우유 거품, 진한 에스프레소, 스팀 밀크, 달콤한 끝 맛이 층을 이루는 환상적인 맛입니다.</p> 
                </div>
                <div class="espresso_content_item">
                    <div class="espresso_img_container"><a href="#"><img src="../img/coffee/espresso_list_img05.jpg"></a></div>
                    <p>부드러운 두꺼운 우유 거품 아래에 다크한 에스프레소가 숨겨져 있습니다. 바리스타의 솜씨의 정수를 보여줍니다.</p> 
                </div>
                <div class="espresso_content_item">
                    <div class="espresso_img_container"><a href="#"><img src="../img/coffee/espresso_list_img06.jpg"></a></div>
                    <p>맛있는 에스프레소와 스팀 밀크가 섞인 라떼는<br/>더하고자 하는 어떤 맛과도 완벽한 조화를 이룹니다.</p> 
                </div>
                <div class="espresso_content_item">
                    <div class="espresso_img_container"><a href="#"><img src="../img/coffee/espresso_list_img07.jpg"></a></div>
                    <p>뜨거운 에스프레소와 달콤쌉싸름한 초콜릿이 스팀 밀크와<br/>혼합된 달콤하고 맛있는 음료입니다.</p> 
                </div>
                <div class="espresso_content_item">
                    <div class="espresso_img_container"><a href="#"><img src="../img/coffee/espresso_list_img08.jpg"></a></div>
                    <p>강렬한 리스트레토 샷과 적당한 양의 스팀 밀크가 어우러져 너무 진하지도 크리미하지도 않은 풍미를 냅니다.</p> 
                </div>
            </div>
        </div>
    </div>
    <div style="clear: both;"></div>
    <!-- 컨텐츠 끝 -->
    
    <%@include file="../include/footer.jsp"%>
    
</div>
</body>
</html>