<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		// 첨부파일 이미지 보여주기 위한 속성 추가
		/* 		var file = "<c:out value = '${vo.nt_image}'/>";
		 if(file != ""){ */
		$("#fileImage").attr({
			src : "/uploadStorage/notice/${vo.nt_image}",
			width : "450px",
			height : "200px"
		})
		//목록으로 버튼 클릭 시
		$("#cancelBtn").click(function() {
			location.href = "/admin/noticeboard/notice";
		})
		//수정(삭제)버튼 클릭 시
		$("#updateBtn").click(function() {
			$("#detail").attr({
				"method" : "POST",
				"action" : "/admin/noticeboard/noticUpdateForm"
			})
			$("#detail").submit();

		})
	})
</script>
<div class="contetnContainer">
	<h2 class="sub-header">공지사항 상세 조회</h2>
	<div class="table-responsive">
		<form id="detail" name="detail" method="post">
			<input type="hidden" id="nt_number" name="nt_number"
				value="${vo.nt_number}" />
			<table class="table table-bordered" style="width: 800px;">
				<tr>
					<td style="width:100px;"><b>글 번호</b></td>
					<td>${vo.nt_number}</td>
					<td style="width:100px;"><b>공지종류</b></td>
					<td style="width:100px;">${vo.nt_heading}</td>
					<td style="width:100px;"><b>작성자</b></td>
					<td>관리자</td>
				</tr>
				<tr>
					<td style="width:100px;"><b>작성일</b></td>
					<td style="width:200px;">${vo.nt_regdate}</td>
				</tr>
				<tr>
					<td><b>제목</b></td>
					<td colspan="5">${vo.nt_title}</td>
				</tr>
				<tr>
					<td><b>내용</b></td>
					<td colspan="5">${vo.nt_content}</td>
				</tr>
				<c:if test="${vo.nt_image != ''}">
				<tr>
					<td>이미지</td>
					<td colspan="3"><img id="fileImage"></td>
				</tr>
			</c:if>
			</table>
		</form>
		<div>
			<input type="button" value="목록으로" id="cancelBtn" class="btn btn-primary">
			<input type="button" value="수정(삭제)" id="updateBtn" class="btn btn-primary">
		</div>
	</div>
</div>

