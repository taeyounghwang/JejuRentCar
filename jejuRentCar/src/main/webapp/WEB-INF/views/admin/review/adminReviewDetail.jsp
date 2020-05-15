<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		// 첨부파일 이미지 보여주기 위한 속성 추가
		$("#fileImage").attr({
			src : "/uploadStorage/ReviewImage/${vo.re_image1}",
			width : "450px",
			height : "200px"
		})

		//목록으로 버튼 클릭 시
		$("#reviewListBtn").click(function() {

			if (confirm("저장하지 않고 목록으로 돌아가시겠습니까?")) {
				alert("목록으로 돌아갑니다");
				location.href = "/admin/reviewboard/review";
			} else {
				alert("취소되었습니다.");
				location.href = "redirect:/admin/reviewboard/reviewDetail";
			}
		})

		// 댓글 등록/수정 버튼 클릭 시
		$("#updateBtn").click(function() {
			if (confirm("댓글을 등록/수정하시겠습니까?") == true) {
				$("#detail").attr({
					"method" : "POST",
					"action" : "/admin/reviewboard/reDetailUpdate"
				})
				$("#detail").submit();
				alert("등록되었습니다.");
			} else {
				alert("취소되었습니다.");
				location.href = "/admin/reviewboard/review";
			}
		})

		// 댓글 답변 삭제 버튼 클릭시
		$("#reDeleteBtn").click(function() {
			if (confirm("댓글을 삭제하시겠습니까?") == true) {
				$("#detail").attr({
					"method" : "POST",
					"action" : "/admin/reviewboard//reReDelete"
				})
				$("#detail").submit();
				alert("댓글 답변이 삭제되었습니다.");
			} else {
				alert("취소되었습니다.");
				location.href = "/admin/reviewboard/review";
			}
		})

		// 후기글 삭제하기 버튼 클릭 시
		$("#deleteBtn").click(function() {
			if (confirm("삭제하시겠습니까?") == true) {
				$("#detail").attr({
					"method" : "POST",
					"action" : "/admin/reviewboard/reListDelete"
				})
				$("#detail").submit();
				alert("삭제되었습니다.");
			} else {
				alert("취소되었습니다.");
				location.href = "/admin/reviewboard/review";
			}
		})
	});
</script>
<div class="contetnContainer">
	<h2 class="sub-header">후기 게시판 상세 조회</h2>
	<div class="table-responsive">
		<form id="detail" name="detail" method="post">
			<input type="hidden" id="re_number" name="re_number"
				value="${vo.re_number}" />
			<table class="table table-bordered" style="width:1300px">
				<tr>
					<td>글번호</td>
					<td>${vo.re_number}</td>
					<td>ID</td>
					<td>${vo.mem_id}</td>
					<td>작성일</td>
					<td>${vo.re_regdate}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="5">${vo.re_title}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="5">${vo.re_content}<br> <c:if
							test="${vo.re_image1 != ''}">
							<img id="fileImage">
						</c:if></td>
				</tr>
				<tr>
					<td>관리자 댓글</td>
					<td colspan="4"><textarea id="re_reply" name="re_reply"
							style="width: 800px; height: 100px; resize: none">${vo.re_reply}</textarea></td>
					<td><input type="button" value="등록/수정" id="updateBtn"
						class="btn btn-primary"> &nbsp;&nbsp;&nbsp;&nbsp; <input
						type="button" value="답변 삭제" id="reDeleteBtn"
						class="btn btn-primary"></td>
				</tr>
			</table>
		</form>
		<div>
			<input type="button" value="목록으로" id="reviewListBtn"
				class="btn btn-primary"> &nbsp;&nbsp;&nbsp;&nbsp;<input
				type="button" value="삭제하기" id="deleteBtn" class="btn btn-primary">
		</div>
	</div>
</div>
