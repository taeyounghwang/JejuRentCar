<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 환불요청</title>
<link rel="icon" type="image/png" href="resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
</head>
<div>
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>
</div>

<style>

.contentss{
background-color: #FFFFFF;
}

.wrapper{
border: 2px;
border-color: black;
}

</style>

<script type="text/javascript">
		$(function() {
			//환불 요청 버튼 클릭시
			$("#refrequest").click(function() {
				//입력값 체크
				if (!chkSubmit($("#bk_name"), "은행명을 입력해주세요"))
					return;
				else if (!chkSubmit($("#bk_account"), "계좌번호를 입력해주세요"))
					return;
				else if (!chkSubmit($("#bk_user"), "예금주 이름을 입력해주세요"))
					return;
				else {
					
					$("#refrequest").click(function() {
						$("#refUpdate").attr("action","/refund/refrequest");
						$("#refUpdate").submit();
					});
				}
			})
			
		});
	</script>

<body>
<div class="contentss" align="center">

<div align="center">
<form id="refUpdate" name="refUpdate" method="post">
			<table class="table table-bordered">
				<tr>
					<td>
					<c:set var="loginid" value="${sessionScope.ClientLogin.mem_id}"></c:set> 
					<input type="hidden" id="mem_id" name="mem_id" value="${loginid}">
					<input type="hidden" name="car_name" id="car_name" value="${detail.car_name }">
					<input type="hidden" name="rsv_price" id="rsv_price" value="${detail.rsv_price}">
					<input type="hidden" name="rsv_name" id="rsv_name" value="${detail.rsv_name}">
					<input type="hidden" name="rsv_apply_date" id="rsv_apply_date" value="${detail.rsv_apply_date}">
					<input type="hidden" name="rsv_bannad" id="rsv_bannad" value="${detail.rsv_bannad}">
					<input type="hidden" name="rsv_insu" id="rsv_insu" value="${detail.rsv_insu}">
					<input type="hidden" id="rsv_state" name="rsv_state" value="${detail.rsv_state}"/>
					<input type="hidden" id="rsv_number" name="rsv_number" value="${detail.rsv_number}">
				</tr>

	<tr>
		<td>	
		<h2>환불 요청</h2>
		</td>
	</tr>
	<tr>
		<td>
		<h4>은행</h4>
		<br>
		<input type="text" id="bk_name" name="bk_name" placeholder="은행명"  style="width: 500px;">
		</td>
	</tr>
	
	<tr>
		<td>
		<h4>환불 계좌번호</h4>
		<br>
		<input type="text" id="bk_account" name="bk_account" placeholder="123-456789-01-010" style="width: 500px;">
		</td>
	</tr>
	
	<tr>
		<td>
		<h4>예금주</h4>
		<br>
		<input type="text" id="bk_user" name="bk_user" placeholder="홍길동"  style="width: 500px;">
		</td>
	</tr>
</table>
</form>
</div>
</div>
<div align="center">
	<br>
		<input type="button" class="btn btn-outline-success" value="환불 요청" id="refrequest"> 
		<input type="button" class="btn btn-outline-success" value="환불 취소" onClick="history.go(-1)">
	<br>
</div>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>