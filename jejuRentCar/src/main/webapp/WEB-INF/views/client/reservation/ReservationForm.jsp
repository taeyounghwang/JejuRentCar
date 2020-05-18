<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 차량예약</title>
<link rel="icon" type="image/png" href="../resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Yeon+Sung&display=swap" rel="stylesheet">
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		//입금하기 버튼 클릭시 
		$("#insertFromBtn").click(function() {

			var Rsv_insu = $("#rsv_insu").val();
			var Rsv_bannad = $("#rsv_bannad").val();

			var m1 = Date.parse(Rsv_insu);
			//alert(m1);
			var m2 = Date.parse(Rsv_bannad);

			var sep = (m2 - m1) / 1000;

			var min = 60;
			var hour = min * 60;
			var day = hour * 24;

			var sd = parseInt(sep / day);

			var car_price = ${reservation.car_price};
			var car_insurance;//일반보험
			var car_adv_insurance;//고급보험
	
			var ins = $("#insurance option:selected").val();

			var hah = (parseInt(car_price) + parseInt(ins)) * parseInt(sd);
			alert("인수일:"+Rsv_insu+"반납일:"+Rsv_bannad+"보험료+총금액:"+hah)
			
			document.getElementById("rsv_price").value = hah;
			
			$("#resinsertFrom").attr({
				"method" : "POST",
				"action" : "/Reservation/ReservationResult"
			});
			if ($("#rsv_name").val() == "") {
				alert("이름을 입력하세요.");
				$("#rsv_name").focus();
				return false;
			}
			if ($("#rsv_cellphone").val().length == "") {
				alert("핸드폰 번호를 입력해주세요!.");
				$("#rsv_cellphone").focus();
				return false;
			}
			if($('#checkBox_01').prop('checked') == false || $('#checkBox_02').prop('checked') == false || $('#checkBox_03').prop('checked') == false){
		    	alert('필수 약관에 모두 동의 하셔야 합니다.');
		    	return false;
			}
		
			if ($("#rsv_insu ").val().length == "") {
				alert("인수일을 선택 해주세요!.");
				$("#rsv_insu").focus();
				return false;
			}
			if ($("#rsv_bannad").val().length == "") {
				alert("반납일을 선택 해주세요!.");
				$("#rsv_bannad").focus();
				return false;
			}

			if (m1 >= m2) {
				alert("반납일을 다시 선택 해주세요!");
				return false;
			}
			$("#resinsertFrom").submit();
		});

	});
	// 2.핸드폰 번호 체크 정규식

	function isCelluar(asValue) {

		alert("숫자,문자,영어,공백은 입력하실수없습니다.");
		var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;

		return regExp.test(asValue);
		

	}
	
	function noSpaceForm(obj) { // 공백사용못하게
		var str_space = /\s/; // 공백체크
		if (str_space.exec(obj.value)) { //공백 체크
			alert("해당 항목에는 공백을 사용할수 없습니다.");
			obj.focus();
			obj.value = obj.value.replace(' ', ''); // 공백제거
			return false;
		}
		
	}
	$(document).ready(function(){ 
		$("#submit").click(function(){
				if($("#rsv_name").val().length==0){ alert("이름을 입력하세요."); $("#Name").focus(); return false; }
				if($("#rsv_cellphone").val().length==0){ alert("휴대폰번호를 입력하세요."); $("#Phone").focus(); return false; }
			});		
		
		
		
		 $("#rsv_bannad").blur(function () {

				var Rsv_insu = $("#rsv_insu").val();
				var Rsv_bannad = $("#rsv_bannad").val();

				var m1 = Date.parse(Rsv_insu);
				//alert(m1);
				var m2 = Date.parse(Rsv_bannad);

				var sep = (m2 - m1) / 1000;

				var min = 60;
				var hour = min * 60;
				var day = hour * 24;

				var sd = parseInt(sep / day);

				var car_price = ${reservation.car_price};
				var car_insurance;//일반보험
				var car_adv_insurance;//고급보험

				var ins = $("#insurance option:selected").val();

				var hah = (parseInt(car_price) + parseInt(ins)) * parseInt(sd);
				
				document.getElementById("price").value = hah;
				
		}); 
	});
	</script>

</head>
<div>
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>
</div>

<style>

.contentss{
	background-color: #FFFFFF;
	width:100%;
}

.wrapper{
	width:1600px;
	height:700px;
	margin-left:150px;
	background-color: #BDBDBD;
	border: 2px solid #000000;
	border-radius: 4px;
}

.selectedinfo{
	width:600px;
	height:600px;
	float: left;
	margin-left:150px;
	margin-top:50px;
	background-color: #F6F6F6;
	border: 2px solid #000000;
	border-radius: 4px;
}

.neededinfo{
	width:600px;
	height:600px;
	display: inline-block;
	margin-left:100px;
	margin-top:50px;
	background-color: #F6F6F6;
	border: 2px solid #000000;
	border-radius: 4px;
}

.agreementBox{
	width:2000px;
	text-align: left;
}

.agreement1{
	width:600px;
	border: 2px solid #AAAAAA;
	border-radius: 4px;
	margin-left:20px;
	display: inline-block;
	text-align: left;
}
.agreement2{
	width:600px;
	border: 2px solid #AAAAAA;
	border-radius: 4px;
	margin-left:20px;
	display: inline-block;
	text-align: left;
}
.agreement3{
	width:600px;
	border: 2px solid #AAAAAA;
	border-radius: 4px;
	margin-left:20px;
	display: inline-block;
	text-align: left;
}

.buttonbar{
	margin-top:50px;
}

</style>

<body>
<div class="contentss">

<% 
	String id = (String)session.getAttribute("id");

	//로그인이 되어있지 않다면,
	if(id==null){
		id="GUEST";
	} else {
		id = (String)session.getAttribute("id");
	}
%>
	<form class="resinsertFrom" id="resinsertFrom">
		<input type="hidden" id="car_name" name="car_name"
			value="${reservation.car_name}"> <input type="hidden"
			id="rsv_price" name="rsv_price"> <input type="hidden"
			name="car_model_number" id="car_model_number"
			value="${reservation.car_model_number}"> 
			<input type="hidden" id="rsv_state" name="rsv_state" value="입금대기"> 
		<br>
		<div align="center"><label style="font-size:60px;">차량 예약</label></div>
		<br>	
		<div class="wrapper">
		
		<div class="selectedinfo" align="center">
		<table>
			<tr>
				<td align="center">
				<br>
				<h1>선택한 차량</h1>
				<br>
				<br>
				<h3>차량명 : ${reservation.car_name}</h3>
				<br>
				<h3>연료 방식 : ${reservation.car_fuel}</h3>
				<br>
				<br>
				</td>
			</tr>
			
			</table>
		
		<div class="well" align="center" style="font-size: 30px;">
			<c:set var="loginid" value="${sessionScope.ClientLogin.mem_name}"></c:set>
			<label>이&nbsp;&nbsp;름 :&nbsp; </label><input type="text" id="mem_name" name="mem_name" value="${sessionScope.ClientLogin.mem_name}" readonly="readonly">
			<br>
			<c:set var="loginid" value="${sessionScope.ClientLogin.mem_cellphone}"></c:set>
			<label>휴대폰 :&nbsp;</label><input type="text" id="mem_cellphone" name="mem_cellphone" value="${sessionScope.ClientLogin.mem_cellphone}" readonly="readonly">
			<br>
			<c:set var="loginid" value="${sessionScope.ClientLogin.mem_id}"></c:set>
			<label>아이디 :&nbsp;</label><input type="text" id="mem_id" name="mem_id" value="${sessionScope.ClientLogin.mem_id}" readonly="readonly">
				<br>
				<br>
			<h2>대여료 : ${reservation.car_price} 원</h2>
				
		</div>
		</div>
		
		<div class="neededinfo" align="center">
			<br>
			<label style="font-size:40px; text-align: center;">추가정보 입력란</label>
		<div class="form-group" align="center" style="margin-top:10px;">
			<label for="text" style="font-size: 30px;">이용자명</label> 
			<input type="text" class="form-control" id="rsv_name" name="rsv_name" maxlength="5" onkeyup="noSpaceForm(this);" 
					onchange="noSpaceForm(this);" onKeyPress="return isCelluar(event)" required="required" placeholder="홍길동"
					style="width:250px; text-align: center;"/>
			<label for="haendeupon" style="font-size: 30px;">연락처</label> 
			<input type="text" class="form-control" id="rsv_cellphone" name="rsv_cellphone"
					onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" required="required" placeholder="01012345678"
					style="width:250px; text-align: center;"/>
		</div>
		
		<div class="well" align="center" style="font-size: 30px; margin-top:30px;">
				<label>인수일: </label><input type='date' id="rsv_insu" name='rsv_insu'  min="2020-05-13" style="size: 30px;"/>
				<br>
				<label>반납일: </label><input type='date' id="rsv_bannad" name='rsv_bannad'  min="2020-05-13" style="size: 30px;"/>
				<br>
				<label>보험료: </label><select id="insurance" style="height: 45px;">
						<option value="${reservation.car_insurance}">일반보험 :${reservation.car_insurance}</option>
						<option value="${reservation.car_adv_insurance}">고급보험: ${reservation.car_adv_insurance}</option>
						</select> 
				<br>
			<label>총금액:</label><input type="text" name="" size="8" value="price" style="border: 0px;" id="price" readonly="readonly">원
			</div>
		</div>
		</div>
	</form>
	<div class="agreementBox">
	<div style="margin-top:30px; margin-left:800px;"><label style="font-size:40px;">예약 규정 및 약관</label></div>
	<div class="agreement1">
		
		<textarea style="width:590px; height:400px;"> 렌터카 
		※ 자차 면책보험은 선택사항입니다. ※ 만 26세이상, 운전경력 1년이상의 조건에 부합하여야 렌터카 대여가
		가능합니다. (업체별 나이제한 상이) ※ 예약 확정 및 비용결제 후 취소할 경우 국내여행 표준약관 이외에 제주렌터카 특별수수료 약관에 의거 취소 수수료가 부과됩니다. ※ 취소 및 환불요청은 고객센터 업무시간 유선으로만 가능합니다.
		업무시간 : 평일 09:00~12:00, 13:00~18:00 (점심시간, 토, 일, 공휴일은 변경 혹은 취소처리 불가)
		※ 한정특가 기획상품은 환불불가 상품입니다. ■ 비수기 기간 (하단 성수기 기간을 제외한 모든 기간) - 사용일
			기준
		3일전 취소 100% 환불 - 사용일 기준 2~1일전 취소 : 전체비용의 50% 부과 - 여행 당일 변경/취소 시
			:
		전액 환불 불가 ■ 성수기 기간 (4/29~5/5, 7/24~8/15, 9/29~10/04,
			10/08~10/11,
		12/24~12/27, 12/30~01/01) - 사용일 기준 8일전 취소 100% 환불 - 사용일 기준
			7~5일전
		취소 : 전체비용의 30% 부과 - 사용일 기준 4~3일전 취소 : 전체비용의 50% 부과 - 사용일 기준
			2~1일전
		취소 : 전체비용의 70% 부과 - 여행 당일 변경/취소 시 : 전액 환불 불가 취소/환불 규정
		</textarea>
		<div align="center"><input type="checkbox"  name="checkBox_01" id="checkBox_01"><label>동의</label></div>
	</div>
	<div class="agreement2">
		<textarea style="width:590px; height:400px;">
		1. 개인정보의 처리 목적 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는
		사용되지 않으며 이용 목적이 변경될 시에는 사전 동의를 구할 예정입니다. 여행상품 예약,
			항공권/숙박/렌터카/입장권 등의
		예약 정보확인, 예약내역의 확인 및 상담, 구매 및 요금결제, 분쟁조정을 위한 기록보존, 불만처리, 민원처리,
		고지사항 전달
		등 2. 수집 항목 당사는 여행상품의 예약과 원할한 여행 관련 서비스 제공, 회원가입 시 서비스 제공과 편리하고
			유익한 맞춤
		정보를 제공하기 위해 필요한 최소한의 정보를 필수 사항으로 수집하고 있으며, 수집한 모든 개인정보는 별도의 동의가
			없는 한
		개인정보의 수집 및 이용목적에서 고지한 다른 목적으로 사용되지 않습니다. 1) 여행상품 예약 및 상담 - 필수
			항목: 성명,
		휴대폰번호, 이메일, 생년월일, 성별 (단, 생년월일과 성별은 항공 상품에 한함) - 선택 항목 : 연락처2 등
			2)
		여행상품 정산(환불)시 카드번호, 유효기간, 이름, 생년월일, 성별, 카드비밀번호 앞2자리, 계약자와의 관계증빙,
			은행명,
		계좌번호 등 3) 기타 - 서비스 이용 과정에서 아래와 같은 정보들이 수집될 수 있습니다. - IP
			Address, 쿠키,
		방문 일시, 서비스 이용 기록 3. 이용 기간 - 보존항목 : 이름, 로그인ID, 휴대전화번호, 이메일,
			생년월일,
		서비스이용기록, 접속로그 - 보존근거 : 전자상거래등에서의 소비자보호에 관한 법률 - 보존기간 : 5년 - 계약
			또는
		청약철회 등에 관한 기록 : 5년(전자상거래등에서의 소비자보호에 관한 법률) - 대금결제 및 재화 등의 공급에
			관한 기록 :
		5년 (전자상거래등에서의 소비자보호에 관한 법률) - 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
			(전자상거래등에서의
		소비자보호에 관한 법률) - 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년 (신용정보의 이용 및 보호에
			관한 법률)
		4. 수집 동의 거부권 및 불이익 내용 고지 개인정보 주체자는 개인정보 수집, 이용에 대해 거부할 권리가
			있습니다. 동의를
		거부할 경우 여행상품 예역서비스 이용이 불가함을 알려드립니다.
		</textarea>
		<div align="center"><input type="checkbox"  name="checkBox_02" id="checkBox_02"><label>동의</label></div>

	</div>
	<div class="agreement3">
		<textarea style="width:590px; height:400px;">
		개인정보의 제3자 제공에 관한 사항 당사는 귀하의 동의가 있거나 관련법령의 규정에 의한 경우를 제외하고는 귀하의 정보를
		제3자에게 제공하지 않습니다. 제공받는 자 제공하는 항목 제공받는자의 이용목적 보유 및 이용기간 인터파크렌트카 성명, 연락처,
		이메일주소, 성별, 생년월일 예약 진행 및 확인 개인정보 이용목적 달성시까지 (단, 관계 법령의 규정에 의해 보존의 필요가
		있는 경우 및 사전 동의를 득한 경우 해당 보유기간까지) - 다만, 아래의 경우에는 예외로 합니다. ※ 이용자들이 사전에
		동의한 경우 ※ 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우 ■
		개인정보처리 위탁에 관한 사항 당사는 고객편의 서비스를 원활하게 제공하기 위해서 일부 업무를 전문업체에 위탁 운영하고
		있습니다. 당사에서 고객의 개인정보를 위탁하는 현황은 다음과 같습니다. 위탁받는 업체(수탁자) 개인정보 이용 목적 개인정보
		제공 항목 보유 및 기간 ㈜올앳 신용카드 결제와 관련된 전자금융거래수단 등의 결제정보 성명,결제금액,카드사,카드번호 등
		이용목적 달성 및 관계법령의 규정에 의해 보존의 필요가 있을 경우 해당 기간까지 한국정보통신(이지페이) 신용카드 결제와 관련된
		전자금융거래수단 등의 결제정보 성명,결제금액,카드사,카드번호 등 이용목적 달성 및 관계법령의 규정에 의해 보존의 필요가 있을
		경우 해당 기간까지 ㈜브이피 신용카드 결제와 관련된 전자금융거래수단 등의 결제정보 성명,결제금액,카드사,카드번호 등 이용목적
		달성 및 관계법령의 규정에 의해 보존의 필요가 있을 경우 해당 기간까지 위탁계약 시 개인정보보호 관련 법규의 준수, 개인정보에
		관한 제3자 제공 금지 및 책임부담 등을 명확히 규정하고, 당해 계약내용을 서면 및 전자 보관하고 있습니다. 업체 변경시
		공지사항 및 개인정보처리방침을 통해 고지하겠습니다. 상기 내용에 대해 동의를 거부하실 수 있으나, 동의 거부 시 서비스를
		이용하실 수 없습니다.
		</textarea>
		<div align="center"><input type="checkbox"  name="checkBox_03" id="checkBox_03"><label>동의</label></div>
		</div>
		</div>
		
	<div class="buttonbar" align="center">
		<% if(id != "GUEST") { %>
		<input type="button" class="btn btn-primary active insertFromBtn"
			id="insertFromBtn" value="예약신청"><a href="/main"> <input type="button"
			class="btn btn-primary active" id="databtn" value="취소"></a>
		<% } %>
			<% if(id == "GUEST"){ %>
			<a href="login/form"><input type="button" class="btn btn-primary active"
			id="insertFromBtn" value="예약신청"></a> 
			<%} %>
			<br>
			<br>
	</div>

</div>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>