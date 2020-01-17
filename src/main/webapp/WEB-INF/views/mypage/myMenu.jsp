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
<link rel="stylesheet" href="../css/myStarbucks.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Starbucks Coffee Korea :: My Starbucks</title>
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
					<p>></p>
					<a href="#">My Starbucks</a>
				</div>
			</div>
			<!-- 상단 제목영역 끝 -->
			<div class="content">
				<!-- 좌측 화면 시작 -->
				<div class="my_sb_content my_sb_content_page">
					<div class="my_sb_menu_radio">
						<div>
							<input id="my_drink" type="radio" class="radio_button"
								name="my_sb_menu_check" checked> <label for="my_drink">나만의
								커피</label>
						</div>
						<div>
							<input id="my_food" type="radio" class="radio_button"
								name="my_sb_menu_check"> <label for="my_food">나만의
								음료</label>
						</div>
						<div>
							<input id="my_product" type="radio" class="radio_button"
								name="my_sb_menu_check"> <label for="my_product">나만의
								푸드</label>
						</div>
					</div>
					<!-- 나만의 커피 div 시작 -->

					<div class="my_sb_drink_div">
						<form method="post">
							<table class="my_sb_menu_table">
								<tr>
									<td><input type="checkbox" id="coffee_check_all" /></td>
									<td>커피명</td>
									<td>등록일</td>
									<td>수량</td>
								</tr>

								<c:forEach var="coffee" items="${coffeeList}">
									<tr>
										<td><input type="checkbox" class="coffee_checkbox"
											name="check" value="${coffee.id}"></td>
										<td>${coffee.coffeeName}</td>
										<td>${coffee.createDate}</td>
									 	<td><input id="amount${coffee.id}"></td> 
									</tr>
								</c:forEach>

							</table>
							<div class="delete_button_div">
								<button class="delete_button" formaction="/mypage/deleteCoffee"
									style="float: left; margin-right: 5px;">선택삭제</button>
							</div>
							<div class="delete_button_div">
								<button class="buy_button" formaction="/mypage/buyCoffee">선택구매</button>
							</div>
						</form>
					</div>
					<!-- 나만의 커피 div 끝 -->
					<!-- 나만의 음료 div 시작 -->
					<div style="display: none;" class="my_sb_food_div">
						<form method="post">
							<table class="my_sb_menu_table">
								<tr>
									<td><input type="checkbox" id="drink_check_all" /></td>
									<td>음료명</td>
									<td>등록일</td>
								</tr>

								<c:forEach var="bev" items="${bevList}">
									<tr>
										<td><input type="checkbox" class="drink_checkbox"
											name="check" value="${bev.id}"></td>
										<td>${bev.beverageName}</td>
										<td>${bev.createDate}</td>
									</tr>
								</c:forEach>
							</table>
							<div class="delete_button_div">
								<button class="delete_button" formaction="/mypage/deleteBev"
									style="float: left; margin-right: 5px;">선택삭제</button>
							</div>
							<div class="delete_button_div">
								<button class="buy_button" formaction="/mypage/buyBev">선택구매</button>
							</div>
						</form>
					</div>
					<!-- 나만의 음료 div 끝 -->
					<!-- 나만의 푸드 div 시작 -->

					<div style="display: none;" class="my_sb_product_div">
						<table class="my_sb_menu_table">
							<tr>
								<td><input type="checkbox" id="food_check_all" /></td>
								<td>No</td>
								<td>상품명</td>
								<td>그라인드 옵션</td>
								<td>등록일</td>
							</tr>
							<!-- 내용 있는만큼 출력 시작 -->
							<tr>
								<td><input type="checkbox" class="food_checkbox" /></td>
								<td>No</td>
								<td>상품명</td>
								<td>그라인드 옵션</td>
								<td>등록일</td>
							</tr>
							<tr>
								<td><input type="checkbox" class="food_checkbox" /></td>
								<td>No</td>
								<td>상품명</td>
								<td>그라인드 옵션</td>
								<td>등록일</td>
							</tr>
							<!-- 내용 있는만큼 출력 끝 -->
						</table>

					</div>
					<!-- 나만의 푸드 div 끝 -->
				</div>
				<!-- 좌측 화면 끝 -->
				<!-- 우측 메뉴바 시작 -->
				<%@include file="../include/menu.jsp"%>
				<!-- 우측 메뉴바 끝 -->
			</div>
			<div style="clear: both;"></div>
		</div>
		<!-- footer 시작 (나중에 include로 빼서 넣기) -->
		<%@include file="../include/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
	<script>
		// 토글 버튼
		$(function() {
			$("#my_drink").click(function() {
				$(".my_sb_drink_div").show();
				$(".my_sb_food_div").hide();
				$(".my_sb_product_div").hide();
			});
		});
		$(function() {
			$("#my_food").click(function() {
				$(".my_sb_food_div").show();
				$(".my_sb_drink_div").hide();
				$(".my_sb_product_div").hide();
			});
		});
		$(function() {
			$("#my_product").click(function() {
				$(".my_sb_product_div").show();
				$(".my_sb_drink_div").hide();
				$(".my_sb_food_div").hide();
			});
		});

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

		// 체크박스 전체 선택 & 삭제
		$(document).ready(function() {
			$('#drink_check_all').click(function() {
				if ($("#drink_check_all").prop("checked")) {
					$(".drink_checkbox").prop("checked", true);
				} else {
					$(".drink_checkbox").prop("checked", false);
				}
			});

			$('#food_check_all').click(function() {
				if ($("#food_check_all").prop("checked")) {
					$(".food_checkbox").prop("checked", true);
				} else {
					$(".food_checkbox").prop("checked", false);
				}
			});

			$('#coffee_check_all').click(function() {
				if ($("#coffee_check_all").prop("checked")) {
					$(".coffee_checkbox").prop("checked", true);
				} else {
					$(".coffee_checkbox").prop("checked", false);
				}
			});

			// 체크박스 선택 삭제
			$('.delete_button').click(function() {
				if (confirm("삭제하시겠습니까?")) {
					// 삭제 action
				} else {
					return false;
				}
			});
			$('.buy_button').click(function() {
				if (confirm("구매하시겠습니까?")) {
					// 구매 action
				} else {
					return false;
				}
			});

			
			//수량구매를 위해 필요함				
			$(".coffee_checkbox").change(function(){
				var ident=$(this).attr("value");
					
				if($(this).is(":checked")){
					$("#amount"+ident).attr("name","amount");
				}else{
					$("#amount"+ident).removeAttr("name");
				}
			});  


		}); 
	</script>
</body>
</html>