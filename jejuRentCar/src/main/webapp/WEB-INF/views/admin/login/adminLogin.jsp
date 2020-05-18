<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuRentCar 관리자 로그인 페이지</title>
<link rel="stylesheet" href="/resources/css/styles.css" />

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#loginBtn").click(function() {
			$("#adminLogin").attr({
				"method" : "POST",
				"action" : "/admin/login"
			});
			$("#adminLogin").submit();

			var admin_id = $("#admin_id").val();
			var admin_pw = $("#admin_pw").val();

			if (admin_id != "admin" || admin_pw != "1234") {
				alert("아이디 또는 비밀번호가 잘못 입력되었습니다. 다시 입력해주세요!");
			}

			if (admin_id == "" || admin_pw == "") {
				alert("아이디와 비밀번호를 모두 입력해주세요!");
			}

		})

	})
</script>
</head>
<body class="gray-bg">
	<div id="container">
		<div id="body">
			<div class="form-box login-box">
				<div class="inner">
					<div class="title">
						<span class="blue">JEJU RENTCAR</span> <span class="black">관리자</span>
					</div>
					<span class="sub-title">로그인 정보를 입력하세요.</span>
					<form id="adminLogin">
						<input id="admin_id" type="text" name="admin_id" placeholder="아이디"
							autofocus />
						<div class="txt-warning"></div>
						<input id="admin_pw" type="password" name="admin_pw"
							placeholder="비밀번호" />
						<div class="txt-warning"></div>
						<button type="submit" id="loginBtn">로그인</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>