<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 후기 상세</title>
<link rel="icon" type="image/png" href="resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Yeon+Sung&display=swap" rel="stylesheet">
</head>
<div>
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>
</div>

<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript">
	$(function(){
		
		//이미지 불러오기 기능
		$("#fileImage").attr({
			src : "/uploadStorage/ReviewImage/${detail.re_image1}",
			width : "450px",
			height : "200px"
		})
		
		//목록으로 버튼 클릭 시 기능
		$("#reviewListBtn").click(function() {
			location.href = "/review/list";
		})
		
		// 후기글 삭제하기 버튼 클릭 시
		$("#deleteBtn").click(function() {
			if (confirm("삭제하시겠습니까?") == true) {
				$("#detail").attr({
					"method" : "POST",
					"action" : "/review/reviewDelete"
				})
				$("#detail").submit();
				alert("삭제되었습니다.");
			} else {
				alert("취소되었습니다.");
				location.href = "/review/list";
			}
		})
		
	});
	
	</script>	

<style>

.contentss{
	background-color: #FFFFFF;
}

.contetnContainer{
	width:1000px;
	height:900px;
	margin-left:400px;
}
.mypageMain{
	height: 1250px;
}
.imgtd{
	height:300px;
}
#fileImage{
	width:650px;
	height:400px;
}
</style>

<body>
<div class="contentss">

<br> &nbsp;&nbsp;&nbsp;메인페이지 > 후기게시판
		<hr class="one" style="border: none; border: 1px solid gray;">
		<br>
		<div class="mypageMain">

<div class="contetnContainer" align="center" style="text-align: center; font-size: 25px;">
	<h2 class="sub-header">후기 게시판 상세 조회</h2>
	<br>
	<div class="table-responsive">
		<form id="detail" name="detail" method="post">
			<input type="hidden" id="re_number" name="re_number"
				value="${detail.re_number}" />
			<table class="table table-bordered" border="1" style="border: 2px solid #aaa;
	border-radius: 4px;">
				<tr>
					<td>글번호</td>
					<td>&nbsp;${detail.re_number}&nbsp;</td>
					<td>&nbsp;ID&nbsp;</td>
					<td>${detail.mem_id}</td>
					<td>작성일</td>
					<td>${detail.re_regdate}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="5" style="text-align: left;">${detail.re_title}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="5" height="400px;" style="text-align: left;">${detail.re_content}</td>
				</tr>
				<tr>
					<td colspan="1">이미지</td>
					<td colspan="5" class="imgtd"><img id="fileImage"> ${detail.re_image1}</td>
				</tr>
				<tr>
					<td style="width:100px;">관리자 댓글</td>
					<td colspan="5">${detail.re_reply}</td>
					
				</tr>
			</table>
		</form>
		<div>
		<c:set var="loginid" value="${sessionScope.ClientLogin.mem_id}" />
		<input type="button" value="목록으로" id="reviewListBtn"
				class="btn btn-primary">
		<c:if test="${ loginid eq detail.mem_id }">
			 &nbsp;&nbsp;&nbsp;&nbsp;<input
				type="button" value="삭제하기" id="deleteBtn" class="btn btn-primary">
		</c:if>
		</div>
		<br>
		
	</div>
</div>

</div>
</div>
</body>

<div>
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>