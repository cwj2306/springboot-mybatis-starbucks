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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Starbucks Coffee Korea :: food</title>
</head>
<body>
	<div class="wrap">
		<div id="header_include"></div>

		<%@include file="../include/nav.jsp"%>

		<!-- 본문 시작 -->
		<div class="content">
			<h1>음료</h1>
			<div class="content_category">
				<h4>분류 보기</h4>
				<hr>
				<ul class="content_category_selectAll">
					<li onClick="allFood()"><a href="#">전체 상품보기</a></li>
					<li onClick="bake()"><a href="#">베이커리</a></li>
					<li onClick="cake()"><a href="#">케이크</a></li>
					<li onClick="sand()"><a href="#">샌드위치</a></li>
					<li onClick="hot()"><a href="#">따뜻한 푸드</a></li>
					<li onClick="fruit()"><a href="#">과일 & 요거트</a></li>
					<li onClick="snack()"><a href="#">스낵 & 디저트</a></li>
					<li onClick="ice()"><a href="#">아이스크림</a></li>
					
				</ul>
			
			</div>
			<!-- 음료 메뉴 시작 -->
			<!-- 카테고리 박스 시작 (샘플로 4종류만 출력함) -->
			<div class="coffee_divBox" id="bake_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>베이커리</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="bake" items="${bake}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<img src="${bake.image}" />
						</div>
						<p class="content_item_name">${bake.name}</p>
						<p class="content_item_price">${bake.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 -->
			<div class="coffee_divBox" id="cake_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>케이크</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="cake" items="${cake}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<img src="${cake.image}" />
						</div>
						<p class="content_item_name">${cake.name}</p>
						<p class="content_item_price">${cake.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 -->
			<div class="coffee_divBox" id="sand_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>샌드위치 & 샐러드</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="sand" items="${sand}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<img src="${sand.image}" />
						</div>
						<p class="content_item_name">${sand.name}</p>
						<p class="content_item_price">${sand.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 -->
			<div class="coffee_divBox" id="hot_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>따뜻한 푸드</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="hot" items="${hot}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<img src="${hot.image}" />
						</div>
						<p class="content_item_name">${hot.name}</p>
						<p class="content_item_price">${hot.price}원</p>
					</div><
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 (샘플로 4종류만 출력함) -->
			<div class="coffee_divBox" id="fruit_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>과일 & 요거트</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="fruit" items="${fruit}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<img src="${fruit.image}" />
						</div>
						<p class="content_item_name">${fruit.name}</p>
						<p class="content_item_price">${fruit.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 (샘플로 4종류만 출력함) -->
			<div class="coffee_divBox" id="snack_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>스낵 & 미니 디저트</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="snack" items="${snack}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<img src="${snack.image}" />
						</div>
						<p class="content_item_name">${snack.name}</p>
						<p class="content_item_price">${snack.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 (샘플로 4종류만 출력함) -->
			<div class="coffee_divBox" id="ice_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>아이스크림</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="ice" items="${ice}">
						<div class="content_item_container">
						<div class="content_item_img_container">
							<img src="${ice.image}" />
						</div>
						<p class="content_item_name">${ice.name}</p>
						<p class="content_item_price">${ice.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!--음료 메뉴 끝-->
		</div>
		<!-- 본문 끝 -->
		
		<%@include file="../include/footer.jsp"%>
		<script type="text/javascript" src="/js/category.js"></script>
	</div>
</body>
</html>