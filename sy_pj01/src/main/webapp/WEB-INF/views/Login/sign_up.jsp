<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function() {
		$("#user_id").focus();
		$("#user_id").blur(function() {
			fn_idchk();
		});
		$("#user_pw").blur(function() {
			pw_reg();
		});
		$("#pwChk").blur(function(){
			pw_chk();
		});
		$("#user_phone").blur(function(){
			phone_reg();
		});
	});

	//아이디 중복확인
	function fn_idchk() {
		var user_id = $("#user_id").val();
		var idData = {
			"sy_user_id" : user_id
		};

		$.ajax({
			url : "idChk.do",
			type : "post",
			dataType : "json",
			data : JSON.stringify(idData),
			contentType : "application/json",
			success : function(msg) {
				if (msg.chk == true) {
					$("#user_id").attr("title", "Y");
					$("#idLabel").text("ID");
					$("#user_pw").focus();
				} else {
					$("#user_id").attr("title", "N");
					$("#user_id").focus();
					$("#idLabel").text("이미 사용중인 아이디 입니다.");
					
				}
			},
			error : function(msg) {
				alert("통신실패");
			}
		})
	}

	//비밀번호 정규식 확인
	function pw_reg() {
		
		var user_pw = $("#user_pw").val();
		var reg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{6,50}$/;

        if (!reg.test(user_pw) || user_pw == "") {
           $("#user_pw").focus();
           $("#pwRegLabel").text("최소 하나 이상의 문자, 숫자, 특수기호로 6자리 이상 입력");
        }
        if (reg.test(user_pw) && user_pw != "") {
           $("#pwRegLabel").text("PW");
        }
	}
	//비밀번호 일치여부 확인
	function pw_chk(){
		var user_pw = $("#user_pw").val();
		var user_pw_chk = $("#pwChk").val();
		
		if(user_pw == user_pw_chk){
			$("#chkLabel").text("비밀번호 일치");
		}else{
			$("#chkLabel").text("비밀번호가 일치하지 않습니다.");
			$("#pwChk").focus();
		}
	}
	//핸드폰번호 중복 확인
	function phone_reg(){
		var sy_user_phone = $("#user_phone").val();
        var phone_regExp = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
        if (phone_regExp.test(sy_user_phone)) {
           $.ajax({
              url : "phonechk.do",
              type : "post",
              async: false,
              data : sy_user_phone,
              dataType : "json",
              contentType : "application/json",
              success : function(msg) {
                 if (msg.chk) {
                    $("#phoneLabel").text("유효한 번호 입니다");
                 } else {
                    $("#user_phone").focus();
                    $("#phoneLabel").text("유효하지 않은 번호 입니다");
                 }
              },
              error : function() {
              }
           });
        } else {
           $("#phoneLabel").text("유효하지 않은 번호 입니다 정규식");
           $("#user_phone").focus();
        }
     }
</script>
</head>
<body>
	<form id="sign_up" action="sign_upres.do" method="post">
		<div>
			<input type="text" id="user_id" title="N" required="required"
				name="sy_user_id" /> <label id="idLabel" class="control-label"
				for="input">아이디</label><i class="mtrl-select"></i>
		</div>
		<div class="form-group">
			<input type="password" id="user_pw" required="required"
				name="sy_user_pw" /> <label id="pwRegLabel" class="control-label"
				for="input">비밀번호</label><i class="mtrl-select"></i>
		</div>
		<div class="form-group">
			<input type="password" id="pwChk" required="required"
				onkeyup="javascript:pw_chk();" /> <label id="chkLabel"
				class="control-label" for="input">비밀번호 확인</label><i
				class="mtrl-select"></i>
		</div>
		<div class="form-group">
			<input type="text" required="required" name="sy_user_name" /> <label
				class="control-label" for="input">이름</label><i class="mtrl-select"></i>
		</div>
		<div class="form-group">
			<input type="tel" id="user_phone"
				name="sy_user_phone"
				required="required" /> <label id="phoneLabel" class="control-label"
				for="input">휴대폰 번호 (010-0000-0000)</label><i class="mtrl-select"></i>
		</div>
		<div>
			<button type="submit" class="mtr-btn">
				<span>가입하기</span>
			</button>
			<button type="button" class="mtr-btn"
				onclick="location.href='sign.do'">
				<span>취소</span>
			</button>
		</div>
	</form>
</body>
</html>