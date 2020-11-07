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
<title>로그인</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function() {
		$("#user_id").focus();
	})
	function next() {
		$("#user_pw").focus();
	}
	
	function login() {
		var user_id = $("#user_id").val().trim();
		var user_pw = $("#user_pw").val().trim();
		console.log(user_id);
		console.log(user_pw);
		
		var loginVal = {
			"sy_user_id" : user_id,
			"sy_user_pw" : user_pw
		}
		if (user_id == null || user_id == "" || user_pw == null
				|| user_pw == "") {
			$("#chk").text("아이디 혹은 비밀번호를 확인하세요");
		} else {
			$.ajax({
				type : "post",
				url : "Login.do",
				data : JSON.stringify(loginVal),
				contentType : "application/json",
				dataType : "json",
				success : function(msg) {
					if (msg.chk == true) {
						location.replace("home.do");
					} else {
						$("#chk").text("아이디 혹은 비밀번호가 잘못되었습니다.");
					}
				},
				error : function(msg) {
					alert("통신 실패");
				}
			})
		}
	}
</script>
</head>
<body>
	<div class="signform">
		<h5 class="f-title">로그인</h5>
		<div class="form-group">
			<input type="text" id="user_id" required="required"
				onkeydown="javascript:if(event.keyCode==13)next();" /> <label
				class="control-label" for="input">아이디</label><i class="mtrl-select"></i>
		</div>
		<div class="form-group">
			<input type="password" id="user_pw" required="required"
				onkeydown="javascript:if(event.keyCode==13)login();" /> <label
				class="control-label" for="input">비밀번호</label><i class="mtrl-select"></i>
		</div>
		<div>
			<p id="chk" style="color: #077268;"></p>
		</div>
		<div class="submit-btns">
			<button type="button" class="mtr-btn" onclick="login();">
				<span>로그인</span>
			</button>
			<button type="button" class="mtr-btn"
				onclick="location.href='signup.do'">
				<span>회원가입</span>
			</button>
		</div>
	</div>
</body>
</html>