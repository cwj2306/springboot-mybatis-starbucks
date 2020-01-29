<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <p class="login_whiteBox_p1">Welcome! 카카오 회원가입을 위한 추가정보가 필요합니다.</p>
            <hr/>
            <form action="/kakao/joinProc" method="POST">
           		<input type="hidden" name="username" value="kakao${sessionScope.providerId}"/>
                <input type="text" name="name" placeholder="이름을 입력해 주세요." required="required"/>
                <input type="email" name="email" placeholder="이메일을 입력해 주세요."required="required"/>
                <div style="clear:both;"></div>
                <input style="width:100%;" class="login_submit" type="submit" value="가입완료" />
                <div style="clear:both;"></div>
            </form>
            <p class="login_whiteBox_p2">* 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로, <br/> 정기적인 비밀번호 변경을 해주시길 바랍니다.</p>
            <p class="login_whiteBox_p2">* 스타벅스 커피 코리아의 공식 홈페이지는 Internet Explorer 9.0 이상,<br/> Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다.</p>
        </div>
    </div>
    <%@include file="../include/footer.jsp"%>
</div>
</body>
</html>