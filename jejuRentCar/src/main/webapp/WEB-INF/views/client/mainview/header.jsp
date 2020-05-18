<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<meta charset="UTF-8">
	<link rel="icon" href="http://bootstrapk.com/examples/carouse1/favicon.ico">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Yeon+Sung&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<head>
<style>
*{
	font-family: 'Jua', sans-serif;
}
img{
	display:block:
}
.mainheader{
	background-color: #FFFFFF;
	height: 160px;
	width: 100%;
	margin-top: 0px;
}

.loginSection{
	float: right;
	margin-right: 3%;
	margin-top: 15px;
}

</style>
</head>
	<script type="text/javascript">
		
	$(function() {
		// 로그인 버튼 클릭 시 처리 이벤트
		$("#loginBtn").click(function() {
		 	location.href = "/login/form";
		});
		
	});
	
	$(function() {
		// 회원가입 버튼 클릭 시 처리 이벤트
		$("#memberBtn").click(function() {
		 	location.href = "/member/form";
		});
		
	});
	
	</script>
	
	<script src="js/ie-emulation-modes-warning.js"></script>
	<body>
	<div class="mainheader">
	
	<div style="margin-top:15px; margin-left:30px; width:301px; display: inline-block; vertical-align: top;">
	<a href="/main"><img src="../resources/images/jejusi.jpg" width="300px"></a>
	</div>
	<div style="display: inline-block; width:300px; vertical-align: top;" align="left">
	<label style="font-size:80px; margin-top:20px; font-family: 'Yeon Sung', cursive;" >제주렌터카</label>
	</div>
	
	<div class="loginSection">
	<c:if test="${id == null}">
    <legend><strong style="color: #000000; font-size:30px; ">로그인이 필요합니다.</strong></legend>
    <div class="buttons1" align="center">
    <button class="btn btn-outline-success" type="button" id="loginBtn">로그인</button>
    <button class="btn btn-outline-success" type="button" id="memberBtn">회원가입</button>
    </div>
    </c:if>
	<c:set var="loginname" value="${sessionScope.ClientLogin.mem_name}"/>
			<input type="hidden" value="${ loginname }" id="mem_name" name="mem_name">
    <c:if test="${id != null}">
    
    <div align="center">
   	 <label style="color: #000000; font-size: 35px; margin: 0 auto; vertical-align:bottom; font-weight: bold;">${loginname} 님 반갑습니다.</label><br>
   	 <label style="color: #5D5D5D; font-size: 20px; margin-top:0px; margin:0px; vertical-align: top;">ID : (${id})</label>
   	 </div>
   	 
   	 <div class="buttons2" align="center" style="margin-top:5px;">
   	 <a href="/mypage/list"><button class="btn btn-outline-success" type="button" id="mypageBtn">마이페이지</button></a> &nbsp;
   	 <a href="/mypage/updatepw"><button class="btn btn-outline-success" type="button" >내 정보 수정</button></a>&nbsp;
   	 <a href="/login/logout"><button class="btn btn-outline-success" type="button" id="loginBtn">로그아웃</button></a>
   	 </div> 
   	 </c:if>
   	 </div>
	</div>
</body>