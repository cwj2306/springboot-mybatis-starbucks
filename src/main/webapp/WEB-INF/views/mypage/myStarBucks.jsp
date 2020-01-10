<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/content.css">
    <link rel="stylesheet" href="/css/jquery.bxslider.css">
    <link rel="stylesheet" href="/css/auth.css">
    <link rel="stylesheet" href="/css/myStarbucks.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Starbucks Coffee Korea :: Login </title>
</head>
<body>
<div class="wrap">
    <div id="header_include"></div>
    <!-- header 시작 (나중에 include로 빼서 넣기) -->
    <header>
         <%@include file="../include/nav.jsp"%>
    </header>
    <!-- header 끝 -->
    <!-- 본문 시작 -->
    <div class="my_sb_container"> 
        <!-- 상단 제목영역 시작 -->
        <div class="my_sb_top_container">
            <h1>My Starbucks</h1>
            <div clss="my_sb_top_nav">
                <a href="#">HOME</a>
                <p> > </p>
                <a href="#">My Starbucks</a>
            </div>
        </div>
        <!-- 상단 제목영역 끝 -->
        <div class="content">
            <!-- 좌측 정보탭 시작 -->
            <div class="my_sb_content">
                <!-- 회색 박스 시작 -->
                <div class="my_sb_gray_box">
                    <div class="gray_box_left">
                        <div class="user_icon">
                            <img src="../img/my_starbucks/user_pic_sample.jpg" alt="user_icon">
                        </div>
                        <p><span id="name">회원명</span>님은 현재 <span id="level">Level명</span>이십니다.</p>
                        <div class="gray_box_button_div">
                            <button>개인정보 수정</button>
                            <button>비밀번호 변경</button>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="gray_box_right">
                        <h3>My 리워드</h3>
                        <div>
                            <div class="star_icon">
                                <img src="../img/my_starbucks/star_line.png" alt="star_icon">
                                <p id="num" style="font-size:40px;">0</p>
                            </div>
                            <p><span id="left_num">5</span id="left_num">개의 별★이 더 모이면 <br> <span id="level">Green Level</span>만의 특별한 혜택이!</p>
                        </div>
                        <div class="gray_box_right_button_div">
                            <button>리워드 및 혜택</button>
                            <button>별 히스토리</button>
                        </div>
                    </div>
                </div>
                <!-- 회색 박스 끝 -->
                <!-- 스타벅스 카드 시작 -->
                <div class="my_sb_card_box">
                    <div class="my_sb_card_title">
                        <p>My 스타벅스 카드</p>
                        <p>총 보유카드 : <span id ="card_num">1</span>장</p>
                    </div>
                    <div class="my_sb_card_content">
                        <img src="" alt="card_image">
                        <div class="my_sb_card_content_right">
                            <p><span id="username">닉네임</span></p>
                            <p><span id ="balance">5,000</span>원</p>
                            <p>최종 사용일 : <span id="update_date">2019-11-12 21:06:55</span></p>
                            <div class="my_sb_card_button_div">
                                <button>카드 관리</button>
                                <button>충전하기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 스타벅스 카드 끝 -->
                <!-- 아이콘 탭 시작 -->
                <div class="my_sb_icon_div">
                    <ul class="my_sb_icon_ul">
                       <li>
                           <img src="#">
                           <p>인박스</p>
                       </li> 
                       <li>
                            <img src="#">
                            <p>캘린더</p>
                        </li> 
                        <li>
                            <img src="#">
                            <p>e-쿠폰</p>
                        </li> 
                        <li>
                            <img src="#">
                            <p>카드 충전</p>
                        </li> 
                        <li>
                            <img src="#">
                            <p>카드 등록</p>
                        </li> 
                    </ul>
                </div>
                <!-- 아이콘 탭 끝 -->
            </div>
            <!-- 좌측 정보탭 끝 -->
            <!-- 우측 메뉴바 시작 -->
            <div class="my_sb_right_nav">
                <ul class="my_sb_right_ul">
                    <li>&emsp;<a href="#">My 리워드</a></li>
                    <li>&emsp;<a href="#">My 스타벅스 카드</a></li>
                    <li>&emsp;<a href="#">My 쿠폰</a></li>
                    <li>&emsp;<a href="#">My 메뉴</a></li>
                    <li>&emsp;<a href="#">My 매장</a></li>
                    <li>&emsp;<a href="#">개인정보관리</a></li>
                </ul>
            </div>
            <!-- 우측 메뉴바 끝 -->
        </div>
        <div style="clear:both;"></div>
    </div>
    <!-- footer 시작 (나중에 include로 빼서 넣기) -->
    <footer>
<%@include file="../include/footer.jsp"%>
    </footer>
    <!-- footer 끝 -->
</div>

</body>
</html>