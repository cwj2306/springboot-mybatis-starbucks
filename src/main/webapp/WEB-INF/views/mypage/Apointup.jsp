<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div style="position:absolute; top:50%; text-align: center; width: 100%;">
		<div style="margin-bottom: 15px;">
			<c:choose>
				<c:when test="${success eq 'true'}">
					결제가 완료되었습니다.
				</c:when>
				<c:otherwise>
					결제가 취소되었습니다.
				</c:otherwise>
			</c:choose>
		</div>
	
		<div style="display: inline-block;">
			<Button onclick="finish_activity();" 
			style="background-color: #7B6D64; border: 1px solid #7B6D64; color: white;
			width: 100px; height: 30px; font-weight: bolder;">
			확인
			</Button>
		</div>
	</div>
	
</body>

<script>
	function finish_activity(){
		window.Android.finishActivity();	
	}	
</script>

</html>