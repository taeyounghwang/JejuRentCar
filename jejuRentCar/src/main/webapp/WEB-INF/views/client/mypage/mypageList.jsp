<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 마이페이지</title>
<link rel="icon" type="image/png" href="../resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Yeon+Sung&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
</head>
<div>
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>
</div>

<script type="text/javascript">
	$(function(){
		$(".a").click(function(){
			var number = $(this).parent().prev().val();
			$("#rsv").val(number);
			$("#res").attr({
				"action" : "/mypage/detail",
				"method" : "get"
			});
			$("#res").submit();
		});
		
	});
</script>

<style>
.one{
border:none;
border:1px solid gray;
}

.two{
border:none;
border:1px solid gray;
width:80%;
float:left;
}

.mypageMain{
width:95%;
height:700px;
align:center;
margin-left:10%;
}

.table1{
align:center;
margin-left:0%;
}

.button-bar{
align:right;
}

.contentss{
background-color: #FFFFFF;
}
</style>

<body>
<div class="contentss">

<form id="res">
	<input type="hidden" name="rsv_number" id="rsv">
	</form>
<br>
&nbsp;&nbsp;&nbsp;메인페이지 > 마이페이지
<hr class="one">
<br>
<div class="mypageMain">
<h3>나의 예약정보</h3>
<hr class="two">
<br>
<br>
<div class="table1">
	<table border="1">
			<tr>
				<th style="width: 200px">회원 아이디</th>
				<th style="width: 200px">예약자 명</th>
				<th style="width: 200px">차량명</th>
				<th style="width: 200px">예약 날짜</th>
				<th style="width: 200px">대여 기간</th>
				<th style="width: 200px">가격</th>
				<th style="width: 200px">예약상태</th>
				
			</tr>
			<c:if test="${id != null }">
			<c:choose>
				<c:when test="${not empty reservation }">
				<c:forEach	var="res" items="${reservation }">
				<input type="hidden" id="num" value="${res.rsv_number }"/>
					<tr>
						<td class="a">${res.mem_id }</td>
						<td class="a">${res.rsv_name }</td>
						<td class="a">${res.car_name }</td>
						<td class="a">${res.rsv_apply_date }</td>
						<td class="a">${res.rsv_insu }~${res.rsv_bannad }</td>
						<td class="a">${res.rsv_price }</td>
						<c:if test="${res.rsv_state == '반납완료'}">
						<td class="a">${res.rsv_state }<a href="/review/ReviewForm" style="margin-left:40px;">후기 작성</a></td>
						</c:if>
						<c:if test="${res.rsv_state != '반납완료'}">
						<td class="a">${res.rsv_state } </td>
						</c:if>
					</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<td colspan="7">예약내역이 없습니다.</td>
				</c:otherwise>
			</c:choose>
			</c:if>
			<c:if test="${id == null }">
				<td colspan="7">로그인 되어있지 않습니다.</td>
			</c:if>
	</table>
	</div>
	</div>

</div>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>