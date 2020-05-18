<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 후기등록</title>
<link rel="icon" type="image/png" href="../resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
</head>
<div>
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>
</div>

<script type="text/javascript">
		$(function() {
			//등록 버튼 클릭시
			$("#insertBtn").click(function() {
				//입력값 체크
				if ($("#re_title").val() == "") {
				alert("제목을 입력해 주세요.");
				$("#re_title").focus();
				return false;
				}
				if ($("#re_content").val() == "") {
					alert("내용을 입력해 주세요.");
					$("#re_content").focus();
					return false;
				}
					$("#revInsert").attr({
						"method" : "POST",
						"action" : "/review/ReviewInsert"
					})
					$("#revInsert").submit();
			})
		})
	</script>

<style>

.contentss{
	background-color:#FFFFFF;
}

.button-bar {
	margin-left: 525px;
}
</style>

<body>
<div class="contentss">
<br>
<h2 class="sub-header" style="font-size:60px; margin-top:20px; margin-left:50px; text-align: center;">후기 등록</h2>
	<div class="table-responsive" align="center">
		<form id="revInsert" name="revInsert" method="post" enctype="multipart/form-data">
			<table border="1" style="text-align: center; font-size:20px;">
				<tr>
					<td><b>제목</b></td>
					<td colspan="5">
						<input type="text" name="re_title" id="re_title" value="" style="width: 500px;">
						<c:set var="loginid" value="${sessionScope.ClientLogin.mem_id}"></c:set>
						<input type="hidden" id="mem_id" name="mem_id" value="${loginid}">
					</td>
				</tr>
				<tr>
					<td><b>내용</b></td>
					<td colspan="5"><textarea name="re_content" id="re_content"
							style="height: 500px; width: 500px; resize: none;"></textarea></td>
				</tr>
				<tr>
					<td>이미지 업로드</td>
					<td><input type="file" name="file" id="file"></td>
				</tr>
			</table>
		</form>
		<br>
		<div class="button-bar" align="center">
			<input type="button" value="등록" id="insertBtn" class="btn btn-primary"> 
			<input type="button" value="취소" onClick="history.go(-1)" class="btn btn-primary">
		</div>
		<br>
	</div>

</div>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>