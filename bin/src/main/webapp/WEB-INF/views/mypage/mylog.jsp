<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/content.css">
    <link rel="stylesheet" href="../css/jquery.bxslider.css">
    <link rel="stylesheet" href="../css/myStarbucks.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Starbucks Coffee Korea :: My Starbucks </title>
</head>
<body>
<div class="wrap">
    <!-- header 시작 (나중에 include로 빼서 넣기) -->
    <%@include file="../include/nav.jsp"%>
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
            <div class="my_sb_content" style="margin-top:18px;">
                <div class="receipt_result_table_div">
                    <p style="text-align:right; font-size:10px; margin-bottom:10px; color:#444;">* 매장에 방문하여 거래하신 건에 한하여 전자 영수증을 확인하실 수 있습니다.</p>
                    <table class="my_sb_menu_table" style="margin-bottom:60px;">
                        <tr>
                            <td style="width:30%;">상품명</td>
                            <td>구매일</td>
                            <td>가격</td>
                            <td>수량</td>
                        </tr>
                        <!-- 데이터 있는만큼 출력 시작 -->
                        <c:forEach var="log" items="${log}">
                            <tr>
                                <td>${log.name}</td>
                                <td>${log.createDate}</td>
                                <td>${log.price}</td>
                                <td>${log.amount}</td>
                            </tr>
                        </c:forEach>
                        <!-- 데이터 있는만큼 출력 끝 -->
                    </table>
                </div>
            </div>
            <!-- 우측 메뉴바 시작 -->
		<%@include file="../include/menu.jsp"%>
            <!-- 우측 메뉴바 끝 -->
        </div>
        <div style="clear:both;"></div>
    </div>
    <!-- footer 시작 (나중에 include로 빼서 넣기) -->
   <%@include file="../include/footer.jsp"%>
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
</body>
</html>