<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		// 취소 버튼 클릭 시
		$("#cancelBtn").click(function() {
			if (confirm("글 수정을 중단하고 목록으로 돌아가시겠습니까?")) {
				alert("글목록으로 돌아갑니다.");
				location.href = "/question/qnaboard";
			} else {
				return false;
			}

		});

		//저장 버튼 클릭 시
		$("#updateBtn").click(function() {
			if (confirm("수정하시겠습니까?")) {
				alert($("#inq_number").val());
				$("#update").attr({
					"method" : "POST",
					"action" : "/question/qnaUpdate"
				});
				$("#update").submit();
			}
		});
	});
</script>
</head>
<body>
	<div class="contetnContainer">
		<h2 class="sub-header">문의글 수정</h2>
		<div class="table-responsive">
			<form id="update" >
				<table class="table table-bordered">
					<tr>
						<td><b>글 번호</b></td>
						<td><input type="text" name="inq_number" id="inq_number"
							value="${detail.inq_number}" readonly="readonly"></td>
						<td><b>작성자</b></td>
						<td><b>${detail.mem_id}</b></td>
						<c:set var="loginid" value="${sessionScope.ClientLogin.mem_id}" />
						<c:set var="loginname"
							value="${sessionScope.ClientLogin.mem_name}" />
						<td><input type="hidden" value="${ loginid }" id="mem_id"
							name="mem_id"></td>
						<td><input type="hidden" value="${ loginname }" id="mem_name"
							name="mem_name"></td>
						<td>작성자명</td>
						<td>${qnavo.mem_name}</td>
						<td><b>작성일</b></td>
						<td>${detail.inq_regdate}</td>
					</tr>
					<tr>
						<td><b>제목</b></td>
						<td colspan="5"><input type="text" name="inq_title"
							id="inq_title" value="${detail.inq_title}" style="width: 500px;"></td>
					</tr>
					<tr>
						<td><b>내용</b></td>
						<td colspan="5"><textarea name="inq_content" id="inq_content"
								style="height: 500px; width: 500px; resize: none;">${detail.inq_content}</textarea></td>
					</tr>
				</table>
			</form>
			<div>
				<input type="button" value="목록으로" id="cancelBtn"
					class="btn btn-primary"> <input type="button" value="저장"
					id="updateBtn" class="btn btn-primary">
			</div>
		</div>
	</div>
</body>
</html>