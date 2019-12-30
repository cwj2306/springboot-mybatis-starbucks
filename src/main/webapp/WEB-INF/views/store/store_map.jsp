<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/content.css">
<link rel="stylesheet" href="../css/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="../css/store.css">

<title>Starbucks Coffee Korea</title>
</head>
<body>
	<div class="wrap">
		<div id="header_include"></div>

		<%@include file="../include/nav.jsp"%>

		<!-- <div style="position: relative;width:100%; padding-bottom: 40%;">
			<div id="map" style="width:100% ;height:100%;position: absolute;"></div>
		</div>
		 -->
		 
		<div class="map_wrap">
		
		    <div id="map" style="width:100%;height:100%;position:absolute;overflow:hidden;">
		    </div>
		
		    <div id="menu_wrap">
		    	<div class="header">
		    		<div onclick="quick(this)" class="on" >퀵 검색</div>
		    		<div onclick="my(this)">My 매장</div>
		    	</div>
		    	
		        <div class="option">
		        
					<div class="quick_search_input">
						<div class="quick_search_inner">
							<form onsubmit="searchPlacesKeyword(); return false;">
								<input type="text" placeholder="매장명 또는 주소" id="keyword">
							</form>
							<a href="javascript:searchPlacesKeyword();" class="quickSearchBtn">검색</a>
						</div>
					</div>

				</div>
		       
		        <hr>
		       
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		        <%-- <div id="myCafe" style="display:none;">
			        <c:forEach var="myCafe" items="${myCafes}">
		        		${myCafe.name}<br/>
		        	</c:forEach>
		        </div> --%>
		    </div>
		    
		</div>
		

		<%@include file="../include/footer.jsp"%>

		<script type="text/javascript" src="/js/category.js"></script>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33477ab1a165eb7e85ad094b9f9865f8&libraries=services"></script>
		<script type="text/javascript" src="/js/store.js"></script>
		
	</div>
</body>
</html>