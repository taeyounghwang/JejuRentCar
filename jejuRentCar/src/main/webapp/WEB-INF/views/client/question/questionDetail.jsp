<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 문의게시글 보기</title>
<link rel="icon" type="image/png" href="resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<div>
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>
</div>

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		//목록으로 버튼 클릭 시
		$("#qnaListBtn").click(function() {
			location.href = "/question/qnaboard";
		});

		// 삭제하기 버튼 클릭 시
		$("#deleteBtn").click(function() {
			confirm("삭제하시겠습니까?");
		{	
				$("#detail").attr({
					"method" : "POST",
					"action" : "/question/qnaListDelete"
				});
				$("#detail").submit();
				alert("삭제되었습니다.");
		}
		});
		
		// 수정하기 버튼 클릭 시
		$("#updateBtn").click(function() {
			confirm("수정하시겠습니까?");
		{	
				$("#detail").attr({
					"method" : "POST",
					"action" : "/question/qnaUpdateForm"
				});
				$("#detail").submit();
		}
		});
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
		<h2 class="sub-header" style="margin-left:">문의 게시판 상세 조회</h2>
		<hr class="one" style="border: none; border: 1px solid gray;">
		<br>
		
		<div align="center">
			<form id="detail">
			<input type="hidden" id="inq_number" name="inq_number"
				value="${qnavo.inq_number}" />
				<div>
				<input type="hidden" name="inq_number" id="inq_number" value="${qnavo.inq_number}" style="width:100px;">
				<input type="hidden" name="mem_id" id="mem_id" value="${qnavo.mem_id}" style="width:100px;">
				<input type="hidden" name="mem_name" id="mem_name" value="${qnavo.mem_name}" style="width:100px;">
				<input type="hidden" name="inq_regdate" id="inq_regdate" value="${qnavo.inq_regdate}" style="width:100px;">
				<input type="hidden" name="inq_title" id="inq_title" value="${qnavo.inq_title}" style="width:100px;">
				<input type="hidden" name="inq_content" id="inq_content" value="${qnavo.inq_content}" style="width:100px;">
				<input type="hidden" name="inq_reply" id="inq_reply" value="${qnavo.inq_reply}" style="width:100px;">
				</div>
			<table border="1" style="text-align: center; font-size: 20px;">
				<tr>
					<td style="width: 100px;">글번호</td>
					<td>${qnavo.inq_number}</td>
					<td>ID</td>
					<td>${qnavo.mem_id}</td>
					<td>작성자명</td>
					<td>${qnavo.mem_name}</td>
					<td>작성일</td>
					<td>${qnavo.inq_regdate}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="7" width="1000px" style="text-align: left;">${qnavo.inq_title}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="7" width="1000px" style="text-align: left; height:500px">${qnavo.inq_content}</td>
				</tr>
				<tr>
					<td>댓글 답변</td>
					<td colspan="7" width="1000px">${qnavo.inq_reply}</td>
				</tr>
			</table>
			</form>
			<br>
			<div align="center">
				<input type="button" value="목록으로" id="qnaListBtn"
					class="btn btn-primary"> &nbsp;&nbsp;&nbsp;&nbsp;
					<c:set var="loginid" value="${sessionScope.ClientLogin.mem_id}" />
					<c:if test="${ loginid eq qnavo.mem_id }">
					<input type="button" value="삭제하기" id="deleteBtn" class="btn btn-primary">
					<input type="button" value="수정하기" id="updateBtn">
					</c:if>
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