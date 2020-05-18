<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		var value = "${vo.car_image}";
		if (value != "") {
			var img = $("<img>");
			$('#imgView').hover(function() {
				img.attr({
					src : "/uploadStorage/carList/${vo.car_image}",
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
		$("#listBtn").click(function() {
			location.href = "/admin/carlist/carList";
		})

		//수정완료 버튼 클릭 시
		$("#updateBtn").click(function() {
			if (confirm("수정하시겠습니까?") == true) {
				$("#update").attr({
					"method" : "POST",
					"action" : "/admin/carlist/carListUpdate"
				})
				alert("수정되었습니다.");
				$("#update").submit();
			} else {
				alert("취소되었습니다.");
				location.href = "/admin/carlist/carList";
			}

		})
	})
</script>
<div>
	<div>
		<h2 class="sub-header">차량 수정</h2>
	</div>
	<div class="table-responsive">
		<form id="update" name="update" enctype="multipart/form-data">
			<input type="hidden" id="car_model_number" name="car_model_number"
				value="${vo.car_model_number}"> <input type="hidden"
				name="car_image" id="car_image" value="${vo.car_image}" />
			<table class="table table-bordered" style="width: 1000px">
				<tr>
					<td>모델고유번호</td>
					<td>${vo.car_model_number}</td>
					<td>등록일자</td>
					<td>${vo.car_registe_date}</td>
				</tr>
				<tr>
					<td>차량명</td>
					<td colspan="3"><input type="text" name="car_name"
						id="car_name" value="${vo.car_name}"></td>
				</tr>
				<tr>
					<td>대여가격</td>
					<td colspan="3"><input type="text" name="car_price"
						id="car_price" value="${vo.car_price}">&nbsp;(원)</td>
				</tr>
				<tr>
					<td>스틱옵션</td>
					<td colspan="3"><input type="radio" name="car_stick"
						id="car_stick" value="휘발유" checked>오토</td>
				</tr>
				<tr>
					<td>연료옵션</td>
					<td colspan="3"><c:if test="${vo.car_fuel == '휘발유' }">
							<input type="radio" name="car_fuel" id="car_fuel" value="휘발유"
								checked>휘발유<input type="radio" name="car_fuel"
								id="car_fuel" value="전기">전기 </c:if> <c:if
							test="${vo.car_fuel == '전기' }">
							<input type="radio" name="car_fuel" id="car_fuel" value="전기"
								checked>전기<input type="radio" name="car_fuel"
								id="car_fuel" value="휘발유">휘발유
							</c:if>
				</tr>
				<tr>
					<td>최대 승차 인원</td>
					<td colspan="3"><select name="car_number_passengers"
						id="car_number_passengers">
							<c:if test="${vo.car_number_passengers == '5인' }">
								<option value="5인" selected>5인</option>
								<option value="6인">6인</option>
								<option value="7인">7인</option>
								<option value="8인">8인</option>
								<option value="9인">9인</option>
								<option value="10인">10인</option>
								<option value="11인">11인</option>
								<option value="12인">12인</option>
							</c:if>
							<c:if test="${vo.car_number_passengers == '6인' }">
								<option value="6인" selected>6인</option>
								<option value="5인">5인</option>
								<option value="7인">7인</option>
								<option value="8인">8인</option>
								<option value="9인">9인</option>
								<option value="10인">10인</option>
								<option value="11인">11인</option>
								<option value="12인">12인</option>
							</c:if>
							<c:if test="${vo.car_number_passengers == '7인' }">
								<option value="7인" selected>7인</option>
								<option value="5인">5인</option>
								<option value="6인">6인</option>
								<option value="8인">8인</option>
								<option value="9인">9인</option>
								<option value="10인">10인</option>
								<option value="11인">11인</option>
								<option value="12인">12인</option>
							</c:if>
							<c:if test="${vo.car_number_passengers == '8인' }">
								<option value="8인" selected>8인</option>
								<option value="5인">5인</option>
								<option value="6인">6인</option>
								<option value="7인">7인</option>
								<option value="9인">9인</option>
								<option value="10인">10인</option>
								<option value="11인">11인</option>
								<option value="12인">12인</option>
							</c:if>
							<c:if test="${vo.car_number_passengers == '9인' }">
								<option value="9인" selected>9인</option>
								<option value="5인">5인</option>
								<option value="6인">6인</option>
								<option value="7인">7인</option>
								<option value="8인">8인</option>
								<option value="10인">10인</option>
								<option value="11인">11인</option>
								<option value="12인">12인</option>
							</c:if>
							<c:if test="${vo.car_number_passengers == '10인' }">
								<option value="10인" selected>10인</option>
								<option value="5인">5인</option>
								<option value="6인">6인</option>
								<option value="7인">7인</option>
								<option value="8인">8인</option>
								<option value="9인">9인</option>
								<option value="11인">11인</option>
								<option value="12인">12인</option>
							</c:if>
							<c:if test="${vo.car_number_passengers == '11인' }">
								<option value="11인" selected>11인</option>
								<option value="5인">5인</option>
								<option value="6인">6인</option>
								<option value="7인">7인</option>
								<option value="8인">8인</option>
								<option value="9인">9인</option>
								<option value="10인">10인</option>
								<option value="12인">12인</option>
							</c:if>
							<c:if test="${vo.car_number_passengers == '12인' }">
								<option value="12인" selected>12인</option>
								<option value="5인">5인</option>
								<option value="6인">6인</option>
								<option value="7인">7인</option>
								<option value="8인">8인</option>
								<option value="9인">9인</option>
								<option value="10인">10인</option>
								<option value="11인">11인</option>
							</c:if>
					</select></td>
				</tr>
				<tr>
					<td>일반 보험</td>
					<td colspan="3"><input type="text" name="car_insurance"
						id="car_insurance" value="${vo.car_insurance}">&nbsp;(원)</td>
				</tr>
				<tr>
					<td>고급 보험</td>
					<td colspan="3"><input type="text" name="car_adv_insurance"
						id="car_adv_insurance" value="${vo.car_adv_insurance}">&nbsp;(원)</td>
				</tr>
				<tr>
					<td>차량 옵션</td>
					<td colspan="3">
						<!-- 옵션이 아무것도 선택되지 않았을 때 --> <c:if test="${vo.car_option == '' }">
							<input type="checkbox" name="car_option" id="car_option"
								value="네비게이션">네비게이션&nbsp;&nbsp; <input type="checkbox"
								name="car_option" id="car_option" value="운전석 에어백">운전석
                     에어백&nbsp;&nbsp; <input type="checkbox"
								name="car_option" id="car_option" value="블랙박스">블랙박스
               </c:if> <!-- 옵션이 1개 선택되어 있었을 때 --> <c:if
							test="${vo.car_option == '네비게이션' }">
							<input type="checkbox" name="car_option" id="car_option"
								value="네비게이션" checked>네비게이션&nbsp;&nbsp; <input
								type="checkbox" name="car_option" id="car_option"
								value="운전석 에어백">운전석 에어백&nbsp;&nbsp;<input
								type="checkbox" name="car_option" id="car_option" value="블랙박스">블랙박스
                        </c:if> <c:if test="${vo.car_option == '운전석 에어백' }">
							<input type="checkbox" name="car_option" id="car_option"
								value="네비게이션">네비게이션&nbsp;&nbsp; <input type="checkbox"
								name="car_option" id="car_option" value="운전석 에어백" checked>운전석 에어백&nbsp;&nbsp;<input
								type="checkbox" name="car_option" id="car_option" value="블랙박스">블랙박스
                        </c:if> <c:if test="${vo.car_option == '블랙박스' }">
							<input type="checkbox" name="car_option" id="car_option"
								value="네비게이션">네비게이션&nbsp;&nbsp; <input type="checkbox"
								name="car_option" id="car_option" value="운전석 에어백">운전석 에어백&nbsp;&nbsp;<input
								type="checkbox" name="car_option" id="car_option" value="블랙박스"
								checked>블랙박스
                        </c:if> <!-- 옵션이 2개 이상 선택되어 있었을 때 --> <c:if
							test="${vo.car_option == '네비게이션,운전석 에어백'}">
							<input type="checkbox" name="car_option" id="car_option"
								value="네비게이션" checked>네비게이션&nbsp;&nbsp; <input
								type="checkbox" name="car_option" id="car_option"
								value="운전석 에어백" checked>운전석 에어백&nbsp;&nbsp;<input
								type="checkbox" name="car_option" id="car_option" value="블랙박스">블랙박스
                     </c:if> <c:if test="${vo.car_option == '네비게이션,블랙박스'}">
							<input type="checkbox" name="car_option" id="car_option"
								value="네비게이션" checked>네비게이션&nbsp;&nbsp; <input
								type="checkbox" name="car_option" id="car_option"
								value="운전석 에어백" checked>운전석 에어백&nbsp;&nbsp;<input
								type="checkbox" name="car_option" id="car_option" value="블랙박스">블랙박스
                     </c:if> <c:if test="${vo.car_option == '운전석 에어백,블랙박스'}">
							<input type="checkbox" name="car_option" id="car_option"
								value="네비게이션" checked>네비게이션&nbsp;&nbsp; <input
								type="checkbox" name="car_option" id="car_option"
								value="운전석 에어백" checked>운전석 에어백&nbsp;&nbsp;<input
								type="checkbox" name="car_option" id="car_option" value="블랙박스">블랙박스
                     </c:if>
					</td>
				</tr>
				<tr>
					<td>이미지</td>
					<td colspan="3"><input type="file" name="file" id="file">
						<span id="imgView">기존 이미지파일명 : ${vo.car_image} <span
							id="imgArea"> </span></span></td>
				</tr>
			</table>
		</form>
	</div>
	<div>
		<input type="button" name="updateBtn" id="updateBtn"
			class="btn btn-primary" value="수정완료"> <input type="button"
			name="listBtn" id="listBtn" class="btn btn-primary" value="목록으로">
	</div>
</div>
