<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		//취소버튼 클릭 시
		$("#cancelBtn").click(function() {
			location.href = "/admin/memreservation/memRes";
		})
		//저장버튼 클릭 시
		$("#updateBtn").click(function() {
			if (confirm("저장하시겠습니까?")) {
				$("#detail").attr({
					"method" : "POST",
					"action" : "/admin/memreservation/adminMemReservationUpdate"
				})
				$("#detail").submit();
			}
		})
	})
	
</script>
<div class="contetnContainer">
	<h2 class="sub-header">회원 예약 상세 내역</h2>
	<div class="table-responsive">
		<form id="detail" name="detail" method="post">
			<input type="hidden" id="rsv_number" name="rsv_number" value="${vo.rsv_number}" />
			<input type="hidden" id="car_model_number" name="car_model number" value="${vo.car_model_number}" /><!-- 차량 예약 관리에서 필요함 -->
			<table class="table table-bordered" style="width: 600px;">
				<tr>
					<td>ID</td>
					<td>${vo.mem_id}</td>
				</tr>
				<tr>
					<td>예약자명</td>
					<td>${vo.rsv_name}</td>

				</tr>
				<tr>
					<td>예약자 핸드폰번호</td>
					<td>${vo.rsv_cellphone}</td>
				</tr>
				<tr>
					<td>예약번호</td>
					<td>${vo.rsv_number}</td>
				</tr>
				<tr>
					<td>예약 상태</td>
					<td>
					<c:if test="${vo.rsv_state == '렌트중' or vo.rsv_state == '반납완료' or vo.rsv_state == '환불대기' or vo.rsv_state == '환불완료'}">
						${vo.rsv_state}
					</c:if>
					<c:if test="${vo.rsv_state == '입금대기'}">
					<select id="rsv_state" name="rsv_state">
							<option value="입금대기" disabled="disabled">입금대기</option>
							<option value="입금완료(인수대기)">입금완료(인수대기)</option>
							<option value="입금취소">입금취소</option>
					</select>
					</c:if>
					<c:if test="${vo.rsv_state == '입금완료(인수대기)' or vo.rsv_state == '입금취소'}">
							${vo.rsv_state}
					</c:if>
					</td>
				</tr>
				<tr>
					<td>차량 명</td>
					<td>${vo.car_name}</td>
				</tr>
				<tr>
					<td>이용금액</td>
					<td>${vo.rsv_price}</td>
				</tr>
				<tr>
					<td>차량 번호</td>
					<td>${vo.ren_car_number}</td>
				</tr>
				<tr>
					<td>대여 예상 일시</td>
					<td>${vo.rsv_insu} ~ ${vo.rsv_bannad}</td>
				</tr>
			</table>
		</form>
		<div>
			<input type="button" value="취소" id="cancelBtn" class="btn btn-primary">
		<c:if test="${vo.rsv_state == '입금대기'}">
			<input type="button" value="저장" id="updateBtn" class="btn btn-primary">
		</c:if>
		</div>

	</div>
</div>
