<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		
		//이미지 수정
		var value = "${vo.nt_image}";
		if (value != "") {
			var img = $("<img>");
			$('#imgView').hover(function() {
				img.attr({
					src : "/uploadStorage/notice/${vo.nt_image}",
					width : "450px",
					height : "200px"
				});
				img.addClass("imgViewData");
				$('#imgArea').append(img);
			}, function() {
				img.remove();
			});
		} else {
			$('#imgView').hide();
		}
		
		//목록으로 버튼 클릭 시
		$("#cancelBtn").click(function() {
			location.href = "/admin/noticeboard/notice";
		})
		
		//삭제 버튼 클릭 시
		$("#deleteBtn").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				$("#update").attr({
					"method" : "POST",
					"action" : "/admin/noticeboard/noticeDelete"
				})
				$("#update").submit();
			}
		})
		//저장 버튼 클릭 시
		$("#updateBtn").click(function() {
			if (confirm("수정하시겠습니까?")) {
				$("#update").attr({
					"method" : "POST",
					"action" : "/admin/noticeboard/noticeUpdate"
				})
				$("#update").submit();
			}
		})
	})
</script>
<div class="contetnContainer">
	<h2 class="sub-header">공지사항 수정/삭제</h2>
	<div class="table-responsive">
		<form id="update" name="update" method="post" enctype="multipart/form-data">
			<input type="hidden" id="nt_number" name="nt_number" value="${vo.nt_number}" />
			<table class="table table-bordered" style="width: 1000px;">
				<tr>
					<td><b>글 번호</b></td>
					<td><input type="text" name="nt_number" id="nt_number" value="${vo.nt_number}" disabled="disabled"></td>
					<td style="width:100px;"><b>공지종류</b></td>
					<td style="width:100px;"><select id="nt_heading" name="nt_heading">
						<option value="예약" <c:if test="${vo.nt_heading == '예약' }">selected</c:if>>예약</option>
						<option value="환불" <c:if test="${vo.nt_heading == '환불' }">selected</c:if>>환불</option>
						<option value="차량옵션" <c:if test="${vo.nt_heading == '차량옵션' }">selected</c:if>>차량옵션</option>
						<option value="인수/반납" <c:if test="${vo.nt_heading == '인수/반납' }">selected</c:if>>인수/반납</option>
						<option value="성수기/비수기" <c:if test="${vo.nt_heading == '성수기/비수기' }">selected</c:if>>성수기/비수기</option>
						<option value="날짜변경" <c:if test="${vo.nt_heading == '날짜 변경' }">selected</c:if>>날짜 변경</option>
						<option value="기타사항" <c:if test="${vo.nt_heading == '기타사항' }">selected</c:if>>기타사항</option>
					</select></td>
					<td><b>작성자</b></td>
					<td>관리자</td></tr>
					<tr>
					<td><b>작성일</b></td>
					<td>${vo.nt_regdate}</td>
					</tr>
				<tr>
					<td><b>제목</b></td>
					<td colspan="5"><input type="text" name="nt_title" id="nt_title" value="${vo.nt_title}" style="width:500px;"></td>
				</tr>
				<tr>
					<td><b>내용</b></td>
					<td colspan="5"><textarea name="nt_content" id="nt_content" style="height:300px;width:500px; resize: none;">${vo.nt_content}</textarea></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td colspan="3"><input type="file" name="file" id="file">
						<input type="hidden" name="nt_image" value="${vo.nt_image}">
						<span id="imgView">기존 이미지파일명 : ${vo.nt_image}
						<span id="imgArea"> </span></span></td>
				</tr>
			</table>
		</form>
		<div>
			<input type="button" value="목록으로" id="cancelBtn" class="btn btn-primary">
			<input type="button" value="삭제" id="deleteBtn" class="btn btn-primary">
			<input type="button" value="저장" id="updateBtn" class="btn btn-primary">
		</div>
	</div>
</div>