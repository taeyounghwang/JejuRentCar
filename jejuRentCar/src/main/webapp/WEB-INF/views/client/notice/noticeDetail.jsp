<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 공지 상세</title>
<link rel="icon" type="image/png" href="../resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">

</head>
<div>
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>
</div>

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	
	//파일 이미지 크기 설정 및 가져오기 (지우지말것!!)
	$("#fileImage").attr({
		src : "/uploadStorage/notice/${ntvo.nt_image}",
		width : "450px",
		height : "200px"
	}) 
	
	//목록으로 버튼 클릭 시 기능
	$("#qnaListBtn").click(function() {
		location.href = "/notice/list";
	})
	
});
</script>
<style>

.contentss{
	background-color:#FFFFFF;
	min-height: 600px;
}

.two {
	border: none;
	border: 1px solid gray;
	width: 90%;
	float: left;
}


</style>

<body>
<div class="contentss">

<div class="contetnContainer">
	<br>
	<h2 class="sub-header" style="font-size:60px; margin-top:20px; margin-left:50px;">공지사항 상세 조회</h2>
	<hr class="one" style="border: none; border: 1px solid gray;">
	<br>
		
	<div align="center">
		<form id="detail" name="detail" method="post">
			<input type="hidden" id="nt_number" name="nt_number"
				value="${ntvo.nt_number}" />
			<table border="1" style="text-align: center;">
				<tr>
					<td style="width: 100px;">글번호</td>
					<td>${ntvo.nt_number}</td>
					<td style="width: 100px;">작성일</td>
					<td style="width: 400px;">${ntvo.nt_regdate}</td>
				</tr>
				<tr>
					<td style="width: 100px;">제목</td>
					<td colspan="5"  style="text-align: left; width: 800px;">${ntvo.nt_title}</td>
				</tr>
				<tr>
					<td style="width: 100px; height: 400px;">내용</td>
					<td colspan="5"  style="text-align: left; width: 800px; height: 400px;">${ntvo.nt_content}</td>
				</tr>
				<tr>
				
					<td style="width: 100px;">이미지</td>
					<c:if test="${ntvo.nt_image != ''}">
					<td colspan="10"><img id="fileImage"><br>${ntvo.nt_image}</td>
					</c:if>
				</tr>
			</table>
		</form>
		<div style="magrin-top:50px;">
			<input type="button" value="목록으로" id="qnaListBtn"
				class="btn btn-primary">
		</div>
		<br>
	</div>
</div>

</div>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>