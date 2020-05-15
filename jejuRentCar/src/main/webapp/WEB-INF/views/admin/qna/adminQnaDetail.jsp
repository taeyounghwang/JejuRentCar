<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		//목록으로 버튼 클릭 시
		$("#qnaListBtn").click(function() {
			if (confirm("저장하지 않고 목록으로 돌아가시겠습니까?")) {
				alert("목록으로 돌아갑니다");
				location.href = "/admin/qnaboard/qnaboard";
			} else {
				alert("취소되었습니다.");
				location.href = "redirect:/admin/qnaboard/qnaDetail";
			}
		})

		// 댓글 등록/수정 버튼 클릭 시
		$("#updateBtn").click(function() {
			if (confirm("댓글을 등록/수정하시겠습니까?") == true) {
				$("#detail").attr({
					"method" : "POST",
					"action" : "/admin/qnaboard/qnaDetailUpdate"
				})
				$("#detail").submit();
				alert("등록되었습니다.");
			} else {
				alert("취소되었습니다.");
				location.href = "/admin/qnaboard/qnaboard";
			}
		})

		// 댓글 답변 삭제 버튼 클릭시
		$("#reDeleteBtn").click(function() {
			if (confirm("댓글을 삭제하시겠습니까?") == true) {
				$("#detail").attr({
					"method" : "POST",
					"action" : "/admin/qnaboard/qnaReDelete"
				})
				alert("삭제되었습니다.");
				$("#detail").submit();
			} else {
				alert("취소되었습니다.");
				location.href = "/admin/qnaboard/qnaboard";
			}
		})

		// 문의글 삭제하기 버튼 클릭 시
		$("#deleteBtn").click(function() {
			if (confirm("문의 글을 삭제하시겠습니까?") == true) {
				$("#detail").attr({
					"method" : "POST",
					"action" : "/admin/qnaboard/qnaListDelete"
				})
				$("#detail").submit();
				alert("삭제되었습니다.");
			} else {
				alert("취소되었습니다.");
				location.href = "/admin/qnaboard/qnaboard";
			}
		})
	});
</script>
<div class="contetnContainer">
	<h2 class="sub-header">문의 게시판 상세 조회</h2>
	<div class="table-responsive">
		<form id="detail" name="detail" method="post">
			<input type="hidden" id="inq_number" name="inq_number"
				value="${vo.inq_number}" />
			<table class="table table-bordered" style="width:1300px">
				<tr>
					<td>글번호</td>
					<td>${vo.inq_number}</td>
					<td>ID</td>
					<td>${vo.mem_id}</td>
					<td>작성자명</td>
					<td>${vo.mem_name}</td>
					<td>작성일</td>
					<td>${vo.inq_regdate}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="7">${vo.inq_title}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="7">${vo.inq_content}</td>
				</tr>
				<tr>
					<td>댓글 답변</td>
					<td colspan="5"><textarea id="inq_reply" name="inq_reply"
							style="width: 800px; height: 100px; resize: none">${vo.inq_reply}</textarea></td>

					<td colspan="2"><input type="button" value="등록/수정"
						id="updateBtn" class="btn btn-primary">
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="답변 삭제"
						id="reDeleteBtn" class="btn btn-primary"></td>
				</tr>
			</table>
		</form>
		<div>
			<input type="button" value="목록으로" id="qnaListBtn"
				class="btn btn-primary"> &nbsp;&nbsp;&nbsp;&nbsp;<input
				type="button" value="삭제하기" id="deleteBtn" class="btn btn-primary">
		</div>
	</div>
</div>
