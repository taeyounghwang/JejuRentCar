<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: ID찾기 결과</title>
<link rel="icon" type="image/png" href="../resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Yeon+Sung&display=swap" rel="stylesheet">
</head>


<style>

.contentss{
	background-color: #FFFFFF;
	min-height:720px;
}

.two {
	border: none;
	border: 1px solid gray;
	width: 100%;
	float: left;
}
</style>

<body>
<div class="contentss">
<br>
<br>
<div class="icon" align="center">
	<a href="/main"><img src="../resources/images/jejusi.jpg" width="300px" style="margin-left:0px;"></a>
	<label style="font-size:80px; vertical-align:top; margin-left:10px; margin-top:20px; font-family: 'Yeon Sung', cursive;" >
	제주렌터카 ID찾기</label>
	</div>
	<br>
	<hr class="two" align="center"><br><br>

<div align="center" style="margin-top:50px;">
<br>
<br>
<label style="font-size: 50px; font-family: 'Yeon Sung', cursive;">조회된 아이디 입니다.</label>
<table class="table table-bordered">
		<c:choose>
			<c:when test="${not empty id}">
				<c:forEach var="row" items="${id}">
					<tr>
						<td style="font-size: 50px; font-family: 'Jua', sans-serif; text-align: center;">${row.mem_id}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
					<tr>
						<td colspan="6" class="tac">아이디 없음</td>
					</tr>
				</c:otherwise>
		</c:choose>
	</table>

<br>
<a href="/login/form"><label style="font-size: 60px; font-family: 'Yeon Sung', cursive;">로그인</label></a>
<br>
</div>
</div>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>