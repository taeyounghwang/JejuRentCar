<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		// 첨부파일 이미지 보여주기 위한 속성 추가
		/* 		var file = "<c:out value = '${vo.car_image}'/>";
		 if(file != ""){ */
		$("#fileImage").attr({
			src : "/uploadStorage/carList/${vo.car_image}",
			width : "450px",
			height : "200px"
		})
		/* 	} */
		//목록으로 버튼 클릭 시
		$("#carListBtn").click(function() {
			location.href = "/admin/carlist/carList";
		})
		//수정하기 버튼 클릭 시
		$("#updateBtn").click(function() {
			if (confirm("수정하시겠습니까?") == true) {
				$("#detail").attr({
					"method" : "POST",
					"action" : "/admin/carlist/carListUpdateForm"
				})
				$("#detail").submit();
			} else {
				alert("취소되었습니다.");
				location.href = "/admin/carlist/carList";
			}
		})

		//삭제하기 버튼 클릭 시
		$("#deleteBtn").click(function() {
			if (confirm("삭제하시겠습니까?") == true) {
				$("#detail").attr({
					"method" : "POST",
					"action" : "/admin/carlist/carLsitDelete"
				})
				alert("삭제되었습니다.");
				$("#detail").submit();
			} else {
				alert("취소되었습니다.");
				location.href = "/admin/carlist/carList";
			}
		})
	});
</script>
<div class="contetnContainer">
	<h2 class="sub-header">차량 상세 정보 조회</h2>
	<div class="table-responsive">
		<form id="detail" name="detail" method="post">
			<input type="hidden" id="car_model_number" name="car_model_number"
				value="${vo.car_model_number}" /> <input type="hidden"
				name="car_image" id="car_image" value="${vo.car_image}" />
		</form>
		<table class="table table-bordered">
			<tr>
				<td>모델 고유번호</td>
				<td>${vo.car_model_number}</td>
				<td>등록일</td>
				<td>${vo.car_registe_date}</td>

			</tr>
			<tr>
				<td>차량명</td>
				<td colspan="3">${vo.car_name}</td>
			</tr>
			<tr>
				<td>대여가격</td>
				<td colspan="3">${vo.car_price}</td>
			</tr>
			<tr>
				<td>스틱옵션</td>
				<td colspan="3">${vo.car_stick}</td>
			</tr>
			<tr>
				<td>연료옵션</td>
				<td colspan="3">${vo.car_fuel}</td>
			</tr>
			<tr>
				<td>최대 승차 인원</td>
				<td colspan="3">${vo.car_number_passengers}</td>
			</tr>
			<tr>
				<td>일반 보험</td>
				<td colspan="3">${vo.car_insurance}&nbsp;(원)</td>
			</tr>
			<tr>
				<td>고급 보험</td>
				<td colspan="3">${vo.car_adv_insurance}&nbsp;(원)</td>
			</tr>
			<tr>
				<td>차량 옵션</td>
				<td colspan="3">${vo.car_option}</td>
			</tr>
			<c:if test="${vo.car_image != ''}">
				<tr>
					<td>이미지</td>
					<td colspan="3"><img id="fileImage">${vo.car_image}</td>
				</tr>
			</c:if>
		</table>
		<div>
			<input type="button" value="목록으로" id="carListBtn"
				class="btn btn-primary"> <input type="button" value="수정하기"
				id="updateBtn" class="btn btn-primary"> <input type="button"
				value="삭제하기" id="deleteBtn" class="btn btn-primary">
		</div>

	</div>
</div>
