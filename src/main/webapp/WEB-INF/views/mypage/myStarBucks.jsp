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
    <link rel="stylesheet" href="../css/myStarbucks.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Starbucks Coffee Korea :: My Starbucks </title>
</head>
<body>
<div class="wrap">
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
                        <p><span id="name">${principal.user.username}</span>님은 현재 <span id="level">${principal.user.level}</span>이십니다.</p>
<!--                         <div class="gray_box_button_div">
                            <button>개인정보 수정</button>
                            <button>비밀번호 변경</button>
                        </div> -->
                    </div>
                    <div class="line"></div>
                    <div class="gray_box_right">
                        <h3>My 리워드</h3>
                        <div>
                            <div class="star_icon">
                                <img src="../img/my_starbucks/star_line.png" alt="star_icon">
                                <p id="num" style="font-size:40px;">${amount}</p>
                            </div>
                            <c:choose>
                            	<c:when test="${principal.user.level eq 'Bronze'}">
                            		 <c:set var="lessCount" value="${20-amount}"/>
                           			 <p><span id="left_num"><c:out value="${lessCount}"/></span id="left_num">개의 별★이 더 모이면 <br> <span id="level">Silver Level</span>만의 특별한 혜택이!</p>
                            	</c:when>
                            	
                            	<c:when test="${principal.user.level eq 'Silver'}">
                            		<c:set var="lessCount" value="${50-amount}"/>
                            		<p><span id="left_num"><c:out value="${lessCount}"/></span id="left_num">개의 별★이 더 모이면 <br> <span id="level">Gold Level</span>만의 특별한 혜택이!</p>
                            	</c:when>
                            	<c:otherwise>
                            	<p><span id="level">최고 레벨 Gold Level</span>만의 특별한 혜택을 누리세요!</p>
                            	</c:otherwise>
                            </c:choose>

                        	
                        </div>
<!--                         <div class="gray_box_right_button_div">
                            <button>리워드 및 혜택</button>
                            <button>별 히스토리</button>
                        </div> -->
                    </div>
                </div>
                <!-- 회색 박스 끝 -->
                <!-- 스타벅스 카드 시작 -->
                <c:if test="${card ne null}">
                <div class="my_sb_card_box">
                    <div class="my_sb_card_title">
                        <h4>My 스타벅스 카드</h4>
                        <p>총 보유카드 : <span id ="card_num">1</span>장</p>
                        <hr/>
                    </div>
                    <div class="my_sb_card_content">
                        <div class="my_sb_card_content_left">
                            <img class="my_sb_card_img" src="${card.cardImage}" alt="card_image">
                        </div>
                        <div class="my_sb_card_content_right"
                        >
                            <p><span id="username">${card.cardName}</span></p>
                            <p><span id ="balance">${card.point}</span>원</p>
                            <p>등록일 : <span id="update_date">${card.createDate}</span></p>
                            
                            <div class="my_sb_card_button_div">
                            <form action="/mypage/pay">
                            <button>충전하기</button>
                            </form>
                            <form action="/mypage/deleteCard/${card.id}" method="post">
                                <button>카드삭제</button>
                            </form>
                            </div>
                        </div>
                    </div>
                </div>
                </c:if>
                <!-- 스타벅스 카드 끝 -->
            </div>
            <!-- 좌측 정보탭 끝 -->
            <!-- 우측 메뉴바 시작 -->
		<%@include file="../include/menu.jsp"%>
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
<script>
  // 우측 메뉴바 슬라이드 토글
    $(function() {
        $(document).ready(function() {
            $('#slide_toggle_1').click(function() {
                $("#slide_toggle_ul_1").slideToggle();
            });
        });
    });
    $(function() {
        $(document).ready(function() {
            $('#slide_toggle_2').click(function() {
                $("#slide_toggle_ul_2").slideToggle();
            });
        });
    });
</script>
<%@include file="../include/footer.jsp"%>
</body>
</html>