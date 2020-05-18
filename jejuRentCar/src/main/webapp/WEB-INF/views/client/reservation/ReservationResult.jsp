<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 예약완료</title>
<link rel="icon" type="image/png" href="../resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Yeon+Sung&display=swap" rel="stylesheet">
</head>
<div>
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>
</div>

<script type="text/javascript">
   $(function () {
		$('#mypage').click(function(){
			 location.href="/mypage/list"
			
		});	
		$('#main').click(function(){
			 location.href="/main"
			
		});	
});

   </script>

<style>

.contentss{
	background-color: #FFFFFF;
}

</style>

<body>
<div class="contentss">

<div align="center">
	<div class="well" style="">
	<br><label style="font-size: 70px;">"이용해주셔서 감사합니다, 예약이 완료되었습니다."</label>
	</div>
	<div style="border: 2px solid #000000; border-radius: 4px; width: 900px;">
			<br>
			<label style="font-size: 40px;">대여 차량 : ${reservation.car_name}</label><br>
			<label style="font-size: 40px;">인수일 : ${reservation.rsv_insu}</label><br>
			<label style="font-size: 40px;">반납일 : ${reservation.rsv_bannad}</label><br>
			<p style="color:#FF0000">※입금이 완료되면 예약이 완료 됩니다.</p>
	</div>
	<br>
	<div class="well" style="border: 2px solid #000000; border-radius: 4px; width: 900px;">
		<label style="font-size: 40px;">입금하셔야 할 금액 : ${reservation.rsv_price}</label><br>
		<label style="font-size: 40px;">계좌번호: 0123 – 456789 – 910 – 4321</label><br>
		<label style="font-size: 40px;">은행 : 미래 은행</label><br>
		<label style="font-size: 40px;">예금주 : 김제주</label><br>
		<label style="color:#FF0000;">※ 입금 기간: 예약 신청 시점으로 부터 1시간 이내</label>
	</div>
	<br>
		<label style="color:#FF0000;">※이 페이지는 한번만 표시되며, 입금 계좌번호 및 예약 상태는 마이페이지에서 언제나 확인 가능합니다.</label>
	<br>				
		<input type="button" id="mypage" name="mypage"  value="마이페이지" style="width:80px; height:40px;">
		<input type="button" id="main" name="main"  value="메인으로" style="width:80px; height:40px;">
	<br>
	</div>
	<br>
</div>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>