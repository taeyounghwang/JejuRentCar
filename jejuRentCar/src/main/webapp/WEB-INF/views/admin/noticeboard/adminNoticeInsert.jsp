<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function() {
		//등록 버튼 클릭시
		$("#insertBtn").click(function() {
			//입력값 체크
			if (!chkSubmit($('#nt_heading'), "차량명을 입력해주세요"))
				return;
			else if (!chkSubmit($("#nt_title"), "제목을 입력해주세요"))
				return;
			else if (!chkSubmit($("#nt_content"), "내용을 입력해주세요"))
				return;
			else {
				if ($('#file').val() != "") {
					if (!chkFile($("#file")))
						return;
				}
				$("#noticeInsert").attr({
					"method" : "POST",
					"action" : "/admin/noticeboard/noticeInsert"
				})
				$("#noticeInsert").submit();
			}
		})

		//목록 버튼 클릭 시
		$("#cancelBtn").click(function() {
			location.href = "/admin/noticeboard/notice";
		})
	})

</script>
</head>

<div class="contetnContainer">
	<h2 class="sub-header">공지사항 등록</h2>
	<div class="table-responsive">
		<form id="noticeInsert" name="noticeInsert" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<td style="width:100px;"><b>공지종류</b></td>
					<td style="width:100px;">
					<select id="nt_heading" name="nt_heading">
						<option value="예약">예약</option>
						<option value="환불">환불</option>
						<option value="차량옵션">차량옵션</option>
						<option value="인수/반납">인수/반납</option>
						<option value="성수기/비수기">성수기/비수기</option>
						<option value="날짜변경">날짜 변경</option>
						<option value="기타사항">기타사항</option>
					</select></td>
				</tr>
				<tr>
					<td><b>제목</b></td>
					<td colspan="5"><input type="text" name="nt_title" id="nt_title" value="" style="width:500px;"></td>
				</tr>
				<tr>
					<td><b>내용</b></td>
					<td colspan="5"><textarea name="nt_content" id="nt_content" style="height:500px;width:500px; resize: none;"></textarea></td>
				</tr>
				<tr>
					<td>이미지 업로드</td>
					<td><input type="file" name="file" id="file" required></td>
				</tr>
			</table>
		</form>
		<div>
			<input type="button" value="목록으로" id="cancelBtn" class="btn btn-primary">
			<input type="button" value="저장" id="insertBtn" class="btn btn-primary">
		</div>
	</div>
</div>

