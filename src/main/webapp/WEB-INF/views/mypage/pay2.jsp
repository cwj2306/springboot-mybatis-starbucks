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
<meta charset="UTF-8">
<title>Starbucks Coffee Korea ::Pay</title>
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
				<div style="margin-top:35px; text-align:center; width:100%; height:330px; border:1px solid #fff; border-radius:5px;
				background:linear-gradient(135deg, #fafafa 25%, transparent 50%) -50px 0,
  								linear-gradient(225deg, #fafafa 25%, transparent 25%) -50px 0,
  								linear-gradient(315deg, #fafafa 25%, transparent 50%),
  								linear-gradient(45deg, #fafafa 25%, transparent 25%);	
    							background-size: 2em 2em;background-color: #ebebeb;">
					<div style="margin:0 auto; margin-top:100px;">
						<form action="/mypage/pay2" method="post">
							<p style="font-size:18px; margin-bottom:10px; font-weight:bolder;">충전 금액</p><br>
							<hr style="width:30%; margin:0 auto; margin-bottom:20px;">
							<input type="number" name="point" style="width:100px; height:25px; border:1px solid #b0b0b0;">&ensp;원 &ensp;
							<button style="background-color:#006633; color:#fff; width:80px; height:28px; border:1px solid #fff; border-radius:5px;">충전하기</button>
							<hr style="width:30%; margin:0 auto; margin-top:20px;">
						</form>
					</div>
				</div>
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
</body>
</html>