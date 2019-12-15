<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/content.css">
<link rel="stylesheet" href="/css/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="../include/nav.jsp"%>

	<h1>공지사항</h1>
		<!-- search{s} -->

		<div >
			<div style="padding-right:10px">
				<input type="hidden" name="searchType" id="searchType" value="search">
				<input type="text" name="keyword" id="keyword" value="${pagination.keyword}">
			</div>
			<div>
				<button onclick="fn_search('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')" name="btnSearch" id="btnSearch">검색</button>
			</div>
		</div>

		<!-- search{e} -->

	<br />
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="board" items="${boards}">
			<tr>
				<td>${board.id}</td>
				<td><a href="/board/${board.id}">${board.title}</a></td>
				<td>${board.createDate}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="/board/write">글쓰기</a>
	<br/>
<!-- 페이지 s-->
	<div id="paginationBox">
		<ul class="pagination">

			<c:if test="${pagination.prev}">
				<li style="display: inline;"><a
					class="page-link" href="#"
					onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
			</c:if>

			<c:forEach begin="${pagination.startPage}"
				end="${pagination.endPage}" var="idx">
				<li style="display: inline;"
					<c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
					<a href="#"
					onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')">
						${idx} </a>
				</li>
			</c:forEach>

			<c:if test="${pagination.next}">
				<li style="display: inline;"><a href="#"
					onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
			</c:if>
		</ul>
	</div>
<!--페이지 e  -->
	<script>
		//이전 버튼 이벤트

		function fn_prev(page, range, rangeSize, searchType, keyword) {

			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;

			var url = "${pageContext.request.contextPath}/board";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&searchType=" + $('#searchType').val();
			url = url + "&keyword=" + $('#keyword').val();

			location.href = url;

		}

		//페이지 번호 클릭

		function fn_pagination(page, range, rangeSize, searchType, keyword) {

			var url = "${pageContext.request.contextPath}/board";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&searchType=" + $('#searchType').val();
			url = url + "&keyword=" + $('#keyword').val();
			
			location.href = url;

		}

		//다음 버튼 이벤트

		function fn_next(page, range, rangeSize, searchType, keyword) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;

			var url = "${pageContext.request.contextPath}/board";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&searchType=" + $('#searchType').val();
			url = url + "&keyword=" + $('#keyword').val();

			location.href = url;
		}
		
		function fn_search(page, range, rangeSize, searchType, keyword) {

			var url = "${pageContext.request.contextPath}/board";
			url = url + "?page=" + 1;
			url = url + "&range=" + 1;
			url = url + "&searchType=" + $('#searchType').val();
			url = url + "&keyword=" + $('#keyword').val();
			
			location.href = url;

		}


	</script>

	<%@include file="../include/footer.jsp"%>
</body>
</html>