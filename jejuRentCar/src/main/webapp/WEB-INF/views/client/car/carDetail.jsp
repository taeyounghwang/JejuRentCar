<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 차량상세</title>
<link rel="icon" type="image/png" href="resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<div>
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>
</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<% 
	String id = (String)session.getAttribute("id");

	//로그인이 되어있지 않다면,
	if(id==null){
		id="GUEST";
	} else {
		id = (String)session.getAttribute("id");
	}
%>

<script type="text/javascript">

	$(function() {
		// 첨부파일 이미지 보여주기 위한 속성 추가
		/* 		var file = "<c:out value = '${vo.car_image}'/>";
		 if(file != ""){ */
		$("#fileImage").attr({
			src : "/uploadStorage/carList/${detail.car_image}",
			width : "450px",
			height : "200px"
		});
		 
		/*제목 클리시 상세 페이지로 이동을 위한 처리 이벤트*/
		$(".goReservationForm").click(function() {

			var CAR_MODEL_NUMBER = $("#CAR_MODEL_NUMBER").val();
			$("#CAR_MODEL_NUMBER").val(CAR_MODEL_NUMBER);
			console.log("차량명 :" + CAR_MODEL_NUMBER);
			//예약 페이지 로 이동하기 위해 form 추가 (id:ReservationForm);
			$("#ReservationForm").attr({
				"method" : "POST",
				"action" : "/Reservation/form"
			});
			$("#ReservationForm").submit();
		});
		
	});
</script>

<style>
.contentss{
	background-color: #FFFFFF;
}
.wrapper{
	width:1500px;
	height:700px;
	background-color: #EAEAEA;
	align:center;
	margin-left: 200px;
	
	border: 2px solid #000000;
	border-radius: 4px;
}
.myCarimage{
	border: 2px solid #000000;
	border-radius: 4px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	float:left;
	width: 600px;
	height: 450px;
	margin-left: 100px;
	margin-top: 90px;
	
}

.fullinfo{
	/* border: 2px solid #000000;
	border-radius: 4px;
	margin: 8px 0;
	outline: none;
	padding: 8px; */
	display: inline-block;
	margin-left: 150px;
	height: 600px;
	margin-top: 50px;
	float:left;
}

.detailinfo{
	margin-top: 50px;
}

.carinfo{
	margin-top: 0px;
}

.imager{
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 570px;
	height: 300px;
	margin-top:60px;
}
</style>

<body>
<div class="contentss">
<br>
<div align="center"><label style="font-size:70px;">차량 예약 </label></div>
<div class="wrapper" align="center">
<form name="ReservationForm" id="ReservationForm">
		<input type="hidden" id="car_model_number" name="car_model_number"
			value="${detail.car_model_number}">
	</form>

 
				<div class="myCarimage" style="background-color: #FFFFFF;">
					<img src="/uploadStorage/carList/${detail.car_image}" class="imager" id="fileImage">
				</div>
				
				<div class="fullinfo">
				<div class="carinfo " data-value="${detail.car_model_number}">
					<div style="display: none;">${detail.car_model_number}</div>
					<div style="font-size: 30px;">
					<label>차량 : ${detail.car_name}</label><br>
					<label>대여료 : ${detail.car_price}</label><br>
					<label>연료 방식 : ${detail.car_fuel}</label><br>
					<label>기어 방식 : ${detail.car_stick}</label><br>
					<label>차량 옵션 : ${detail.car_option}</label>
					</div>
				</div>
				<hr>
				<div class="detailinfo" style="margin-top:0px;">
					<p>
						● 6.취소/환불 안내 [성수기 기간]<br> -사용일 기준 8일전 취소 100% 환불<br>
						-사용일 기준 7~5일전 취소 전체비용의 30% 부과 <br>-사용일 기준 4~3일전 취소 전체비용의 50%
						부과 <br>-사용일 기준 2~1일전 취소 전체비용의 70% 부과 <br>-여행 24시간 전~당일
						취소 전체비용 환불 불가 <br>
						[비수기 기간](성수기를 제외한 모든 기간) <br>-사용일 기준 3일전 취소 :
						100% 환불 <br>-사용일 기준 2~1일전 취소 전체비용의 50% 부과 <br>-여행 24시간
						전~당일 취소 전체비용 환불 불가
					</p>

				<div class="well">
					<% if(id != "GUEST") { %>
					<button type="button" class="btn btn-info goReservationForm"
						style="width: 230pt; height: 50pt;">
						<h3>예약하기</h3>
					<% } %>	
					</button>
					<% if(id == "GUEST"){ %>
					<a href="/login/form"><input type="button" value="예약하기" id="deleteBtn" class="btn btn-info" style="width: 230pt; height: 50pt;"></a>
					<% } %>
				</div>
				</div>
				</div>
				</div>
		<hr>
<div class="maininfo" align="center">
	<div class="well">
		<p>
			● 1.기본정보<br> A.기어 방식 : 오토  B.연료 : 휘발류, 전기  C.최대 승차 인원 : 5 ~
			12인 <br> D.차량 옵션 : 네비게이션, 후방카메라, 블랙박스, 운전석에어백, 조수석에어백, 후방센서,
			리모컨키, 스마트키, 열선시트, 썬루프
		</p>
	</div>
	<div class="well">
		<p>
			● 2.예약절차 <br>A.차량 조회 <br>B.예약 및 결제<br> C.예약 내역 및 이용 안내
			이메일 발송 <br>D.운전면허 지참 후 차량 인수/반납
		</p>
	</div>
	<div class="well">
		<p>
			● 3.대여자격 <br> A.도로교통법상 유효한 운전면허증 [국제 운전면허증 포함] 소지 <br>B.만
			26세 이상, 운전 경력 1년 이상 <br>C.실운전자 포함 제 2운전자까지 현장 등록 가능 <br>D.외국인
			대여시 국제운전 면허증, 여권, 자국면허증
		</p>
	</div>
	<div class="well">
		<p>
			● 4.이용안내 [포함 사항] -차량대여로, 종합보험(대인,대물,자손 보험) [불포함 사항] -유류비, 공항주차요금 -자차
			보험료(일반,고급)는 <br>차량 인수시 선택사항 -임차인의 귀책사유로 사고 발생시 수리비 및 휴차 보상료 임차인
			부담.(자차 미가입시) -전기차의 경우 충전료 발생할 수 있습니다.(현장직불)
		</p>
	</div>
	<div class="well">
		<p>
			● [차량 인수/반납 시간] -08:00 ~ 20:00(인수/반납시간 외 이용 요청 시 야간배차료 현장지불 또는 고급자차보험
			가입 필수)<br> [인수/반납 장소] -제주 공항 렌트카 차고지(공항에서 도보 15분) [인수/반납 방법] -상기
			인수지를 제외한 장소에서 인수/반납 불가 -연료는 렌터카 수시 체크된 양 만큼 반납, 미달시 현장에서 비용지불
		</p>
	</div>
	<div class="well">
		<p>
			● 5.보험안내 <br> 모든 차량은 종합보험(대인,대물,자손) 가입되어 있습니다.(대인:피해차량 탑승자(동승인
			포함), 대물:피해차량, 자손:가해차량 운전자) <br>-차량 손해(자차)보험은 이용자의 선택사항으로, 미가입
			상태에서 사고가 발생할 경우 모든 수리비용 및 휴차 보상료는 임차인 부담입니다 <br>-보험 보상과 관련하여 임대차
			계약서 뒷면 약관에 기재된 내용 반드시 숙지 부탁드립니다. <br>-자차 가입하여도 소모품(타이어, 체인,
			실내부품, 견인, 출동서비스 등)등의 파손, 출장서비스, 침수, 우도 내 사고 제외됩니다. <br>-차량 사고 시
			자차보험은 1회에 한해서만 처리됩니다. <br>-보험가입 시 나이제한 있을 수 있습니다. (업체별상이) <br>-업체별
			보험 보장내역 상이하오니, 자세한 문의는 유선상담 부탁드립니다.
		</p>
	</div>
	<div class="well">
		<p>
			● [교통 법규] <br>-차량 운전자는 교통법규를 준수해야 하며, 제반사항 은 임차인 책임 <br>-사고의
			경우, 도로교통법 위반시, 보험보상의 일부 혜택을 받지 못할 수 있음 [계약 연장] <br>-계약기간 연장은 불가
			하오니 다시 예약 해 주시기 바랍니다. <br>-사전 동의없이 연장 사용중 발생한 보험 및 차량손해에 대해,
			보상이나 면책을 받지 못할 수 있음 [보험처리 및 차량손해(자차) 면책 처리 불가 사례] <br>-임차인의 고의로
			인한 사고 <br>-무면허 운전사고 <br>-범죄를 목적으로 렌트카를 사용하던 중 발생한 사고 <br>-음주운전,
			약물중독 운전사고 <br>-렌트카를 경기용이나 연습용, 테스트용으로 사용하던 중 발생한 사고 <br>-임차인(임차인과
			기록된 공동임차인 포함) 이외의 제 3자가 렌트카를 사용하여 발생한 사고 <br>-본인 부주의로 인한 차량 도난사고
		</p>
	</div>
	<div class="well">
		<p>
			● 6.취소/환불 안내 [성수기 기간]<br> -사용일 기준 8일전 취소 100% 환불<br> -사용일
			기준 7~5일전 취소 전체비용의 30% 부과 <br>-사용일 기준 4~3일전 취소 전체비용의 50% 부과 <br>-사용일
			기준 2~1일전 취소 전체비용의 70% 부과 <br>-여행 24시간 전~당일 취소 전체비용 환불 불가 [비수기
			기간](성수기를 제외한 모든 기간) <br>-사용일 기준 3일전 취소 : 100% 환불 <br>-사용일
			기준 2~1일전 취소 전체비용의 50% 부과 <br>-여행 24시간 전~당일 취소 전체비용 환불 불가
		</p>
		<br>
	</div>
	</div>

</div>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>