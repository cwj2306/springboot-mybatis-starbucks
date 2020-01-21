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
<title>Starbucks Coffee Korea :: Login </title>
</head>
<body>
<div class="wrap">

    <!-- 본문 시작 -->
    <div class="content" style='width:100%';>

        <div class="notice_content">
            <br /><p> ${board.content}</p>
            <br />
        </div>
        
        <div class="notice_list">
            <c:choose>
                <c:when test="${board.id eq 1}">
                        <table>
                            <tr>
                                <td class="notice_list_th">윗글</td>
                                <td><a href="/board/Adetail/${pan[0].id}">${pan[0].title}</a></td>
                            </tr>
                        </table>
                </c:when>
                <c:otherwise>
                    <table>
                        <c:if test="${!empty pan[1].id}">
                            <tr>
                                <td class="notice_list_th">윗글</td>
                                <td><a href="/board/Adetail/${pan[1].id}">${pan[1].title}</a></td>
                            </tr>
                        </c:if>
        
                        <c:if test="${!empty pan[0].id}">
                            <tr>
                                <td class="notice_list_th">아랫글</td>
                                <td><a href="/board/Adetail/${pan[0].id}">${pan[0].title}</a></td>
                            </tr>
                        </c:if>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <!-- 본문 끝 -->
</div>
</body>
</html>