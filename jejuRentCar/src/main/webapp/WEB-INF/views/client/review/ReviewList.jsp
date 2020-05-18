<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 후기게시판</title>
<link rel="icon" type="image/png" href="../resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<div>
	<jsp:include page="../mainview/header.jsp" />
	<jsp:include page="../mainview/top.jsp" />
</div>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".a").click(function() {
			var number = $(this).parent().prev().val();
			$("#re").val(number);
			$("#rev").attr({
				"action" : "/review/detail",
				"method" : "get"
			});
			$("#rev").submit();
		});

		
	});
	(function () {
	/* 검색 후 검색 대상과 검색 단어 출력*/
	var word = "<c:out value='${data.keyword}'/>";
	var value = "";

	if (word != "") {
		$("#keyword").val("<c:out value='${data.keyword}'/>");
		$("#search").val("<c:out value='${data.search}'/>");

		if ($("#search").val() != 're_title') {
			//:contains()는 특정 텍스트를 포함한 요소반환
				value = "#list tr td.goDetail";
			

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
	$("#r_search").attr({
		"method" : "GET",
		"action" : "/review/list"
	});
	$("#r_search").submit();
}
</script>

<style>
.contentss {
	background-color: #FFFFFF;
}

.one {
	border: none;
	border: 1px solid gray;
}

.two {
	border: none;
	border: 1px solid gray;
	width: 90%;
	float: left;
}

.mypageMain {
	width: 95%;
	height: 700px;
	align: center;
	margin-left: 6%;
}

.table1 {
	margin-left: 0%;
	font-size: 20px;
	text-align: center;
	margin-top:10px;
}

.button-bar {
	float: right;
	margin-right: 365px;
}
</style>

<body>
	<div class="contentss">
		<form id="rev">
			<input type="hidden" name="re_number" id="re">
		</form>
		<br> &nbsp;&nbsp;&nbsp;메인페이지 > 후기게시판
		<hr class="one">
		<br>
		<div class="mypageMain">
			<h3>사용자 후기</h3>
			<hr class="two">
			<br> <br>
			<div align="center">
					<label style="float: left; margin-left:0px; margin:0px; font-size:20px;">등록된 후기 : ${total}</label>
				</div>
				<br>
			<div class="table1" align="left">
				<table border="1">
					<tr>
						<th style="width: 60px">글번호</th>
						<th style="width: 1000px">제목</th>
						<th style="width: 310px">ID</th>
						<th style="width: 250px">작성일</th>
					</tr>
						<%--====================데이터 출력 =============== --%>
						<c:choose>
							<c:when test="${not empty review_board }">
								<c:forEach var="rev" items="${review_board }">
									<input type="hidden" id="num" value="${rev.re_number }" />
									<tr>
										<td class="a">${rev.re_number}</td>
										<td class="a">${rev.re_title}</td>
										<td class="a">${rev.mem_id}</td>
										<td class="a">${rev.re_regdate}</td>
									</tr>
									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<td colspan="7">게시글이 존재하지 않습니다.</td>
							</c:otherwise>
						</c:choose>
					</table>
						<!-- 페이지 네비게이션 시작 -->
				<!-- 검색기능 -->
			<div class="well" align="center">
		<form id="r_search" name="r_search">
			<input type="hidden" id="page" name="page" value="${data.page}">
			<div align="center">
				<br>
				<div class="form-group">
					<table>
						<tr>
							<td id="btd1"><label>검색</label> <select id="search"
								name="search">
									<option value="re_title">제목</option>
							</select> <input type="text" name="keyword" id="keyword"
								placeholder="검색어를 입력하세요." /> <input type="button"
								class="btn btn-primary" id="searchData" value="검색" /></td>
						</tr>
					</table>
					
				</div>
			</div>
		</form>
	</div>
		<div id="boardPage" align="center">
			<tag:paging page="${param.page}" total="${total}"
				list_size="${data.pageSize}" />
		</div>
			</div>
		</div>
	</div>
</body>

<div class="footer">
	<jsp:include page="../mainview/footer.jsp" />
</div>
</html>