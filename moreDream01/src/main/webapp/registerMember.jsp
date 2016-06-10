<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkReg() {
		var f = document.regForm;
		if (f.email.value == "") {
			alert("아이디(email)를 입력하세여");
			return;
		} else if (f.password.value == "") {
			alert("패스워드를 입력하세여");
			return;
		} else if (checkResult == false) {
			alert("아이디(email) 중복체크를 하세여");
			email.value = "";
			email.focus();
			return;
		}
		//자바스크립트에서 바로 폼으로 입력된 값을 url로 전송하는 기능..
		f.submit();
	}

	var xhr;
	var email, emailCheckView;
	var checkResult = false;

	function emailCheck() {
		email = document.getElementById("email");
		emailCheckView = document.getElementById("emailCheckView");

		if (email.value.length < 5) {
			emailCheckView.innerHTML = "<font color='red'>아이디(Email)는 5자 이상!</font>";
			return;
		}

		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if (exptext.test(document.regForm.email.value) == false) {
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우

			emailCheckView.innerHTML = "<font color='pink'>아이디는 이메일 형식이어야 합니다.</font>";
			return;
		}

		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = callback;

		var url = "member.do?command=existEmail&&email=" + email.value;
		xhr.open("get", url);
		xhr.send(null);
	}

	function callback() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var jsonData = JSON.parse(xhr.responseText);


				if (!jsonData.flag) {
					checkResult = false;
					emailCheckView.innerHTML = "<font color='red'><b>해당 아이디 사용 불가능</b></font>";
				} else {
					checkResult = true;
					emailCheckView.innerHTML = "<font color='blue'><b>해당 아이디 사용가능</b></font>";

				}//else
			}//if
		}//if
	}//callback
</script>
</head>
<!--  
Ajax 기술을 적용할수 있는 부분 ::
id 중복체크
onkeyup 이벤트 사용
조건 :
id에 5자 이상의 값이 들어오도록...
5자 미만일때는  id 옆에 "아이디는 5자 이상이어야 합니다"가 뜨도록

5자 이상일때는 ajaxIdcheck로 연결
사용 가능한 아이디면 옆에 "사용가능 아이디!!"
사용 가능하지 않은 아이면 옆에 "사용 불가 아이디!!"

만약에 사용불가능한 상태에서 전송버튼을 누르면 전송이 안되도록 처리
-->
<body>

	<jsp:include page="./header.jsp" />
	<div class="container">
		<section id="page-breadcrumb">
			<div class="vertical-center sun">
				<div class="container">
					<div class="row">
						<div class="action">
							<div class="col-sm-12">
								<h1 class="title">Register Form....</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<br><br>
		<form name="regForm" action="member.do" method="post">
			<input type="hidden" name="command" value="registerMember">

			<!-- 변경및 추가... -->
			ID(Email) <input type="text" name="email" id="email"
				onkeyup="emailCheck()"> <span id="emailCheckView"></span><br>
			<br>


			<!-- <input type="button" value="중복확인" onclick="idCheck()"><br><br> -->
			<!-- <input type="hidden" name="idFlag" value=""> -->
			PASS <input type="password" name="password"><br>
			<br> 
			<button type="button" onclick="checkReg()" class="btn btn-lg btn-primary">회원가입</button>
		</form>
<br><br>

	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>