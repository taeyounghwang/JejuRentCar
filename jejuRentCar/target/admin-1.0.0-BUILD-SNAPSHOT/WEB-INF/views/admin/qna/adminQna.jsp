<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>

<style type="text/css">
td, th {
	text-align: center;
}
</style>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		/* 검색 후 검색 대상과 검색 단어 출력*/
		var word = "<c:out value='${data.keyword}'/>";
		var value = "";

		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");

			if ($("#search").val() != 'mem_id') {
				//:contains()는 특정 텍스트를 포함한 요소반환
				if ($("#search").val() == 'inq_title')
					value = "#list tr td.goDetail";
				if ($("#search").val() == 'mem_name')
					value = "#list tr td.goDetail";
				else if ($("#search").val() == 'inq_state') {
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
		/* 
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
		 */

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
			"action" : "/admin/qnaboard/qnaboard"
		});
		$("#f_search").submit();
	}
</script>
<div class="contentContainer">
	<div class="contentTit">
		<h2 class="sub-header">문의 게시판</h2>
	</div>
	<div>
		<label> 등록 문의글 :</label> <label style="color: red">${total}</label>
	</div>
	<%--====================리스트 시작 =============== --%>
	<div id="qnaList" class="table-responsive">
		<table class="table table-bordered">
			<tr>
				<th>글 번호</th>
				<th>ID</th>
				<th>작성자명</th>
				<th>제목</th>
				<th>작성일</th>
				<th>답변 여부</th>
			</tr>
			<%--====================데이터 출력 =============== --%>
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a
								href="${path}/admin/qnaboard/qnaDetail?inq_number=${row.inq_number}">${row.inq_number}</a></td>
							<td>${row.mem_id}</td>
							<td>${row.mem_name}</td>
							<td>${row.inq_title}</td>
							<td>${row.inq_regdate}</td>
							<td>${row.inq_state}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6" class="tac">등록된 문의글이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>

		<%-- ======================리스트 종료 ================== --%>
		<%--====================검색기능 시작 =============== --%>
		<div id="carSearch" class="well">
			<form id="f_search" name="f_search">
				<input type="hidden" id="page" name="page" value="${data.page}">
					<div class="form-group">
						<table>
							<tr>
								<td id="btd1"><select id="search" name="search"
									class="form-control">
										<option value="mem_id">ID</option>
										<option value="inq_title">제목</option>
										<option value="mem_name">작성자</option>
										<option value="inq_state">답변여부</option>
										<option value="all">전체리스트</option>
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
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div>
	<%-- =================== 페이지 네비게이션 종료 ==================== --%>
</div>

