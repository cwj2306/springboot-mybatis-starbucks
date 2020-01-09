<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../admin/nav.jsp"%>
<link rel="stylesheet" href="../css/content.css">
<link rel="stylesheet" href="../css/jquery.bxslider.css">
<li class="breadcrumb-item active">Blank Page</li>
</ol>

<!-- 본문 시작 -->
<div class="content">
	<h1>커피</h1>
	<div class="content_category">
		<h4>분류 보기</h4>
		<hr>

		<form class="content_category_list">
			<input type="button" name="content_coffee" value="전체 상품보기"
				onClick="allRoast()"><input type="button"
				name="content_coffee" value="블론드 로스트" onClick="blonde()"><input
				type="button" name="content_coffee" value="미디엄 로스트"
				onClick="medium()"> <input type="button"
				name="content_coffee" value="다크 로스트" onClick="dark()">
		</form>
	</div>
	<!-- 블론드 로스트 시작 -->
	<div class="coffee_divBox" id="blonde_jquery">
		<div class="content_item_title">
			<div class="content_item_title_icon"
				style="background-color: #9b704d;">
				<img src="../img/coffee/coffee_bean_icon.png" />
			</div>
			<p>블론드 로스트</p>
		</div>
		<form action="/admin/coffee/delete" method="post">
			<c:forEach var="blonde" items="${blonde}">

				<div class="content_item_container">
					<div class="content_item_img_container">
						<img src="${blonde.image}" />
					</div>
					<p class="content_item_name">${blonde.name}</p>
					<p class="content_item_price">${blonde.price}원</p>
					<input type="checkbox" name="check" value="${blonde.id}">
				</div>
			</c:forEach>
			<button>선택 삭제</button>
		</form>
	</div>
	<div style="clear: both;"></div>
	<!-- 블론드 로스트 끝 -->
	<!-- 미디엄 로스트 시작 -->
	<div class="coffee_divBox" id="medium_jquery">
		<div class="content_item_title">
			<div class="content_item_title_icon"
				style="background-color: #924c2e;">
				<img src="../img/coffee/coffee_bean_icon.png" />
			</div>
			<p>미디엄 로스트</p>
		</div>

		<form action="/admin/coffee/delete" method="post">
			<c:forEach var="medium" items="${medium}">
				<div class="content_item_container">
					<div class="content_item_img_container">
						<img src="${medium.image}" />
					</div>
					<p class="content_item_name">${medium.name}</p>
					<p class="content_item_price">${medium.price}원</p>
					<input type="checkbox" name="check" value="${medium.id}">
				</div>
			</c:forEach>
				<button>선택 삭제</button>
		</form>
	</div>
	<div style="clear: both;"></div>
	<!-- 미디엄 로스트 끝 -->
	<!-- 다크 로스트 시작 -->
	<div class="coffee_divBox" id="dark_jquery">
		<div class="content_item_title">
			<div class="content_item_title_icon"
				style="background-color: #4f2c1d;">
				<img src="../img/coffee/coffee_bean_icon.png" />
			</div>
			<p>다크 로스트</p>
		</div>
		<form action="/admin/coffee/delete" method="post">
			<c:forEach var="dark" items="${dark}">
				<div class="content_item_container">
					<div class="content_item_img_container">
						<img src="${dark.image}" />
					</div>
					<p class="content_item_name">${dark.name}</p>
					<p class="content_item_price">${dark.price}원</p>
					<input type="checkbox" name="check" value="${dark.id}">
				</div>
			</c:forEach>
				<button>선택 삭제</button>
		</form>
	</div>
	<div style="clear: both;"></div>
	<!-- 다크 로스트 끝 -->
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
