<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>

<style type="text/css">
td {
	text-align: center;
}
</style>

<script type="text/javascript" src="/resources/include/js/board.js"></script>
<script type="text/javascript">
	$(function() {
		/* 검색 후 검색 대상과 검색 단어 출력*/
		var word = "<c:out value='${data.keyword}'/>";
		var value = "";

		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");

			if ($("#search").val() != 'rsv_number') {
				//:contains()는 특정 텍스트를 포함한 요소반환
				if ($("#search").val() == 'mem_id')
					value = "#list tr td.goDetail";
				else if ($("#search").val() == 'rsv_name') {
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

		// 정렬 삼각형 클릭 시
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
			"action" : "/admin/refund/reFund"
		});
		$("#f_search").submit();
	}
</script>
<div class="contentContainer">
	<div class="contentTit">
		<h2 class="sub-header">환불 관리</h2>
	</div>

	<div>
		<label> 환불 관리 :</label><label style="color: red">${total}</label>
	</div>
	<%--====================리스트 시작 =============== --%>
	<div class="table-responsive">
		<input type="hidden" id="rsv_number" name="rsv_number"
			value="${vo.rsv_number}" />
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="tac">예약번호</th>
					<th class="tac">회원 ID</th>
					<th class="tac">차량명</th>
					<th class="tac">예약자명</th>
					<th class="tac">예약 신청일</th>
					<th class="tac">환불 상태</th>
					<th class="tac">이용 금액</th>
					<th class="tac">대여 예상 일시</th>
				</tr>
			</thead>
			<tbody>
				<%--====================데이터 출력 =============== --%>
				<c:choose>
					<c:when test="${not empty refundList }">
						<c:forEach var="REFUND" items="${refundList}">
							<tr>
								<td><a
									href="${path}/admin/refund/refundDetail?rsv_number=${REFUND.rsv_number }">${REFUND.rsv_number }</a></td>
								<td>${REFUND.mem_id }</td>
								<td>${REFUND.car_name }</td>
								<td>${REFUND.rsv_name }</td>
								<td>${REFUND.rsv_apply_date }</td>
								<td>${REFUND.rsv_state }</td>
								<td>${REFUND.rsv_price }</td>
								<td>${REFUND.rsv_insu }~${REFUND.rsv_bannad }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="tac">환불 내역이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<%-- ======================리스트 종료 ================== --%>
		<%--====================검색기능 시작 =============== --%>
		<div class="well">
			<form id="f_search" name="f_search">
				<input type="hidden" id="page" name="page" value="${data.page}">
				<input type="hidden" id="order_by" name="order_by"
					value="${data.order_by}" /> <input type="hidden" id="order_sc"
					name="order_sc" value="${data.order_sc}" />
				<div class="form-group">
					<table>
						<tr>
							<td id="btd1"><select class="form-control" id="search"
								name="search">
									<option value="rsv_number">예약번호</option>
									<option value="mem_id">회원ID</option>
									<option value="rsv_name">예약자명</option>
									<option value="all">전체</option>
							</select></td>
							<td>&nbsp;&nbsp;&nbsp;</td>
							<td><input type="text" name="keyword" id="keyword"
								placeholder="검색어를 입력하세요." /> <input type="button"
								class="btn btn-primary" id="searchData" value="검색" /></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
	<%--====================검색기능 종료 =============== --%>
	<%-- =================== 페이지 네비게이션 시작 =================== --%>
	<div id="boardPage">
		<tag:paging page="${param.page }" total="${total }" list_size="10" />
	</div>
	<%-- =================== 페이지 네비게이션 종료 ==================== --%>
</div>