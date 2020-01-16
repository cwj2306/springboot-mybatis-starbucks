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
<title>Starbucks Coffee Korea :: Join </title>
</head>
<body>
<div class="wrap">
     <%@include file="../include/nav.jsp"%>
    <!-- 본문 시작 -->
    <div class="content">
        <p class="join_title">회원가입</p>
        <div class="join_container">
            <img class="join_illust" src="/img/auth/join_illust.png"/>
            <p style="font-size:16px;">회원가입 약관동의 및 본인인증단계입니다.</p>
            <hr/>
            <!-- 홈페이지 이용약관 -->
            <p class="join_manual_title">홈페이지 이용약관 동의 <span>(필수)</span><input id="manual_check_01" class="join_manual_title_checkbox" type="checkbox"></p>
            <div class="join_manual">
	            <b>스타벅스커피 코리아는 고객님을 보호합니다.</b><br/>
	            (주)스타벅스커피 코리아의 서비스의 이용과 관련하여 필요한 사항을 규정합니다.<br/><br/>
	            <b>제1장 총칙</b><br/><br/>
	            <b>1. 목적</b><br/>
	            1. (주)스타벅스커피 코리아(이하 '회사'라고 칭함)에서 운영하는 사이트는 아래와 같은 약관에 동의하는 이용자들에게 제공되는 인터넷서비스로 이용자와 회사의 권리 및 의무를 규정함을 목적으로 합니다.<br/>
	            2. 이용자는 회사가 정한 소정의 등록절차를 걸쳐 '회원 가입' 버튼을 클릭하면 이 약관과 함께 이에 동의하는 것으로 간주합니다.<br/>
	            3. 회사 홈페이지의 모든 자료는 스타벅스 및 자회사, 계열사 혹은 스타벅스에 의해 자격을 취득한 기타 이해 관계자에 의한 저작권, 등록의장, 등록상표 또는 기타 지적소유권으로 보호되고 있습니다.<br/>
	            4. 본 사이트에 포함된 자료는 정보목적으로만 제공됩니다. 귀하는 본 사이트의 내용에 대하여 어떤 방법으로도 배포, 출판, 전송, 변경, 전시, 모방작품의 창조 혹은 개발하지 않을 것에 동의하는 것으로 간주되며, 회사의 권한을 보호하고 옹호함은 물론 본 사이트의 자료를 허가 없이 유용함으로써 발생할 수 있는 어떠한 손해도 입히지 않아야 합니다. 허가 없이 사이트의 내용을 유용하는 경우에는 회사와 Starbucks Corporation에 돌이킬 수 없는 손해를 입힐 수도 있다는 사실을 인지하시기 바랍니다. 이와 같이 인가되지 않은 유용사실에 대하여 회사와 스타벅스는 법적, 재정적으로 가능한 기타 추가적인 배상과 관련한 권한을 가지고 있습니다. 피드백 및 제출자료. 귀하가 제출하는 자료의 내용에 대한 책임은 전적으로 귀하에게 있습니다. 제출자료에 불법, 중상모략, 비난 혹은 비도덕적인 내용이 포함되어서는 안됩니다. 사이트에 저작권, 등록상표권, 사생활권 혹은 기타 사적 권리 혹은 소유권을 포함하는 제삼자의 권리를 침해하는 어떤 자료도 게시하여서는 안됩니다.<br/>
	            5. 이용자의 개인정보 보호 및 보안, 개인정보에 대한 수집, 이용 및 저장과 관련한 관행 및 정책에 대하여는 함께 첨부된 개인정보취급방침에 의합니다.<br/><br/>
	            <b>1. 약관 외 준칙</b><br/>
	           	 이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법 및 기타 관련법령의 규정에 의합니다.<br/>
	            1. 회사는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따릅니다.<br/>
	            2. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래 소비자보호지침 및 관계법령 또는 전자상거래 상 관례에 따릅니다.<br/><br/>
	            <b>2. 책임 제한 기타</b><br/>
	           	 회사는 천재지변 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없거나 회사의 귀책사유가 없는 경우에는 책임을 지지 않습니다. 또한 회사는 서비스 이용과 관련하여 이용자의 고의 또는 과실로 인하여 발생한 손해에 관하여도 책임을 지지 않습니다. 만일 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 회사의 소재지를 관할하는 법원을 관할법원으로 합니다.<br/>
	           	 본 이용약관은 2015년 11월 19일부터 시행합니다.<br/>
            </div>
            <!-- 개인정보 수집 동의 -->
            <p class="join_manual_title">개인정보 수집 및 이용동의 <span>(필수)</span><input id="manual_check_02" class="join_manual_title_checkbox" type="checkbox"></p>
            <div class="join_manual">
          	     본인은 (주)스타벅스커피코리아(이하 ‘회사’라 합니다)가 제공하는 회원 서비스(이하 ‘서비스’라 합니다)를 이용하기 위해, 다음과 같이 ‘회사’가 본인의 개인정보를 수집/이용하고, 개인정보의 취급을 위탁하는 것에 동의합니다.<br/><br/>
               <b><u>※ 귀하께서는 개인정보 수집·이용·취급위탁에 대한 동의를 거부하실 수 있으나, 동의를 거부하실 경우 회원가입, 서비스 이용 등을 하실 수 없습니다.</u></b><br/><br/>
               <b>1. 관계법령에 의한 개인정보 보존기간</b><br/>
               - 서비스이용기록, 접속로그, 접속IP정보 (통신비밀보호법 : 3개월)<br/>
               - 표시/광고에 관한 기록 (전자상거래법 : 6개월)<br/>
               - 계약 또는 청약철회 등에 관한 기록 (전자상거래법 : 5년)<br/>
               - 대금결제 및 재화 등의 공급에 관한 기록 (전자상거래법 : 5년)<br/>
               - 소비자의 불만 또는 분쟁처리에 관한 기록 (전자상거래법 : 3년)<br/><br/>
               <b>2. 서비스 이용과정 및 사업 처리과정에서 수집될 수 있는 개인정보의 범위</b><br/>
           	    서비스 이용기록, 접속 로그, 쿠키, 접속IP정보, 결제기록, 이용정지 기록, e-스티커 적립 기록, 통신사 멤버십 카드 번호, 단말기정보(OS종류, PUSH용 토큰, 디바이스 ID), DI<br/><br/>
               * 쿠키의 경우 구체적인 운영 내역과 설정 거부 방법 등은 본 홈페이지 이용약관 7조에 정하고 있습니다.
            </div>
            <div>
            	<p style="margin-bottom:20px; margin-right:30px; font-size:14px; text-align:right;"><a href="javascript:void(0)" id="next_page" >정보 입력하기 <span style="color:#006633;">&#10145;</span></a></p>
            </div>
        </div>  
    </div>
    <%@include file="../include/footer.jsp"%>
</div>

<script type="text/javascript">
window.onload = function() {
	var next_page = document.getElementById('next_page');
	next_page.onclick = function() {
		if($("#manual_check_01").is(":checked")&&$("#manual_check_02").is(":checked")){
			location.href="http://localhost:8080/user/join2";
		} else {
	   		alert("필수 약관에 모두 동의해주세요");
 			}
		}
	};
</script>
</body>
</html>