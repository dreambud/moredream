<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>More Dream</title>
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

<body>

	<jsp:include page="./header.jsp" />
	
	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">회원가입</h1>
							<p>당신의 꿈을 실현시켜보세요 !</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#page-breadcrumb-->
		
		<div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			  	<h2></h2>
			 	</div>
			  	<div class="panel-body">
			    	<form name="regForm" action="member.do" method="post">
			    	<input type="hidden" name="command" value="registerMember">
                    <fieldset>
			    	  	<div class="form-group"><label>이메일</label>
			    		    <input class="form-control" placeholder="이메일 주소 입력" id="email" name="email" onkeyup="emailCheck()" type="text">
			    		    <span id="emailCheckView"></span>
			    		</div>
			    		<div class="form-group"><label>비밀번호</label>
			    			<input class="form-control" placeholder="비밀번호 입력" name="password" onkeyup="passCheck()" type="password">
			    			<span id="passswordCheckView"></span>
			    		</div>
			    		<div class="checkbox">
			    	    	<label>
			    	    		 아래 버튼을 눌러 <font color="blue">이용약관</font>에 동의 합니다<p>	
			    	    	</label>
			    	    </div>
			    		<button type="button" onclick="checkReg()" class="btn btn-lg btn-success btn-block">회원가입</button>
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>