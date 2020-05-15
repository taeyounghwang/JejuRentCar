<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		//등록 버튼 클릭시
		$("#insertBtn").click(function() {
			//입력값 체크
			if (!chkSubmit($('#car_name'), "차량명을"))
				return;
			else if (!chkSubmit($("#car_price"), "대여가격을"))
				return;
			else if (!chkSubmit($("#car_stick"), "스틱옵션을"))
				return;
			else if (!chkSubmit($("#car_fuel"), "연료옵션을"))
				return;
			else if (!chkSubmit($("#car_number_passengers"), "최대승차인원을"))
				return;
			else if (!chkSubmit($("#car_insurance"), "일반보험을"))
				return;
			else if (!chkSubmit($("#car_adv_insurance"), "고급보험을"))
				return;
			else if (!chkSubmit($("#car_option"), "차량옵션을"))
				return;
			else {
				if ($('#file').val() != "") {
					if (!chkFile($("#file")))
						return;
				} else {
					alert("이미지를 등록해주세요");
					return false;
				}
				if (confirm("등록하시겠습니까?") == true) {
					$("#listInsert").attr({
						"method" : "POST",
						"action" : "/admin/carlist/carListInsert"
					})
					alert("등록되었습니다.")
					$("#listInsert").submit();

				} else {
					alert("취소되었습니다.");
					location.href = "/admin/carlist/carList";
				}
			}
		})

		//목록 버튼 클릭 시
		$("#listBtn").click(function() {
			if (confirm("저장하지 않고 목록으로 돌아가시겠습니까?")) {
				alert("목록으로 돌아갑니다");
				location.href = "/admin/carlist/carList";
			} else {
				alert("취소되었습니다.");
				location.href = "redirect:/admin/carlist/carListInsertForm";
			}
		})
	})
</script>
</head>

<div>
	<div>
		<h2 class="sub-header">차량 등록</h2>
	</div>
	<div class="table-responsive">
		<form id="listInsert" name="listInsert" enctype="multipart/form-data">
			<table border="1" class="table table-bordered" style="width: 700px">
				<tr>
					<td>차량명</td>
					<td><input type="text" name="car_name" id="car_name"></td>
				</tr>
				<tr>
					<td>대여가격</td>
					<td><input type="text" name="car_price" id="car_price">&nbsp;(원)</td>
				</tr>
				<tr>
					<td>스틱옵션</td>
					<td><input type="radio" name="car_stick" id="car_stick"
						value="오토" checked>오토</td>
				</tr>
				<tr>
					<td>연료옵션</td>
					<td><label><input type="radio" name="car_fuel"
							id="car_fuel1" value="휘발유" checked>휘발유</label>
						&nbsp;&nbsp;&nbsp;&nbsp;<label><input type="radio"
							name="car_fuel" id="car_fuel" value="전기">전기</label></td>
				</tr>
				<tr>
					<td>최대 승차 인원</td>
					<td><select name="car_number_passengers"
						id="car_number_passengers">
							<option value="5인">5인</option>
							<option value="6인">6인</option>
							<option value="7인">7인</option>
							<option value="8인">8인</option>
							<option value="9인">9인</option>
							<option value="10인">10인</option>
							<option value="11인">11인</option>
							<option value="12인">12인</option>
					</select></td>
				<tr>
					<td>일반 보험</td>
					<td><input type="text" name="car_insurance" id="car_insurance">&nbsp;(원)</td>
				<tr>
					<td>고급 보험</td>
					<td><input type="text" name="car_adv_insurance"
						id="car_adv_insurance">&nbsp;(원)</td>
				</tr>
				<tr>
					<td>차량 옵션</td>
					<td><label><input type="checkbox" name="car_option"
							id="car_option" value="운전석 에어백" checked>운전석에어백</label>&nbsp;&nbsp;&nbsp;&nbsp;<label><input
							type="checkbox" name="car_option" id="car_option" value="네비게이션">네비게이션</label>&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp; <label><input type="checkbox"
							name="car_option" id="car_option" value="블랙박스">블랙박스</label></td>
				</tr>
				<tr>
					<td>이미지 업로드</td>
					<td><input type="file" name="file" id="file"></td>
				</tr>
			</table>
		</form>
	</div>
	<div>
		<input type="button" name="insertBtn" id="insertBtn"
			class="btn btn-primary" value="등록"> &nbsp; <input
			type="button" name="listBtn" id="listBtn" class="btn btn-primary"
			value="목록으로">
	</div>
</div>

