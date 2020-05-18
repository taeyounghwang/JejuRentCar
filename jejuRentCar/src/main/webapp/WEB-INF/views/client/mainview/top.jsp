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
	
<style>
*{
	font-family: 'Jua', sans-serif;
}

.navig-menu{
	margin: 0;
	padding: 0;
	
}

body{
	background: #282828;
}

.navig-menu{
	display: flex;
	justify-content: space-around;
	align-items: center;
	height: 5vh;
	margin-left: 20%;
	margin-right: 20%;	
	height: 48px;
}
.navig-menu a{
	font-size: 24px;
	color: #fff;
	text-decoration: none;
	position: relative;
	padding: 6px 12px;
}
.navig-menu a::after{
	content: "";
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 0;
	height: 4px;
	background: #4374D9;
	transition: all .5s ease-out;
}
.navig-menu a:hover::after{
	width: 100%;
}
</style>
<body>

<nav class="navig-menu">
		<a href="/intro">소개</a>
		<a href="/car/List">예약</a>
		<a href="/review/list">후기</a>
		<a href="/question/qnaboard">문의</a>
		<a href="/notice/list">공지</a>
	</nav>
</body>

