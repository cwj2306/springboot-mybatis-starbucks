<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/content.css">
    <link rel="stylesheet" href="/css/myStarbucks.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Starbucks Coffee Korea :: Login </title>
</head>
<body>
<div class="wrap">
    <div id="header_include"></div>
    <!-- header 시작 (나중에 include로 빼서 넣기) -->
    <header>
        <%@include file="../include/nav.jsp"%>
    </header>
    <!-- header 끝 -->
    <!-- 본문 시작 -->
    <div class="content">
        <div class="notice_title">
            <h1>공지사항</h1>
            <ul class="notice_nav">
                <li><a href="#">WHAT'S NEW</a></li>
                <li>&ensp;>&ensp;</li>
                <li><a href="#">HOME</a></li>
            </ul>
        </div>
        <div class="notice_gray_box">
            <form class="notice_search">
                <input type="search" placeholder="검색어를 입력해 주세요."/>
                <input type="submit" value="검색" />
            </form>
        </div>
        <div class="notice_table_div">
            <table class="notice_table">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>날짜</th>
                </tr>
                <c:forEach var="board" items="${boards}">
                    <tr>
                        <td>${board.id}</td>
                        <td><a href="/board/detail/${board.id}">${board.title}</a></td>
                        <td>${board.createDate}</td>
                    </tr>
                </c:forEach>
                <!-- 여기까지는 내용 있는 만큼 출력해야함-->
            </table>
        </div>
        <!-- 페이징 시작 -->
        <div id="paginationBox">
            <ul class="paging">
    
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
        <!-- 페이징 끝 -->
    </div>
    <!-- 본문 끝 -->
    <!-- footer 시작 (나중에 include로 빼서 넣기) -->
    <footer>
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
    </footer>
    <!-- footer 끝 -->
</div>
</body>
</html>