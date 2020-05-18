<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주렌터카 :: 회원가입</title>
<link rel="icon" href="http://bootstrapk.com/examples/carouse1/favicon.ico">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Yeon+Sung&display=swap" rel="stylesheet">
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
		$("#memberjoinBtn")
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
								"action" : "/member/join"
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

							// 약관동의 체크 박스 체크 필수
							if (!$("input[name='req']").is(":checked")) {
								alert("약관동의를 하셔야 회원가입이 됩니다.");
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

		// 아이디 중복 체크
		$("#userIdConfirm")
				.click(
						function() {

							var id = $("#mem_id").val();

							// 아이디 중복체크 시 이메일 정규식 적용
							var r4 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //id 이메일 정규식

							// 아이디 이메일 정규식
							if (id.match(r4) == null) {
								alert("아이디는 이메일 형식이여야 합니다.");
								return false;
							}

							// 아이디 글자 수 제한 8
							if (id.length < 8) {
								alert("아이디 형식이 맞지 않습니다.");
								return false;
							}

							$
									.ajax({
										url : "/member/userIdConfirm",
										type : "post",
										data : "mem_id=" + $("#mem_id").val(),
										error : function() {
											alert('사이트 접속에 문제로 정상 작동하지 못하였습니다.잠시 후 다시 시도해 주세요.');
										},
										success : function(resultData) {
											console.log("resultData : "
													+ resultData);
											if (resultData == "1") {
												alert("현재 사용중인 아이디 입니다.");
												$("#mem_id").val("");
											} else if (resultData == "2") {
												alert("사용가능 한 아이디 입니다.");
												$("#memberjoinBtn").prop(
														"disabled", false);
											}
										}
									});
						});

	});
</script>
</head>

<style>

.textaside{
	float: left;
	width: 500px;
	height: 1000px;
	margin-left: 420px;
	
}

.mainArea{
	float: left;
	display: inline-block;
	width: 500px;
	height: 1000px;
	margin-left: 40px;
	margin-top: 25px;
}

.contentss{
	background-color: #FFFFFF;
	align="center";
}

.container{
	width: 2000px;
	background-color: #FFFFFF;
}

#mem_id, #mem_password, #passwordCheck, #mem_name, #mem_birthday, #mem_cellphone{
	width: 300px;
	border: 2px solid #aaa;
	border-radius: 4px;
	margin: 8px 0;
	outline: none;
	padding: 8px;
	box-sizing: border-box;
	transition: .3s;
}

#mem_id:focus, #mem_password:focus, #passwordCheck:focus, #mem_name:focus, #mem_birthday:focus, #mem_cellphone:focus{
	border-color:dodgerBlue;
	box-shadow: 0 0 8px 0 dodgerBlue;
}

.icon{
	height:129px;
}
</style>


<body>
<div class="contentss">
	<div class="icon" align="center">
	<a href="/main"><img src="../resources/images/jejusi.jpg" width="300px" style="margin-left:0px;"></a>
	<label style="font-size:80px; vertical-align:top; margin-left:10px; margin-top:20px;font-family: 'Yeon Sung', cursive;" >제주렌터카 회원가입</label>
	</div>
	<form id="memberjoinForm">
	<div class="container" align="center">
	<div class="textaside" >
		<table>
			<tr>
				<td>
					<br> 
<textarea style="width: 500px; height: 700px;">
회원가입

- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보

만14세 미만 아동 회원가입
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보

단체아이디 회원가입
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호

첫째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록

둘째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.

셋째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다.
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보

넷째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호


가. 수집하는 개인정보의 항목첫째, 회사는 회원가입, 원활한 고객상담, 
각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 
개인정보를 필수항목으로 수집하고 있습니다.


나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공
- 생성정보 수집 툴을 통한 수집
   </textarea> <br> <input type="checkbox" id="req" name="req"
					required="required"> 개인정보 수집 및 이용에 동의합니다.
				</td>
			</tr>
		</table>
		</div>
		<div class="mainArea" style="margin-left:90px;">
		<div>
			<label style="float: left">아이디</label> 
			<br>
			<input type="text" id="mem_id" name="mem_id" placeholder="exam@naver.com 8~50글자" required="required"
				maxlength="50" autofocus="autofocus" width="100px" style="float: left;">&nbsp;
			<input type="button" id="userIdConfirm" value="아이디중복확인" style="float: left; margin-left:10px; margin-top: 10px; height: 30px;">
			<br>
			<div id="id_check" style="float: left; margin-left: 0px; display: inline-block;"></div>
		</div>
		<div>
		<br>
		<br>
		<br>
			<label style="float: left">비밀번호</label> 
			<br>
			<input type="password" id="mem_password" name="mem_password" placeholder="영문/숫자 포함 8~20자" required="required"
				maxlength="20" width="100px" style="float: left">
			<br>
		</div>
		<div id="pw_check" style="float: left; margin-left: 0px;"></div>
		<div>
			<br>
			<br>
			<br>
			<label style="float: left">비밀번호 확인</label>
			<br> 
			<input type="password" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 재입력" required="required"
				maxlength="20" style="float: left">
		</div>
		<div id="pwCheckText" style="float: left; margin-left: 0px;"></div>
		<div>
			<br>
			<br>
			<br>
			<label style="float: left">이름</label> 
			<br>
			<input type="text" id="mem_name" name="mem_name"
				required="required" placeholder="한글/영어 30자" maxlength="30" style="float: left">
		<div id="name_check" style="float: left; margin-left: 0px;"></div>
		</div>

		<div>
			<br>
			<br>
			<br>
			<label style="float: left">성별</label> 
			<br>
			<br>
			<div align="left">
			<label>남자</label> <input type="radio"
				id="mem_gender1" name="mem_gender" value="남자" required="required" checked="checked"> 
			<label>여자</label> <input type="radio"
				id="mem_gender2" name="mem_gender" value="여자" required="required">
			</div>
		</div>
		<div>
			<br>
			<label style="float: left">생일</label> 
			<br>
			<input type="date" id="mem_birthday"
				name="mem_birthday" placeholder="예:19940526" required="required"
				maxlength="8" style="float: left">
		</div>
		<div>
			<br>
			<br>
			<br>
			<label style="float: left">전화번호</label> 
			<br>
			<input type="text" id="mem_cellphone"
				name="mem_cellphone" required="required" placeholder="예:01035385626"
				maxlength="11" style="float: left">
		</div>
			<br>
			<br>
			<br>
		<div>
			<input type="button" value="회원가입" id="memberjoinBtn"
				required="required" disabled="disabled" style="float: left; margin-left:100px; width:100px; height:35px;"> 
			<br>
			<br>
			<br>
			<label style="float: left">아이디 중복 확인 후 회원가입 버튼이 활성화 됩니다.</label>
		</div>
		</div>
		</div>


	</form>
	</div>
</body>
</html>