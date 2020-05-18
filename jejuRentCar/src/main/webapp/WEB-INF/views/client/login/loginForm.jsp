<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>제주렌터카 :: 로그인</title>
		<link rel="icon" type="image/png" href="../resources/images/favicon.png">
		<link rel="stylesheet" href="../resources/css/loginstyle.css">
		<link href="https://fonts.googleapis.com/css2?family=Jua&family=Yeon+Sung&display=swap" rel="stylesheet">
		<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
   $(function() {
      
   // 로그인 버튼 클릭 시 처리 이벤트
		$("#memberLoginBtn").click(function() {
			var query = {
					mem_id : $("#mem_id").val(),
					mem_password : $("#mem_password").val()
				};
			$.ajax({
				url : "/login/goin",
				type : "post",
				data : query,
				error : function() {
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다.잠시 후 다시 시도해 주세요.');
				},
				success : function(resultData) {
					if (resultData == 1) {
						alert("아이디/비밀번호를 확인해 주세요");
					} else if (resultData == 2) {
						alert("비활성화된 아이디 입니다.");
					} else if (resultData == 0){
						location.href = "/main";
					}
				}
			});
		});
		// 회원가입 버튼 클릭 시 처리 이벤트
		$("#memberformBtn").click(function() {
			 location.href = "/member/form";
		});
		
		// 아이디 비밀 번호 찾기 클릭 시 처리 이벤트
		$("#idpwfind").click(function(){
			location.href = "/login/idpwfind";
		});
      
   });
   
</script>
</head>

<style>
/*  a:link {  text-decoration: none;}
 a:visited {  text-decoration: none;}
 a:hover {  text-decoration: underline;} */
</style>

<body>
		<section class="login-form">
			<!-- <a href="/main" class="labelabc"></a> -->
			<label style="font-family: 'Yeon Sung', cursive; font-size: 80px; color: #FFFFFF; margin-left:50px;">제주렌터카</label>
			
			<form id="loginForm">
				<div class="int-area" style="margin-top:35px;">
					<input type="text" name="mem_id" id="mem_id"
					autocomplete="off" required>
					<label for="mem_id">USER NAME</label>
				</div>
				<div class="int-area">
					<input type="password" name="mem_password" id="mem_password"
					autocomplete="off" required>
					<label for="mem_password">PASSWORD</label>
				</div>
				<div class="btn-area">
					<input type="button" value="로그인" id="memberLoginBtn"/>
				</div>
			</form>
			<div class="caption">
				<a href="/login/idpwfind">아이디 혹은 비밀번호를 잊으셨나요?</a>
			</div>
		</section>
</body>
</html>