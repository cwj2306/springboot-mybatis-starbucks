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
            <p class="join_title">회원가입</p>
            <!-- 회원정보 시작 -->
            <div class="join_container">
                <img class="join_illust" src="../img/auth/join_illust.png"/>
                <p style="font-size:16px;">회원정보를 입력해주세요</p>
                <hr/>
                <form class="join_form" action="/user/joinProc" method="POST"
                onsubmit="return validateCheck()">
                    <input type="text" id ="username"name="username" placeholder="아이디" class="join_input join_input_id" required/>
                    <input type="button" class="id_check" value="중복확인"  onClick="usernameCheck()">
                    <div id="username_input" style="font-size:10px; color:red"></div>
                    <hr/>
                    <input type="password" id = "password" name="password" placeholder="비밀번호" class="join_input" required/>
                    <hr/>
                    <input type="password" id = "passwordCheck" name="passwordCheck" placeholder="비밀번호 확인" class="join_input" required/>
                    <hr/>
                    <p class="join_input_title">이름(필수)</p>
                    <input class="join_input_name" name="name" id="name" type="text" placeholder="이름" required/>
                    <div class="join_input_radio">
                        <div>
                            <input id="gender_man" type="radio" class="radio_button" value="man" checked>
                            <label for="gender_man">남</label>
                        </div>
                        <div>
                            <input id="gender_woman" type="radio" class="radio_button" value="woman">
                            <label for="gender_woman">여</label>
                        </div>
                    </div>
                    <hr/>
                    <p class="join_input_title">생년월일(필수)</p>
                    <tr>
                        <td>
                            <select name="year" id="year" title="년" class="select"></select>    
                            <select name="month" id="month" title="월" class="select"></select>
                            <select name="date" id="date" title="일" class="select"></select>
                        </td>
                    </tr>    
                   <p style="margin-top:10px;">회원가입 완료 후 스타벅스 카드를 등록하시면 생일 무료음료 쿠폰이 발행됩니다.</p>
                    <hr/>
                    <p class="join_input_title">휴대폰(필수)</p>
                    <input type="tel" placeholder="하이픈을 빼고 입력해주세요. ex) 01012345678" class="join_input"id="phone" required/>
                    <hr/>
                    <p class="join_input_title">메일(필수)</p>
                    <input type="email" id="email"name="email" placeholder="E-mail을 입력하세요." class="join_input" required/>
                    <p style="margin-top:15px; "><b>* 선택항목은 입력하지 않거나 동의하지 않아도 회원 가입이 가능합니다.</b></p>
                    <input style="color:#fff;" class="btn_submit" type="submit" value="가입하기" />
                </form>
            </div>
            <!-- 회원정보 끝 -->
        </div>
    </div>
    <!-- footer 시작 (나중에 include로 빼서 넣기) -->
   
    <!-- footer 끝 -->

<script>

// 생년월일 select box 생성
$(document).ready(function() {
    setDateBox();
});

// 생년월일 select box
function setDateBox () {
    // 2020년 기준 1965년~ 2010년 출력
    var dt = new Date();
    var year = "";
    var com_year = dt.getFullYear();
    $("#year").append("<option value=''>년</option>");
    for(var y = (com_year-55); y<= (com_year-10); y++) {
        $("#year").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
    }
    // 1월 ~ 12월 출력
    var month;
    $("#month").append("<option value=''>월</option>");
    for(var i = 1; i <= 12; i++){
        $("#month").append("<option value='"+ i +"'>"+ i + " 월" +"</option>");
    }
    // 1일 ~ 31일 출력
    var date;
    $("#date").append("<option value=''>일</option>");
    for(var i = 1; i <=31; i++) {
        $("#date").append("<option value='"+ i +"'>"+ i + " 일" +"</option>");  
    }
}

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

		//아이디 중복 확인
		function usernameCheck(){
			var username = document.querySelector("#username").value;
			
			fetch("/user/usernameCheck/"+username).then(function(r){
				return r.text();
			}).then(function(r){
				console.log(r);
				var status = r; //ok 중복되지 않음.
				var et = document.querySelector("#username_input");

				if(status === "ok"){
					et.innerHTML = "사용할 수 있는 아이디 입니다.";
				}else{
					et.innerHTML = "이미 존재하는 아이디 입니다. 다른 아이디로 시도해주세요.";
				}
			});
		}

		//validation 체크
		$(function(){
			$('#username').on("keyup",function(){
				$(this).val( $(this).val().replace( /[^0-9a-zA-Z]/gi, '' ) );
				});
			})
			
		$(function(){
			$('#phone').on("keyup",function(){
				$(this).val( $(this).val().replace( /[^0-9]/g, '' ) );
				});
			})
			
		$(function(){
			$('#email').on("keyup",function(){
				$(this).val( $(this).val().replace( /[^0-9a-zA-Z@]/gi, '' ) );
				});
			})
		$(function(){
			$('#name').on("keyup",function(){
				$(this).val( $(this).val().replace( /[^가-힣ㄱ-ㅎ]/gi, '' ) );
				});
			})
</script>

<%@include file="../include/footer.jsp"%>
</body>
</html> 