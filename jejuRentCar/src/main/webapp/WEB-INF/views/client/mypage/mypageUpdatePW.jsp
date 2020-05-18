<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 내 정보 수정</title>
<link rel="icon" type="image/png" href="../resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Yeon+Sung&display=swap" rel="stylesheet">
<script src="code.jquery.com/jquery-3.1.1.min.js"></script>

</head>
<div>
<jsp:include page="../mainview/header.jsp" />
<jsp:include page="../mainview/top.jsp" />
</div>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {

		   // 로그인 버튼 클릭 시 처리 이벤트
		$("#updateBtn").click(function() {
			var update = {
					mem_id : $("#mem_id").val(),
					mem_password : $("#mem_password").val()
				};
			$.ajax({
				url : "/mypage/update",
				type : "post",
				data : update,
				error : function() {
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다.잠시 후 다시 시도해 주세요.');
				},
				success : function(resultData) {
					if (resultData == 1) {
						alert("입력하신 비밀번호가 일치 하지않습니다.");
					} else if (resultData == 2) {
						alert("비밀번호가 일치 합니다. 내정보 수정 페이지로 이동합니다.");
						location.href = "/mypage/mypageUpdate";
					}
				}
			});
		});
	});
</script>

<style>

.pwchk{
	height:400px;
	margin-top:50px;
}

</style>


<body>
<br>
	<div class="pwchk" align="center">
		<c:set var="loginid" value="${sessionScope.ClientLogin.mem_id}"></c:set>
		<input type="hidden" id="mem_id" name="mem_id"
			value="${sessionScope.ClientLogin.mem_id}" readonly="readonly">
		<h1>정보 수정을 위해 비밀번호를 다시한번 입력해주세요.</h1>
		<br>
		<br> 
		<br>
		<br> 
		<br>
		비밀번호 확인 : <input type="password" id="mem_password" name="mem_password">
		<br> 
		<br>
		<input type="button" value="수정하기" id="updateBtn"
			class="btn btn-primary">
	</div>
</body>
<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>