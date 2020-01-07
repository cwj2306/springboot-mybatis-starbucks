<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/content.css">
    <link rel="stylesheet" href="../css/jquery.bxslider.css">
    <link rel="stylesheet" href="../css/auth.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>Starbucks Coffee Korea :: Login </title>
</head>
<body>
<div class="wrap">
     <%@include file="../include/nav.jsp"%>
    <!-- 본문 시작 -->
    <div class="login_container">
        <p class="login_title">로그인<p>
        <div class="login_whiteBox">
            <p class="login_whiteBox_p1">Welcome! 스타벅스커피 코리아에 오신 것을 환영합니다.</p>
            <hr/>
            <form action="/user/loginProc" method="POST">
            
            <c:choose>
            	<c:when test="${empty cookie.username.value}">
            	<input type="text" name="username" placeholder="아이디를 입력해 주세요." required="required"/>
            	</c:when>
            	<c:otherwise>
            	<input type="text" name="username" placeholder="아이디를 입력해 주세요." value="${cookie.username.value}" required="required"/>
            	</c:otherwise>
            </c:choose>
                <input type="password" name="password" placeholder="비밀번호를 입력해 주세요." required="required"/>
            <c:choose>
            	<c:when test="${empty cookie.username.value}">
            	 <label><input class="login_saveId" type="checkbox" id="" name="rememberMe">아이디 저장</label>
            	</c:when>
            	<c:otherwise>
            	 <label><input class="login_saveId" type="checkbox" checked="checked" id="" name="rememberMe">아이디 저장</label>
            	</c:otherwise>
            </c:choose>                
               
                <div style="clear:both;"></div>
                <input class="login_submit" type="submit" value="로그인" />
                <a id="custom-login-btn" href="/kakao/login">
                    <img src="http://mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="50%;" style="float:right;"/>
                </a>
                  <a id="custom-login-btn" href="/naver/login">
                 	<img src="http://static.nid.naver.com/oauth/small_g_in.PNG" width="50%;" style="float:right;">
                 </a>
                <div style="clear:both;"></div>
            </form>
            <p class="login_whiteBox_p2">* 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로, <br/> 정기적인 비밀번호 변경을 해주시길 바랍니다.</p>
            <p class="login_whiteBox_p2">* 스타벅스 커피 코리아의 공식 홈페이지는 Internet Explorer 9.0 이상,<br/> Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다.</p>
            <ul>
                <li><a href="/user/join1">회원가입</a></li>
                <li>｜</li>
                <li><a href="#">아이디 찾기</a></li>
                <li>｜</li>
                <li><a href="#">비밀번호 찾기</a></li>
            </ul>
        </div>
    </div>
    <%@include file="../include/footer.jsp"%>
</div>
<!-- <script type='text/javascript'>
    Kakao.init('fccb70f4824a4fe153ce5b2567712201');
    function loginWithKakao() {
      Kakao.Auth.login({
        success: function(authObj) {
          alert(JSON.stringify(authObj));
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
</script> -->
</body>
</html>