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
    <link rel="stylesheet" href="../css/modal.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Starbucks Coffee Korea :: card </title>
</head>
<body>
<div class="wrap">
    <div id="header_include"></div>
    
    <%@include file="../include/nav.jsp"%>
    
    <!-- 본문 시작 -->
    <div class="content">
        <h1>카드</h1>

        <!-- 카드 시작 -->
        <div class="coffee_divBox">
            <div class="content_item_title">
                <div class="content_item_title_icon" style="background-color: #006633;">
                    <img src="../img/menu/card_icon.png" />
                </div>
                <p>카드</p>
            </div>
            <!-- 아이템 시작 -->
            <c:forEach var="card" items="${cardList}">
            <label class="cardDetail" param="${card.id}"><div class="content_item_container">
                <div class="content_item_img_container"><img src="${card.image}" /></div>
                <p class="content_item_name">${card.name}</p>
            </div></label>
            </c:forEach>
            <!-- 아이템 끝 -->
        </div>
        <!-- 카드 끝 -->
        <div style="clear:both;"></div>
    </div>
    <!-- 본문 끝 -->
    
    		<!-- 디테일 Modal 시작 -->
		<div id="modal">
			<div id="detailBox">
				<div class="detailPopupItem"></div>
				<div class="detailPoupClose">
					<button type="button">닫기</button>
				</div>
			</div>
		</div>
		<!-- 디테일 Modal 끝 -->
     
    <%@include file="../include/footer.jsp"%>
   <script type="text/javascript" src="/js/modal.js"></script>
</div>
</body>
</html>