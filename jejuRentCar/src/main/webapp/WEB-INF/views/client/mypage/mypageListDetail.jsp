<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 상세조회</title>
<link rel="icon" type="image/png" href="../resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Yeon+Sung&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<div>
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>
</div>

<script type="text/javascript">
		
	$(function() {
		$("#rescancel").click(function() {
			var query = {
					rsv_state : $("#rsv_state").val(),
					rsv_number : $("#rsv_number").val()
				};
			$.ajax({
				url : "/refund/rescancel",
				type : "post",
				data : query,
				error : function() {
					alert('오류가 발생하였습니다. 관리자에게 문의해주세요.');
				},
				success : function(resultData) {
					if (resultData == 1) {
						alert("예약취소가 완료 되었습니다.");
						location.href = "/mypage/list"
					} else if (resultData == 2) {
						alert("예약취소를 실패 하였습니다.");
						location.href = "/mypage/list"
					}
				}
			});
		});
		
		$("#refBtn").click(function() {
	         $("#refRequest").attr("method","post");
	         $("#refRequest").attr("action","/refund/RefundForm");
	         $("#refRequest").submit();
	      });
	
		
		
	});
</script>

<style>
.contentss{
background-color: #FFFFFF;
}

.btn btn-outline-success{
background-color: black;
}
</style>

<body>
<div class="contentss">

<div class="title" align="center">
<br>
<h3>상세 예약정보</h3>
<br>
</div>
<form id="refRequest">
<div class="detailTable" align="center">

		 <input type="hidden" name="car_name" id="car_name" value="${detail.car_name }">
         <input type="hidden" name="mem_id" id="mem_id" value="${detail.mem_id}">
         <input type="hidden" name="rsv_cellphone" id="rsv_cellphone" value="${detail.rsv_cellphone}">
         <input type="hidden" name="rsv_price" id="rsv_price" value="${detail.rsv_price}">
         <input type="hidden" name="rsv_name" id="rsv_name" value="${detail.rsv_name}">
         <input type="hidden" name=rsv_apply_date id="rsv_apply_date" value="${detail.rsv_apply_date}">
         <input type="hidden" name="rsv_bannad" id="rsv_bannad" value="${detail.rsv_bannad}">
         <input type="hidden" name="rsv_insu" id="rsv_insu" value="${detail.rsv_insu}">
         <input type="hidden" id="rsv_state" name="rsv_state" value="${detail.rsv_state}">
         <input type="hidden" id="rsv_number" name="rsv_number" value="${detail.rsv_number}">

	<table border="1" style="text-align: center; font-size: 20px;">
		<tr>
         <td colspan="2" width="100px;">차량명</td>
         <td width="300px" colspan="2">${detail.car_name }</td>
      </tr>
      <tr>
         <td colspan="2">아이디</td>
         <td width="300px" colspan="2">${detail.mem_id }</td>
      </tr>
      <tr>
         <td colspan="2">전화번호</td>
         <td width="300px" colspan="2">${detail.rsv_cellphone }</td>
      </tr>
      <tr>
         <td colspan="2">결제금액</td>
         <td width="300px" colspan="2">${detail.rsv_price}</td>
      </tr>
      <tr>
         <td colspan="2">유의사항</td>
         <td width="300px" colspan="2">1시간 이내 입금이 확인되지 않을경우,<br> 예약이 자동으로 취소됩니다.</td>
      </tr>
      <tr>
         <td colspan="2">이용자</td>
         <td colspan="2">${detail.rsv_name }</td>
      </tr>
      <tr>
         <td colspan="2">예약 일자</td>
         <td width="300px" colspan="2">${detail.rsv_apply_date }</td>
      </tr>
      <tr>
         <td colspan="2">대여 기간</td>
         <td width="300px" colspan="2">시작 : ${detail.rsv_insu } <br> 종료 : ${detail.rsv_bannad }</td>
      </tr>
      <tr>
         <td colspan="2">인수 지역</td>
         <td colspan="2">제주공항 지점</td>
      </tr>
      <tr>
         <td colspan="2">옵션 : </td>
         <td colspan="2">${car.car_option }</td>
      </tr>
      <tr>
         <td colspan="2">예약 상태</td>
         <td colspan="2">${detail.rsv_state}</td>
      </tr>
      </table>
      	<div align="center">
      	<br>
			<c:if test="${detail.rsv_state == '입금대기'}">
			<input type="button" class="btn btn-outline-success" value="예약취소" id="rescancel">
			</c:if>
			<c:if test="${detail.rsv_state == '입금완료(인수대기)'}">
			<input type="button" class="btn btn-outline-success" value="환불요청" id="refBtn">
			</c:if>
		</div>
	
	</div>
</form>
		<div class="button-bar" align="center">
		<br>
		<input type="button" class="btn btn-outline-success" value="목록 보기" onClick="history.go(-1)"> 
	</div>
	<br>

</div>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>