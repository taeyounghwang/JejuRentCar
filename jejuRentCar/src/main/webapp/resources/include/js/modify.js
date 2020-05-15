var loginUserId = "";
$(function() {
	errCodeCheck();
	emailCheck();
	var message = [ "기존 비밀번호를 입력해 주세요.", "영문,숫자,특수문자만 가능. 8 ~ 15자 입력해 주세요.",
			"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.", "- 포함 입력해 주세요. 예시) 010-0000-0000" ];
	$('.error').each(function(index) {
		$('.error').eq(index).html(message[index]);
	});
	$('#oldUserPw, #userPw, #userPwCheck, #phone').bind("focus", function() {
		var idx = $("#oldUserPw, #userPw, #userPwCheck, #phone").index(this);
		// console.log("대상 : "+ idx );
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});
	/* 확인 버튼 클릭 시 처리 이벤트 */
	$("#modify").click(
			function() {
				// 입력값 체크

				if (!formCheck($('#oldUserPw'), $('.error:eq(0)'), "기존 비밀번호를"))
					return;
				else if (!inputVerify(1, '#oldUserPw', '.error:eq(0)'))
					return;
				else if (!formCheck($('#phone'), $('.error:eq(3)'), "전화번호를"))
					return;
				else if (!inputVerify(2, '#phone', '.error:eq(3)'))
					return;
				else if (!formCheck($('#emailName'), $('.error:eq(4)'),
						"이메일 주소를"))
					return;
				else {
					if ($('#userPw').val() != "") {
						if (!inputVerify(1, '#userPw', '.error:eq(1)'))
							return;
						if (!idPwdCheck())
							return;
					}
					if ($('#userPwCheck').val() != "") {
						if (!inputVerify(1, '#userPwCheck', '.error:eq(2)'))
							return;
					}
					if ($('#userPw').val() != ""
							&& $('#userPwCheck').val() != "") {
						if (!passwordCheck())
							return;
					}
					$("#email").val(
							$("#emailName").val() + "@"
									+ $("#emailDomain").val());
					$("#memberForm").attr({
						"method" : "post",
						"action" : "/member/modify.do"
					});
					$("#memberForm").submit();
				}
			});
	$("#modifyReset").click(function() {
		$("#memberForm").each(function() {
			this.reset();
		});
	});
	$("#modifyCancel").click(function() {
		location.href = "/member/login.do";
	});
});
function passwordCheck() {
	if ($("#userPw").val() != $("#userPwCheck").val()) {
		alert("패스워드 입력이 일치하지 않습니다");
		$("#userPw").val("");

		$("#userPwCheck").val("");
		$("#userPw").focus();
		return false;
	}
	return true;
}
function idPwdCheck() {
	var userId = loginUserId;
	var userPw = $("#userPw").val();
	if (userPw.indexOf(userId) > -1) {
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#userPw").val("");
		$("#userPw").focus();
		return false;
	} else {
		return true;
	}
}