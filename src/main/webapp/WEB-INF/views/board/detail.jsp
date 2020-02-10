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
    <link rel="stylesheet" href="/css/notice.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Starbucks Coffee Korea :: detail </title>
</head>
<body>
<div class="wrap">

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
        <div class="notice_content_title">
            <h2>${board.title}</h2>
        </div>
        <div class="notice_content">
            <br /><p> ${board.content}</p>
            <br />
            <c:if test="${principal.user.username eq 'admin'}">
            </c:if>
        </div>
        <button class="list_button" type="button" onclick="location.href='/board'">목록</button>
        <div class="list_button" style="margin-top:6px; margin-right:10px; background-color:#fff; text-align:center; color:#fff; height:35px;"><a href="/board/update/${board.id}">수정하기</a></div>
        <div class="list_button" style="margin-top:6px; margin-right:10px; background-color:#fff; text-align:center; color:#fff; height:35px;"><a href="/board/delete/${board.id}">삭제하기</a></div>
        
        <div class="notice_list">
            <c:choose>
                <c:when test="${board.id eq 1}">
                        <table>
                            <tr>
                                <td class="notice_list_th" style="width:60px;">윗글</td>
                                <td><a href="/board/detail/${pan[0].id}">${pan[0].title}</a></td>
                            </tr>
                        </table>
                </c:when>
                <c:otherwise>
                    <table>
                        <c:if test="${!empty pan[1].id}">
                            <tr>
                                <td class="notice_list_th" style="width:60px;">윗글</td>
                                <td><a href="/board/detail/${pan[1].id}">${pan[1].title}</a></td>
                            </tr>
                        </c:if>
        
                        <c:if test="${!empty pan[0].id}">
                            <tr>
                                <td class="notice_list_th" style="width:60px;">아랫글</td>
                                <td><a href="/board/detail/${pan[0].id}">${pan[0].title}</a></td>
                            </tr>
                        </c:if>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <!-- 본문 끝 -->
    <!-- footer 시작 (나중에 include로 빼서 넣기) -->
    <footer>
        <%@include file="../include/footer.jsp"%>
    </footer>
    <!-- footer 끝 -->
</div>
</body>
</html>