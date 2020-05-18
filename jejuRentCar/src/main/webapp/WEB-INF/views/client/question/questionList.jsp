<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 문의게시판</title>
<link rel="icon" type="image/png" href="../resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<div>
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>
</div>
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

			if ($("#search").val() != 'inq_title') {
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
		$("#q_search").attr({
			"method" : "GET",
			"action" : "/question/qnaboard"
		});
		$("#q_search").submit();
	}
</script>
<style>

.contentss{
background-color: #FFFFFF;
}

.well{
margin:0 auto;
}

.ab:link { color: black; text-decoration: none;}
.ab:visited { color: black; text-decoration: none;}

.mypageMain{
	width: 95%;
	height: 700px;
	align: center;
	margin-left: 6%;
}

.two {
	border: none;
	border: 1px solid gray;
	width: 90%;
	float: left;
}
</style>

<body>
<div class="contentss">

<br> &nbsp;&nbsp;&nbsp;메인페이지 > 후기게시판
		<hr class="one" style="border: none; border: 1px solid gray;">
		<br>
		<div class="mypageMain">

<div class="contentTit">
		<h2 class="sub-header">문의 게시판</h2>
		<hr class="two">
		<br><br>
	</div>
	<div>등록된 질문 : ${total}</div>
	<div style="width:1600px;"><a href="/question/qnainsertform" style="float:right"><button>글작성</button></a></div>
	<br>
	<!-----------------------리스트 시작---------------------------------->
	<br>
	<div id="qnaList" class="table-responsive" style="width:1600px;">
		<table border="1" style="text-align: center;">
			<tr>
				<th id="inq_number" style="width: 80px;">글 번호</th>
				<th id="inq_title" style="width: 900px;">제목</th>
				<th id="mem_name" style="width: 180px;">작성자명</th>
				<th id="mem_id" style="width: 180px;">ID</th>
				<th id="inq_regdate" style="width: 180px;">작성일</th>
				<th id="inq_state" style="width: 100px;">답변 여부</th>
			</tr>
			<c:choose>
				<c:when test="${not empty qnalist}">
					<c:forEach var="row" items="${qnalist}">
						<tr>
                     <td><a class="ab"
                        href="${path}/question/qnaDetail?inq_number=${row.inq_number}">${row.inq_number}</a></td>
                     <td><a class="ab"
                        href="${path}/question/qnaDetail?inq_number=${row.inq_number}">${row.inq_title}</a></td>
                     <td><a class="ab"
                        href="${path}/question/qnaDetail?inq_number=${row.inq_number}">${row.mem_name}</a></td>
                     <td><a class="ab"
                        href="${path}/question/qnaDetail?inq_number=${row.inq_number}">${row.mem_id}</a></td>
                     <td><a class="ab"
                        href="${path}/question/qnaDetail?inq_number=${row.inq_number}">${row.inq_regdate}</a></td>
                     <td><a class="ab"
                        href="${path}/question/qnaDetail?inq_number=${row.inq_number}">${row.inq_state}</a></td>
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
		
		<!-- 검색기능 -->
		<div class="well" align="center">
		<form id="q_search" name="q_search">
			<input type="hidden" id="page" name="page" value="${data1.page}">
			<div>
			<br>
				<div class="form-group" align="center">
					<table>
						<tr>
							<td id="btd1"><label>검색조건</label> <select id="search"
								name="search">
									<option value="inq_title">제목</option>
									<option value="all">전체</option>
							</select>
							<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요." />
							<input type="button" class="btn btn-primary" id="searchData" value="검색" /></td>
						</tr>
					</table>

				</div>
			</div>
		</form>
	</div>
		</div>
	<!-- 페이지 네비게이션 시작 -->
	<div id="boardPage" align="center">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data1.pageSize}" />
	</div>

</div>
</div>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>