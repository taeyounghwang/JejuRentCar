<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 문의 작성</title>
<link rel="icon" type="image/png" href="../resources/images/favicon.png">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Yeon+Sung&display=swap" rel="stylesheet">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<div>
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>
</div>

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
$(function() {
	
	// 취소 버튼 클릭 시
	$("#qnaListBtn").click(function() {
		if(confirm("글 작성을 중단하고 목록으로 돌아가시겠습니까?")){
			alert("글목록으로 돌아갑니다.");
			location.href = "/question/qnaboard";	
		}else{
			return false;
		}
		
	});

	// 문의글 작성완료 버튼 클릭 시
	$("#insertBtn").click(function() {
		if(confirm("글을 등록 하시겠습니까?")){
			if ($("#inq_title").val() == "") {
				alert("제목을 입력해 주세요.");
				$("#inq_title").focus();
				return false;
			}
			if ($("#inq_content").val() == "") {
				alert("내용을 입력해 주세요.");
				$("#inq_content").focus();
				return false;
			}
			$("#qnaForm").attr({
				"method" : "POST",
				"action" : "/question/qnaInsert"
			});
			$("#qnaForm").submit();
			alert("등록 되었습니다.");
		}else{
			alert("취소 되었습니다.");
			location.href="/question/qnaboard";
		}
	
	});
});
</script>

<style>

.contentss{
	background-color: #FFFFFF;
}

</style>

<body>
<div class="contentss" align="center">

<label style="font-size:60px; margin-top:20px; margin-left:50px; text-align: center;">문의 글 작성</label>
	<form id="qnaForm">
	<c:set var="loginid" value="${sessionScope.ClientLogin.mem_id}"/>
				<c:set var="loginname" value="${sessionScope.ClientLogin.mem_name}"/>
					<input type="hidden" value="${ loginid }" id="mem_id" name="mem_id">
					<input type="hidden" value="${ loginname }" id="mem_name" name="mem_name">
		<table border="1" style="text-align: center; font-size:20px;">
				<tr>
					<td style="width:60px;"><b>제목</b></td>
					<td colspan="5"><input type="text" name="inq_title" id="inq_title" value="" style="width:500px;"></td>
				</tr>
				<tr>
					<td style="width:60px;"><b>내용</b></td>
					<td colspan="5"><textarea name="inq_content" id="inq_content" style="height:600px;width:500px; resize: none;"></textarea></td>
				</tr>
			</table>
	</form>
	<div>
	<br>
		<input type="button" value="작성완료" id="insertBtn">
		<input type="button" value="취소" id="qnaListBtn">
	<br>
	</div>
	<br>
</div>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>