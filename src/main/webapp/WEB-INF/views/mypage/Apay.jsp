<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script type="text/javascript">
		var IMP = window.IMP; // 생략가능
		IMP.init("imp70257115"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

		/* 중략 */

		//onclick, onload 등 원하는 이벤트에 호출합니다
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:결제테스트',
			amount : ${point},
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			//각자 url 쓰세요
			m_redirect_url : 'http://ec2-15-164-166-29.ap-northeast-2.compute.amazonaws.com:8080/mypage/Apointup/'+${userId}+'/'+${point},
			app_scheme : 'iamporttest'
		});
		
	</script>
</body>
</html>