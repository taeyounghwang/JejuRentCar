<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 내 정보 수정</title>
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

		// 선언부
		var id = $("#mem_id").val();
		var pw = $("#mem_password").val();
		var birthday = $("#mem_birthday").val();
		var name = $("#mem_name").val();
		var cellphone = $("#mem_cellphone").val();
		var qeustion = $("#mem_question").val();
		var answer = $("#mem_answer").val();

		// 정규식 관련 선언
		var r1 = /\d/; // 숫자 0~9 까지의 문자 클래스
		var r2 = /\W/; // 영문자와 숫자를 제외한 모든 문자
		var r3 = "~!@#$%^&*()_+|\?:\"'<>,.()[]{};";
		var r4 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //id 이메일 정규식
		var r5 =/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/; // 핸드폰 번호 정규식

		
		
		check = false;

		// 아이디 이메일 형식 체크
		$("#mem_id").blur(function() {
			if (r4.test($("#mem_id").val())) {
				$("#id_check").text("");
			} else {
				$("#id_check").text("아이디는 8~50자리의 이메일 형식 이어야 합니다.");
				$("#id_check").css("color", "red");
				return false;
			}
			
		});
		
		// 비밀번호를 8글자 이하로 쳤을 경우
		$("#mem_password").blur(function() {
			if ($("#mem_password").val().length >= 8) {
				$("#pw_check").text("");
			} else {
				$("#pw_check").text("비밀번호는 8글자 이상 작성 하셔야합니다.");
				$("#pw_check").css("color", "red");
				return false;
			}
		});

		// 비밀번호와 비밀번호 확인란이 같은지 체크
		$("#passwordCheck").blur(function() {
			if ($("#mem_password").val() == $("#passwordCheck").val()) {
				$("#pwCheckText").text("");
			} else {
				$("#pwCheckText").text("비밀번호와 비밀번호확인란이 일치 하지 않습니다.");
				$("#pwCheckText").css("color", "red");
				return false;
			}
		});
		
		

		// 회원가입 버튼 클릭 시 처리 이벤트
		$("#memberUpdateBtn")
				.click(
						function() {
							// 선언부
							var id = $("#mem_id").val();
							var pw = $("#mem_password").val();
							var birthday = $("#mem_birthday").val();
							var name = $("#mem_name").val();
							var cellphone = $("#mem_cellphone").val();
							var qeustion = $("#mem_question").val();
							var answer = $("#mem_answer").val();

							// 정규식 관련 선언
							var r1 = /\d/; // 숫자 0~9 까지의 문자 클래스
							var r2 = /\W/; // 영문자와 숫자를 제외한 모든 문자
							var r3 = "~!@#$%^&*()_+|\?:\"'<>,.()[]{};";
							var r4 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //id 이메일 정규식
							var r5 =/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/; // 핸드폰 번호 정규식
							
							check = false;

							// ajax로 폼의 속성들을 포스트 방식으로 컨트롤러에 전달
							$("#memberjoinForm").attr({
								"method" : "POST",
								"action" : "/mypage/infoUpdate"
							});

							// 아이디 미 입력 시
							if ($("#mem_id").val() == "") {
								alert("아이디를 입력해주시기 바랍니다.");
								$("#mem_id").focus();
								return false;
							}

							// 아이디 이메일 정규식
							if (id.match(r4) == null) {
								alert("아이디는 이메일 형식이여야 합니다.");
								return false;
							}

							// 아이디 글자 수 제한 8
							if (id.length <= 8) {
								alert("아이디 형식이 맞지 않습니다.");
								return false;
							}

							// 비밀번호 글자 수 제한 8
							if (pw.length < 8) {
								alert("비밀번호 형식이 맞지 않습니다.");
								return false;
							}

							// 비밀번호 미 입력 시
							if ($("#mem_password").val() == "") {
								alert("비밀번호를 입력해주시기 바랍니다.");
								$("#mem_password").focus();
								return false;
							}

							// 비밀번호 확인 미 입력 시
							if ($("#passwordCheck").val() == "") {
								alert("비밀번호 확인을 입력해주시기 바랍니다.");
								$("#passwordCheck").focus();
								return false;
							}

							// 비밀번호와 비밀번호 확인란이 다를 경우
							if ($("#mem_password").val() != $("#passwordCheck")
									.val()) {
								alert("비밀번호와 비밀번호 확인 란이 같지 않습니다.");
								return false;
							}

							// 이름 미 입력 시
							if ($("#mem_name").val() == "") {
								alert("이름을 입력해주시기 바랍니다.");
								$("#mem_name").focus();
								return false;
							}

							// 이름에 숫자나 특수 문자 입력 불가
							for (var i = 0; i < name.length; i++) {
								var c = name.charAt(i);
								if (r3.search(c) >= 0 || c.search(r1) >= 0) { // 찾지 못하였을 때 반환 하는 값 : -1
									check = true;
									break;
								}
							}

							// 이름에 특수문자나 숫자가 들어간 경우
							if (check) {
								alert("이름은 문자만 입력하셔야 합니다.");
								$("#mem_name").focus();
								return false;
							}

							// 생일 미 입력 시
							if ($("#mem_birthday").val() == "") {
								alert("생일을 입력해주시기 바랍니다.");
								$("#mem_birthday").focus();
								return false;
							}

							// 아이디에 비밀번호 포함 여부 확인
							if (pw.indexOf(id) > -1) {
								alert("비밀번호에 아이디를 포함할 수 없습니다.");
								$("#mem_password").val("");
								$("#passwordCheck").val("");
								$("#mem_password").focus();
								return false;
							}

							// 핸드폰 번호를 11자리 이하로 입력했을때
							if (cellphone.length > 11) {
								alert("핸드폰 번호는 11자리로 입력하셔야합니다.");
								$("#mem_cellphone").focus();
								return false;
							}
							
							// 핸드폰 번호 정규식 체크
							if (cellphone.match(r5) == null){
								alert("핸드폰 번호의 형식이 맞지 않습니다. 다시입력해주세요");
								$("#mem_cellphone").focus();
								return false;
							}

							// 서브밋
							$("#memberjoinForm").submit();
						});
	});
</script>

<style>

.contentss{
	background-color: #FFFFFF;
	min-height: 510px;
}

</style>

<body>
<div class="contentss" align="center" style="text-align: center;">
<br>
<br>
<h1>회원 정보 수정</h1>
<br>

<form id="memberjoinForm" style="text-align: center;">
		<div>
			<label>아이디</label>
			<c:set var="loginid" value="${sessionScope.ClientLogin.mem_id}"></c:set>
			 <input type="text" id="mem_id" name="mem_id"
				placeholder="exam@naver.com 8~50글자" required="required"
				maxlength="50" autofocus="autofocus" size="50" readonly="readonly" value="${sessionScope.ClientLogin.mem_id}" style="max-width:300px;">
		</div>
		<div>
			<label>비밀번호</label> <input type="password" id="mem_password"
				name="mem_password" placeholder="영문/숫자 포함 8~20자" required="required"
				maxlength="20">
		</div>
		<div id="pw_check"></div>
		<div>
			<label>비밀번호 확인</label> <input type="password" id="passwordCheck"
				name="passwordCheck" placeholder="비밀번호 재입력" required="required"
				maxlength="20">
		</div>
		<div id="pwCheckText"></div>
		<div>
			<label>이름</label> <input type="text" id="mem_name" name="mem_name"
				required="required" placeholder="한글/영어 30자" maxlength="30">
		<div id="name_check"></div>
		</div>

		<div>
			<label>성별</label> <label>남자</label> <input type="radio"
				id="mem_gender1" name="mem_gender" value="남자" required="required"
				checked="checked"> <label>여자</label> <input type="radio"
				id="mem_gender2" name="mem_gender" value="여자" required="required">
		</div>
		<div>
			<label>생일</label> <input type="date" id="mem_birthday"
				name="mem_birthday" placeholder="예:19940526" required="required"
				maxlength="8">
		</div>
		<div>
			<label>전화번호</label> <input type="text" id="mem_cellphone"
				name="mem_cellphone" required="required" placeholder="예:01035385626"
				maxlength="11">
		</div>
		<div>
			<label>아이디 비활성화(비활성화시 로그인이 제한되니 주의하십시오!)</label>
		</div>
		<div>
			<label>아이디 활성화<input type="radio" id="mem_state"name="mem_state" value="활성화" checked="checked"></label>
			<label>아이디 비활성화<input type="radio" id="mem_state" name="mem_state" value="비활성화"></label>
		</div>
		<div>
			<input type="button" value="내 정보 수정" id="memberUpdateBtn"
				required="required">
		</div>


	</form>

</div>
</body>

<div class="footer">
<jsp:include page="../mainview/footer.jsp"/>
</div>
</html>