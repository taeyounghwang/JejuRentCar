<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 환불완료</title>
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
					
					var query = {
							rsv_state : $("#rsv_state").val(),
							rsv_number : $("#rsv_number").val(),
							bk_name : $("#bk_name").val(),
							bk_account : $("#bk_account").val(),
							bk_user : $("#bk_user").val()
						};
					$.ajax({
						url : "/mypage/refrequest",
						type : "post",
						data : query,
						error : function() {
							alert('오류가 발생하였습니다. 관리자에게 문의해주세요.');
						},
						success : function(resultData) {
							if (resultData == 1) {
								alert("환불요청이 완료 되었습니다.");
								location.href = "/mypage/list"
							} else if (resultData == 2) {
								alert($("#rsv_state").val());
								alert("환불요청을 실패 하였습니다.");
								location.href = "/mypage/list"
							}
						}
					});
				}
			})
			
		});
	</script>

<body>
<div class="contentss" align="center">

<div align="center">
<form id="refUpdate" name="refUpdate" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<td>
					<c:set var="loginid" value="${sessionScope.ClientLogin.mem_id}"></c:set> 
					<input type="text" id="mem_id" name="mem_id" value="${loginid}">
					<input type="text" id="rsv_number" name="rsv_number" value="${detail.rsv_number}">
					<input type="text" id="rsv_state" name="rsv_state" value="${detail.rsv_state}">
					</td>
				</tr>

	<tr>
		<td>	
		<h1>"환불 신청이 완료되었습니다"</h1>
		</td>
	</tr>
	<tr>
		<td>
		<h4>은행</h4>
		<br>
		${detail.bk_name}
		</td>
	</tr>
	
	<tr>
		<td>
		<h4>환불 계좌번호</h4>
		<br>
		${detail.bk_account}
		</td>
	</tr>
	
	<tr>
		<td>
		<h4>예금주</h4>
		<br>
		${detail.bk_user}
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