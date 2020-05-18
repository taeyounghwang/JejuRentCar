<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: ID/PW 찾기</title>
<link rel="icon" type="image/png" href="resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">


</head>

<div>
<jsp:include page="../mainview/header.jsp"/>
<jsp:include page="../mainview/top.jsp"/>
</div>

<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {

		// 아이디 찾기 버튼 클릭 시 처리
		$("#idfindbtn").click(function() {
			var query = {
				mem_name : $("#mem_name").val(),
				mem_cellphone : $("#mem_cellphone").val()
			};
			$.ajax({
				url : "/login/idfind",
				type : "post",
				data : query,
				error : function() {
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다.잠시 후 다시 시도해 주세요.');
				},
				success : function(resultData) {
					console.log("resultData : " + resultData);
					if (resultData == "1") {
						alert("입력 하신 이름,핸드폰번호로 찾은 아이디가 없습니다. 회원가입을 하셔야 합니다.");
						return false;
					} else if (resultData == "2") {
						alert("아이디 찾기 결과 페이지로 이동합니다.");
						$("#idfindform").attr({
							"action" : "/login/idresult",
							"method" : "post"
						});
						$("#idfindform").submit();
					}
				}
			});
		});

		// 회원가입 버튼 클릭 시 처리 이벤트
		$("#memberformBtn").click(function() {
			location.href = "/member/form";
		});

		// 비밀번호 찾기 버튼 클릭 시 처리
		$("#pwfindbtn").click(function() {
			var query1 = {
				mem_id : $("#mem_id").val()
			};
			$.ajax({
				url : "/login/pwfind",
				type : "post",
				data : query1,
				error : function() {
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다.잠시 후 다시 시도해 주세요.');
				},
				success : function(resultData) {
					if (resultData == "1") {
						alert("입력하신 아이디의 임시 비밀번호가 설정되어 메일을 발송 하였습니다.");
						return false;
					} else if (resultData == "2") {
						alert("존재하지 않는 아이디입니다. 회원가입을 하셔야 합니다.");
						return false;
					}
				}
			});
		});

	});
</script>

<style>

.contentss{
	background-color: #FFFFFF;
	min-height: 510px;
}

.one {
	border: none;
	border: 1px solid gray;
	width: 500px;
	align:center;
}

.two {
	border: none;
	border: 1px solid gray;
	width: 90%;
	float: left;
}

</style>

<body>
	<div class="contentss" align="center">
<br>
<h1>아이디 / 패스워드 찾기</h1>
<div align="center">
<hr class="two" style="border: none; border: 1px solid gray; margin-left:100px;">
</div>
<br>
<br>
<div class="idsection" align="center">
<form id="idfindform">
		<table>
			<tr>
				<td align="center"><label style="margin-left:10px; font-size: 35px;">아이디 찾기</label> <br></td>
			</tr>
			<tr>
				<td><label>이 름</label> <input type="text" id="mem_name"
					name="mem_name" placeholder="가입 시 작성하신 이름" autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<td><label>전화번호</label> <input type="text" id="mem_cellphone"
					name="mem_cellphone" placeholder="가입 시 작성하신 전화번호"></td>
			</tr>
			<tr align="center">
				<td><input type="button" id="idfindbtn" value="ID찾기"> <input
					type="button" id="memberformBtn" value="회원가입"></td>
			</tr>
		</table>
	</form>
	</div>
	<hr class="one">
	<div class="pwsection" align="center">
	<form id="pwfindform">
		<table>
			<tr>
				<td align="center"><label style="margin-left:10px; font-size: 35px;">비밀번호 찾기</label> <br></td>
			</tr>
			<tr>
				<td><label>아이디</label> <input type="text" id="mem_id"
					name="mem_id" placeholder="가입 시 작성하신 아이디"></td>
			</tr>
			<tr>
				<td align="center"><input type="button" id="pwfindbtn" value="PW찾기"></td>
			</tr>
		</table>
	</form>
	</div>

</div>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>

</html>