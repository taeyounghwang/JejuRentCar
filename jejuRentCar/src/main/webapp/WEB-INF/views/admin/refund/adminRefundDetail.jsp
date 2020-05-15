<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		//목록으로 버튼 클릭 시
		$("#cancelBtn").click(function() {
			location.href = "/admin/refund/reFund";
		})
		//저장버튼 클릭 시
		$("#updateBtn").click(function() {
			if (confirm("저장하시겠습니까?")) {
				
				$("#detail").attr({
					"method" : "POST",
					"action" : "/admin/refund/adminrefundUpdate"
				})
				$("#detail").submit();
			}
		})
	})
</script>
<div class="contetnContainer">
	<h2 class="sub-header">환불 상세 내역</h2>
	<div class="table-responsive">
		<form id="detail" name="detail" method="post">
			<input type="hidden" id="ref_number" name="ref_number" value="${vo.ref_number}" />
			<input type="hidden" id="rsv_number" name="rsv_number" value="${vo.rsv_number}" />
			<table class="table table-bordered" style="width: 600px;">
				<tr>
					<td>환불번호</td>
					<td>${vo.ref_number}</td>
				</tr>
				<tr>
					<td>ID</td>
					<td>${vo.mem_id}</td>
				</tr>
				<tr>
					<td>예약자명</td>
					<td>${vo.rsv_name}</td>
				</tr>
				<tr>
					<td>예약 번호</td>
					<td>${vo.rsv_number}</td>
				</tr>
				<tr>
					<td>예약 신청일</td>
					<td>${vo.rsv_apply_date}</td>
				</tr>
				<tr>
					<td>대여 예상 일시</td>
					<td>${vo.rsv_insu} ~ ${vo.rsv_bannad} </td>
				</tr>
				<tr>
					<td>차량 명</td>
					<td>${vo.car_name}</td>
				</tr>
				<tr>
					<td>이용 금액</td>
					<td>${vo.rsv_price}</td>
				</tr>
				<tr>
					<td>환불 계좌</td>
					<td>${vo.bk_name} / ${vo.bk_account} / ${vo.bk_user}</td>
				</tr>
				<tr>
					<td>환불 상태</td>
					<td>
					<c:if test="${vo.rsv_state == '환불완료'}">
						${vo.rsv_state}
					</c:if>
					<c:if test="${vo.rsv_state == '환불대기' }">
					<select id="rsv_state" name="rsv_state">
							<option value="환불대기" <c:if test="${vo.rsv_state == '환불대기' }">selected</c:if>>환불대기</option>
							<option value="환불완료"  <c:if test="${vo.rsv_state == '환불완료' }">selected</c:if>>환불완료</option>
					</select>
					</c:if>
					</td>
				</tr>
			</table>
		</form>
		<div>
			<input type="button" value="목록으로" id="cancelBtn" class="btn btn-primary">
			<c:if test="${vo.rsv_state == '환불대기' }">
			<input type="button" value="저장" id="updateBtn" class="btn btn-primary">
			</c:if>
		</div>

	</div>
</div>
