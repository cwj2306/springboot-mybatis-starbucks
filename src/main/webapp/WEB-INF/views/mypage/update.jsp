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
    <link rel="stylesheet" href="/css/jquery.bxslider.css">
    <link rel="stylesheet" href="/css/auth.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Starbucks Coffee Korea :: Join </title>
</head>
<body>
    <div class="wrap">
        <!-- header 시작 (나중에 include로 빼서 넣기) -->
        <%@include file="../include/nav.jsp"%>
        <!-- header 끝 -->
        <!-- 본문 시작 -->
        <div class="content">
            <p class="join_title">회원정보 변경</p>
            <!-- 회원정보 시작 -->
            <div class="join_container">
                <img class="join_illust" src="../img/auth/join_illust.png"/>
                <p style="font-size:16px;">변경할 정보를 입력해주세요</p>
                <hr/>
                <form class="join_form" action="/user/updateProc" method="POST"
                onsubmit="return validateCheck()">
                    <input type="text" id ="name" name="name" placeholder="닉네임" value="${principal.user.name}" class="join_input" required/>
                    <hr/>
                    <input type="password" id = "password" name="password" placeholder="비밀번호" class="join_input" required/>
                    <hr/>
                    <input type="password" id = "passwordCheck" name="passwordCheck" placeholder="비밀번호 확인" class="join_input" required/>
                    <hr/>
                    <input class="btn_submit" type="submit" value="변경하기" />
                </form>
            </div>
            <!-- 회원정보 끝 -->
        </div>
    </div>
    <!-- footer 시작 (나중에 include로 빼서 넣기) -->
   
    <!-- footer 끝 -->

<script>


function validateCheck() {
			var password = document.querySelector('#password').value;
			var passwordCheck = document.querySelector('#passwordCheck').value;

			if (password === passwordCheck &&password!="") {
				return true;
			} else {
				alert('비밀번호가 동일하지 않습니다. 다시 입력해주세요.');
				return false;
			}
		}

</script>

<%@include file="../include/footer.jsp"%>
</body>
</html> 