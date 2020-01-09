<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../admin/nav.jsp"%>
<link rel="stylesheet" href="../css/content.css">
<link rel="stylesheet" href="../css/jquery.bxslider.css">
<li class="breadcrumb-item active">Blank Page</li>
</ol>

<!-- 본문 시작 -->
<div class="content">
	<h1>음료</h1>
	<div class="content_category">
		<h4>분류 보기</h4>
		<hr>
		<form class="content_category_list">
			<input type="button" name="content_drink" value="전체 상품보기"
				onClick="allCoffee()"><input type="button"
				name="content_drink" value="콜드 브루 커피" onClick="cold()"><input
				type="button" name="content_drink" value="브루드 커피" onClick="brud()"><input
				type="button" name="content_drink" value="에스프레소" onClick="espr()"><input
				type="button" name="content_drink" value="프라푸치노" onClick="prap()"><input
				type="button" name="content_drink" value="블렌디드" onClick="blend()"><input
				type="button" name="content_drink" value="스타벅스 피지오" onClick="fiz()"><input
				type="button" name="content_drink" value="티(티바나)" onClick="tea()"><input
				type="button" name="content_drink" value="키타 제조 음료" onClick="etc()"><input
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
			<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능 (일부
				음료 제외)</p> 			
		</div>
		
			<form action="/admin/bev/delete" method="post">
			<c:forEach var="cold" items="${cold}">
				<div class="content_item_container">
					<div class="content_item_img_container">
						<img src="${cold.image}" />
					</div>
					<p class="content_item_name">${cold.name}</p>
					<p class="content_item_price">${cold.price}원</p>
					<input type="checkbox" name="check" value="${cold.id}">
				</div>
			</c:forEach>
			<button>선택삭제</button>
	
		</form>
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
			<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능 (일부
				음료 제외)</p>
		</div>
		<form action="/admin/bev/delete" method="post">
			<c:forEach var="prap" items="${prap}">
				<div class="content_item_container">
					<div class="content_item_img_container">
						<img src="${prap.image}" />
					</div>
					<p class="content_item_name">${prap.name}</p>
					<p class="content_item_price">${prap.price}원</p>
					<input type="checkbox" name="check" value="${prap.id}">
				</div>
			</c:forEach>
			<button>선택삭제</button>
		</form>
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
			<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능 (일부
				음료 제외)</p>
		</div>
		<form action="/admin/bev/delete" method="post">
			<c:forEach var="brud" items="${brud}">
				<div class="content_item_container">
					<div class="content_item_img_container">
						<img src="${brud.image}" />
					</div>
					<p class="content_item_name">${brud.name}</p>
					<p class="content_item_price">${brud.price}원</p>
					<input type="checkbox" name="check" value="${brud.id}">
				</div>
			</c:forEach>
			<button>선택삭제</button>
		</form>
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
			<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능 (일부
				음료 제외)</p>
		</div>
		<form action="/admin/bev/delete" method="post">
			<c:forEach var="espr" items="${espr}">
				<div class="content_item_container">
					<div class="content_item_img_container">
						<img src="${espr.image}" />
					</div>
					<p class="content_item_name">${espr.name}</p>
					<p class="content_item_price">${espr.price}원</p>
					<input type="checkbox" name="check" value="${espr.id}">
				</div>
			</c:forEach>
			<button>선택삭제</button>
		</form>
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
			<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능 (일부
				음료 제외)</p>
		</div>
		<form action="/admin/bev/delete" method="post">
			<c:forEach var="blend" items="${blend}">
				<div class="content_item_container">
					<div class="content_item_img_container">
						<img src="${blend.image}" />
					</div>
					<p class="content_item_name">${blend.name}</p>
					<p class="content_item_price">${blend.price}원</p>
					<input type="checkbox" name="check" value="${blend.id}">
				</div>
			</c:forEach>
			<button>선택삭제</button>
		</form>
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
			<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능 (일부
				음료 제외)</p>
		</div>
		<form action="/admin/bev/delete" method="post">
			<c:forEach var="fiz" items="${fiz}">
				<div class="content_item_container">
					<div class="content_item_img_container">
						<img src="${fiz.image}" />
					</div>
					<p class="content_item_name">${fiz.name}</p>
					<p class="content_item_price">${fiz.price}원</p>
					<input type="checkbox" name="check" value="${fiz.id}">
				</div>
			</c:forEach>
			<button>선택삭제</button>
		</form>
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
			<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능 (일부
				음료 제외)</p>
		</div>
		<form action="/admin/bev/delete" method="post">
			<c:forEach var="tea" items="${tea}">
				<div class="content_item_container">
					<div class="content_item_img_container">
						<img src="${tea.image}" />
					</div>
					<p class="content_item_name">${tea.name}</p>
					<p class="content_item_price">${tea.price}원</p>
					<input type="checkbox" name="check" value="${tea.id}">
				</div>
			</c:forEach>
			<button>선택삭제</button>
		</form>
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
			<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능 (일부
				음료 제외)</p>
		</div>
		<form action="/admin/bev/delete" method="post">
			<c:forEach var="etc" items="${etc}">
				<div class="content_item_container">
					<div class="content_item_img_container">
						<img src="${etc.image}" />
					</div>
					<p class="content_item_name">${etc.name}</p>
					<p class="content_item_price">${etc.price}원</p>
					<input type="checkbox" name="check" value="${etc.id}">
				</div>
			</c:forEach>
			<button>선택삭제</button>
		</form>
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
			<p class="drink_item_p">&nbsp;&nbsp;&nbsp;디카페인 에스프레소 샷 추가 가능 (일부
				음료 제외)</p>
		</div>
		<form action="/admin/bev/delete" method="post">
			<c:forEach var="juice" items="${juice}">
				<div class="content_item_container">
					<div class="content_item_img_container">
						<img src="${juice.image}" />
					</div>
					<p class="content_item_name">${juice.name}</p>
					<p class="content_item_price">${juice.price}원</p>
					<input type="checkbox" name="check" value="${juice.id}">
				</div>
			</c:forEach>
			<button>선택삭제</button>
		</form>
	</div>
	<div style="clear: both;"></div>
	<!-- 카테고리 박스 끝 -->

	<!--음료 메뉴 끝-->
</div>

</div>
<!-- /.container-fluid -->



</div>
<!-- /.content-wrapper -->

</div>
<!-- /#wrapper -->
<%@include file="../admin/footer.jsp"%>
<script type="text/javascript" src="/js/category.js"></script>
<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../js/sb-admin.min.js"></script>

</body>

</html>
