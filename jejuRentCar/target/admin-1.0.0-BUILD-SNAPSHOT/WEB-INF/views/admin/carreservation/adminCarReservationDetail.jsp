<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		//취소버튼 클릭 시
		$("#cancelBtn").click(function() {
			location.href = "/admin/carres/carRes";
		})
		//저장버튼 클릭 시
		$("#updateBtn").click(function() {
			if (confirm("저장하시겠습니까?")) {
				
				$("#update").attr({
					"method" : "POST",
					"action" : "/admin/carres/adminCarReservationUpdate"
				})
				$("#update").submit();
			}
		})
	})
</script>
<div class="contetnContainer">
	<h2 class="sub-header">차량 인수 인계 관리 상세 내역</h2>
	<div class="table-responsive">
		<form id="update" name="update">
			<input type="hidden" id="ren_number" name="ren_number"
				value="${vo.ren_number}" />
			
			<table class="table table-bordered">
				<tr>
					<td style="width: 200px;"><b>대여번호</b></td>
					<td>${vo.ren_number}</td>
				</tr>
				<tr>
					<td><b>차량번호</b></td>
					<td><input type="text" id="ren_car_number" name="ren_car_number" value="${vo.ren_car_number}"></td>
				</tr>
				<tr>
					<td><b>차량명</b></td>
					<td>${vo.car_name}<input type="hidden" id="car_name" name="car_name" value="${vo.car_name}"></td>
				</tr>
				<tr>
					<td><b>예약번호</b></td>
					<td>${vo.rsv_number}<input type="hidden" id="rsv_number" name="rsv_number" value="${vo.rsv_number}">
				</tr>
				<tr>
					<td><b>운전면허증</b></td>
					<td><input type="text" id="ren_license_number" name="ren_license_number" value="${vo.ren_license_number}"></td>
				</tr>
				<tr>
					<td><b>이용 상태</b></td>
					<td>
					<c:if test="${vo.rsv_state == '입금완료(인수대기)'}">
					<select id="rsv_state" name="rsv_state">
							<option value="입금완료(인수대기)" <c:if test="${vo.rsv_state == '입금완료(인수대기)' }">selected</c:if>>입금완료(인수대기)</option>
							<option value="렌트중"  <c:if test="${vo.rsv_state == '렌트중' }">selected</c:if>>렌트중</option>
							<option value="반납완료"  <c:if test="${vo.rsv_state == '반납완료' }">selected</c:if>>반납완료</option>
					</select>
					</c:if>
					
					<c:if test="${vo.rsv_state == '렌트중'}">
					<select id="rsv_state" name="rsv_state">
						<option value="렌트중"  <c:if test="${vo.rsv_state == '렌트중' }">selected</c:if>>렌트중</option>
						<option value="반납완료">반납완료</option>
					</select>
					</c:if>
					
					<c:if test="${vo.rsv_state == '반납완료'}">
						${vo.rsv_state}
					</c:if>
					</td>
				</tr>
				<tr>
					<td><b>실 대여 일시</b></td>
					<td><input type="date" id="ren_take_date" name="ren_take_date" value="${vo.ren_take_date}"></td>
				</tr>
				<tr>
					<td><b>실 반납 일시</b></td>
					<td><input type="date" id="ren_return_date" name="ren_return_date" value="${vo.ren_return_date}"></td>
				</tr>
			</table>
		</form>
		<div>
			<input type="button" value="취소" id="cancelBtn" class="btn btn-primary">
			<input type="button" value="저장" id="updateBtn" class="btn btn-primary">
		</div>

	</div>
</div>
