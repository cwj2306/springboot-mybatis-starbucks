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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Starbucks Coffee Korea :: drink</title>
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
					<li><a href="#">전체 상품보기</a></li>
				</ul>
				<form class="content_category_list">
					<input type="button" name="content_drink" value="전체 상품보기"
						onClick="allCoffee()"><input type="button"
						name="content_drink" value="콜드 브루 커피" onClick="cold()"><input
						type="button" name="content_drink" value="브루드 커피" onClick="brud()"><input
						type="button" name="content_drink" value="에스프레소" onClick="espr()"><input
						type="button" name="content_drink" value="프라푸치노" onClick="prap()"><input
						type="button" name="content_drink" value="블렌디드" onClick="blend()"><input
						type="button" name="content_drink" value="스타벅스 피지오"
						onClick="fiz()"><input type="button" name="content_drink"
						value="티(티바나)" onClick="tea()"><input type="button"
						name="content_drink" value="키타 제조 음료" onClick="etc()"><input
						type="button" name="content_drink" value="스타벅스 주스(병음료)"
						onClick="botl()">
				</form>
			</div>
			<!-- 음료 메뉴 시작 -->
			<!-- 카테고리 박스 시작 (샘플로 4종류만 출력함) -->
			<div class="coffee_divBox" id="cold_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>콜드 브루 커피</p>
					<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능
						(일부 음료 제외)</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="cold" items="${cold}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<a href="#"><img src="${cold.image}" /></a>
						</div>
						<p class="content_item_name">${cold.name}</p>
						<p class="content_item_price">${cold.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 -->
			<div class="coffee_divBox" id="prap_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>프라푸치노</p>
					<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능
						(일부 음료 제외)</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="prap" items="${prap}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<a href="#"><img src="${prap.image}" /></a>
						</div>
						<p class="content_item_name">${prap.name}</p>
						<p class="content_item_price">${prap.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 -->
			<div class="coffee_divBox" id="brud_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>브루드 커피</p>
					<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능
						(일부 음료 제외)</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="brud" items="${brud}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<a href="#"><img src="${brud.image}" /></a>
						</div>
						<p class="content_item_name">${brud.name}</p>
						<p class="content_item_price">${brud.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 -->
			<div class="coffee_divBox" id="espr_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>에스프레소</p>
					<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능
						(일부 음료 제외)</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="espr" items="${espr}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<a href="#"><img src="${espr.image}" /></a>
						</div>
						<p class="content_item_name">${espr.name}</p>
						<p class="content_item_price">${espr.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 (샘플로 4종류만 출력함) -->
			<div class="coffee_divBox" id="blend_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>블랜디드</p>
					<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능
						(일부 음료 제외)</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="blend" items="${blend}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<a href="#"><img src="${blend.image}" /></a>
						</div>
						<p class="content_item_name">${blend.name}</p>
						<p class="content_item_price">${blend.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 (샘플로 4종류만 출력함) -->
			<div class="coffee_divBox" id="fiz_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>스타벅스 피지오</p>
					<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능
						(일부 음료 제외)</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="fiz" items="${fiz}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<a href="#"><img src="${fiz.image}" /></a>
						</div>
						<p class="content_item_name">${fiz.name}</p>
						<p class="content_item_price">${fiz.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 (샘플로 4종류만 출력함) -->
			<div class="coffee_divBox" id="tea_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>티(티바나)</p>
					<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능
						(일부 음료 제외)</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="tea" items="${tea}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<a href="#"><img src="${tea.image}" /></a>
						</div>
						<p class="content_item_name">${tea.name}</p>
						<p class="content_item_price">${tea.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 (샘플로 4종류만 출력함) -->
			<div class="coffee_divBox" id="etc_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>기타 제조 음료</p>
					<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능
						(일부 음료 제외)</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="etc" items="${etc}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<a href="#"><img src="${etc.image}" /></a>
						</div>
						<p class="content_item_name">${etc.name}</p>
						<p class="content_item_price">${etc.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->
			<!-- 카테고리 박스 시작 (샘플로 4종류만 출력함) -->
			<div class="coffee_divBox" id="botl_jquery">
				<div class="content_item_title">
					<div class="content_item_title_icon"
						style="background-color: #006633;">
						<img src="../img/menu/coffee_cup_icon.png" />
					</div>
					<p>스타벅스 주스(병음료)</p>
					<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능
						(일부 음료 제외)</p>
				</div>
				<!-- 아이템 (for문 돌려서 출력 / 샘플 데이터만 넣음) -->
				<c:forEach var="juice" items="${juice}">
					<div class="content_item_container">
						<div class="content_item_img_container">
							<a href="#"><img src="${juice.image}" /></a>
						</div>
						<p class="content_item_name">${juice.name}</p>
						<p class="content_item_price">${juice.price}원</p>
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>
			<!-- 카테고리 박스 끝 -->

			<!--음료 메뉴 끝-->
		</div>
		<!-- 본문 끝 -->

		<%@include file="../include/footer.jsp"%>
		<script type="text/javascript" src="/js/category.js">
			
		</script>
	</div>
</body>
</html>