<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 차량리스트</title>
<link rel="icon" type="image/png" href="../resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<script src="code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<div>
<jsp:include page="../mainview/header.jsp" />
<jsp:include page="../mainview/top.jsp" />
</div>

<script type="text/javascript">
	$(function() {

		/*제목/이미지 클릭시 상세 페이지로 이동을 위한 처리 이벤트*/
		$(".goDetail").click(function() {
			var CAR_NAME = $(this).parents("div").attr("data-value");
			$("#car_model_number").val(CAR_NAME);
			console.log("차량명 :" + CAR_NAME);
			console.log("차량명 :" + CAR_NAME);
			//상세 페이지 로 이동하기 위해 form 추가 (id:carDetail);
			$("#carDetail2").attr({
				"method" : "GET",
				"action" : "/car/Detail"
			});

			$("#carDetail2").submit();
		});

		/* 검색 후 검색 대상과 검색 단어 출력*/
		var word = "<c:out value='${data.keyword}'/>";
		var value = "";

		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");

			if ($("#search").val() != 'car_name') {
				//:contains()는 특정 텍스트를 포함한 요소반환
				if ($("#search").val() == 'car_option')
					value = "#list tr td.goDetail";
				else if ($("#search").val() == 'car_fuel') {
					value = "#list tr td.name";
				}

				$(value + ":contains('" + word + "')").each(
						function() {
							var regex = new RegExp(word, 'gi');
							$(this).html(
									$(this).text().replace(
											regex,
											"<span class='required'>" + word
													+ "</span>"));
						});
			}
		}

		/* 한페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로 유지하기 위한 설정 */
		if ("<c:out value='${data.pageSize}' />" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}' />");
		}

		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("전체 데이터 조회합니다.");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		})

		/* 검색 버튼 클릭 시 처리 이벤트 */
		$("#searchData").click(function() {
			if ($("#search").val() != "all") {
				if (!chkSubmit($("#keyword"), "검색어를"))
					return;
			}
			goPage(1);
		});

		// 정렬 삼각형 버튼 클릭 시
		$(".order").click(function() {
			var order_by = $(this).attr("data-value");
			console.log("선택값 : " + order_by);

			$("#order_by").val(order_by);
			if ($("#order_sc").val() == 'DESC') {
				$("#order_sc").val('ASC')
			} else {
				$("#order_sc").val('DESC')
			}
			goPage(1);
		});

		/* 한 페이지에 보여줄 레코드 수 변결될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
		});

	});

	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수 */
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "GET",
			"action" : "/car/List"
		});
		$("#f_search").submit();
	}
</script>

<style>

.contentss {
	background-color:#FFFFFF;
	min-height: 600px;
}

.panel-danger{
	width: 350px;
	height: 300px;
	border: 2px solid #aaa;
	border-radius: 4px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	display: inline-block;
	margin-left: 30px;
	background-color: #D5D5D5;
	
}

.panel-body{
width:330px;
height:220px;
background-color:#FFFFFF;
}

.carformList{
	width:1200px;
}
.imagebox{
	margin-top:0px;
	border: 2px solid #aaa;
	border-radius: 4px;
	
}
</style>

<body>
<div class="contentss" align="center">

<br>
	<%
		String id = (String) session.getAttribute("id");

		//로그인이 되어있지 않다면,
		if (id == null) {
			id = "GUEST";
		} else {
			id = (String) session.getAttribute("id");
		}
	%>
	<!-- 상세페이지 이동을 위한 폼 -->
	<form name="carDetail2" id="carDetail2">
		<input type="hidden" id="car_model_number" name="car_model_number">
	</form>


	<%--====================검색기능 시작 =============== --%>
	<div id="boardSearch" align="center">
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="1" /> <input
				type="hidden" id="order_by" name="order_by" value="${data.order_by}" />

			<input type="hidden" id="order_sc" name="order_sc"
				value="${data.order_sc}" />
			<table summary="검색">
				<colgroup>
					<col width="70%"></col>
					<col width="30%"></col>
				</colgroup>
				<tr>
				
					<td id="btd1"><label style="font-size: 30px;">검색&nbsp;</label> 
					<select id="search" name="search" style="width:100px; height:35px;">
							<option value="all">전체</option>
							<option value="car_name">차량 이름</option>
							<option value="car_option">옵션</option>
							<option value="car_fuel">연료</option>
							
					</select> 
					<input type="text" name="keyword" id="keyword" class="fa fa-search" placeholder="검색할 내용을 입력해주세요" style="width:300px; height:35px;"/>
						<input type="button" value="검색" id="searchData" style="width:50px; height:35px;"/></td>
				</tr>
			</table>
		</form>
	</div>
	<%--====================검색기능 종료 =============== --%>
		<%--====================차량 리스트를 시작점 =================================--%>
			<div class="con" align="center">
			<c:choose>
				<c:when test="${not empty carList}">
					<c:forEach var="car" items="${carList}" varStatus="status">
						
							<div class="panel-danger"
								data-value="${car.car_model_number}">
								<div class="goDetail panel-heading" style="height:38px; vertical-align:top; margin-top:15px;">
									<label style="font-size:25px;">${car.car_name}</label>
								</div>
							<div class="imagebox goDetail" style="vertical-align: middle; margin-top:15px; background-color: #FFFFFF;">
								<img src="/uploadStorage/carList/${car.car_image}"  width="320px" height="150px" id="fileImage">
							</div>
								<div class="panel-footer goDetail"><label style="font-size:25px; margin-top:10px;">대여료 : ${car.car_price} 원</label></div>
						</div>

					</c:forEach>
				</c:when>
				<c:otherwise>
					<div>
						<div class="panel panel-danger">
							<div class="panel-heading">현재 등록된 차량이 없습니다..</div>
							<div class="panel-body">
								<img src="/resources/images/car/차량없음.jpg">
							</div>

							<div class="panel-footer">차량없음</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
	</div>
	</div>

</body>
<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>