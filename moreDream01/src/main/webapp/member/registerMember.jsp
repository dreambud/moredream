<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${initParam.root }js/jquery.js"></script>
<script type="text/javascript" src="${initParam.root }js/bootstrap.min.js"></script>
<script type="text/javascript" src="${initParam.root }js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="${initParam.root }js/lightbox.min.js"></script>
<script type="text/javascript" src="${initParam.root }js/wow.min.js"></script>
<script type="text/javascript" src="${initParam.root }js/main.js"></script>
<link href="${initParam.root }css/bootstrap.min.css" rel="stylesheet">
<link href="${initParam.root }css/font-awesome.min.css" rel="stylesheet">
<link href="${initParam.root }css/lightbox.css" rel="stylesheet">
<link href="${initParam.root }css/animate.min.css" rel="stylesheet">
<link href="${initParam.root }css/main.css" rel="stylesheet">
<link href="${initParam.root }css/responsive.css" rel="stylesheet">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<!-- <link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png"> -->
	
<title>More Dream</title>
<script type="text/javascript">
	function checkReg() {
		var f = document.regForm;
		if (f.email.value == "") {
			alert("아이디(email)를 입력하세요");
			return;
		} else if (f.password.value == "") {
			alert("비밀번호를 입력하세요");
			return;
		} else if (f.name.value == "") {
			alert("이름을 입력하세요");
			return;
		} else if (checkResult == false) {
			alert("아이디(email) 중복체크를 하세요");
			email.value = "";
			email.focus();
			return;
		}else if(document.regForm.password.value != document.regForm.rePassword.value){
			alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요");
		}else{
		//자바스크립트에서 바로 폼으로 입력된 값을 url로 전송하는 기능..
		//facebook연동 여부 로직
			if(document.regForm.facebookId==''&&document.regForm.facebook.checked){
				checkLoginState();
			}
			else if(!document.regForm.facebook.checked){
				document.regForm.facebookId.value="";
			}
			f.submit();
		}
	}

	var xhr;
	var email, emailCheckView;
	var checkResult = false;

	function emailCheck() {
		email = document.getElementById("email");
		emailCheckView = document.getElementById("emailCheckView");

		if (email.value.length < 5) {
			emailCheckView.innerHTML = "<font color='#FF4606'>아이디(Email)는 5자 이상 작성해주세요</font>";
			return;
		}

		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if (exptext.test(document.regForm.email.value) == false) {
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우

			emailCheckView.innerHTML = "<font color='#FF4606'>아이디는 이메일 형식이어야 합니다.</font>";
			return;
		}

		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = callback;

		var url = "${initParam.root }member.do?command=existEmail&&email=" + email.value;
		xhr.open("get", url);
		xhr.send(null);
	}

	function callback() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var jsonData = JSON.parse(xhr.responseText);


				if (!jsonData.flag) {
					checkResult = false;
					emailCheckView.innerHTML = "<font color='#FF4606'><b>이미 존재하는 아이디 입니다.</b></font>";
				} else {
					checkResult = true;
					emailCheckView.innerHTML = "<font color='#60C5B8'><b>사용 가능한 아이디 입니다.</b></font>";

				}//else
			}//if
		}//if
	}//callback
		
	$(document).ready(function(){
		$('#rePassword').keyup(function(){
		if($(this).val()!=$('#password').val()){
		$('#passwordEqul').html("<br><font color='#FF4606'><b>입력하신 비밀번호가 일치 하지 않습니다.</b></font>")
		}else{
		$('#passwordEqul').html("<br><font color='#60C5B8'><b>입력하신 비밀번호가 일치 합니다.</b></font>")	
		};
		});//keyup
		});//ready
		
</script>
<script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
    	checkLog();
    } else if (response.status === 'not_authorized') {
    } 
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '950393115078074',
//     cookie     : true,  // enable cookies to allow the server to access 
                        // the session
//     status	   : true,
//     oauth	   : true,
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.6' // use version 2.2
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.async = true;
    js.src = "//connect.facebook.net/ko_KR/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  var FBtoken = "";
  function checkLog(){
	  FB.api('/me',function(response){
		  document.regForm.facebookId.value=response.id;
		  document.regForm.facebook.checked=true;
	  });
  }
</script>
</head>

<body onload="javasciprt:isLogin();emailCheck();">

	<jsp:include page="../common/header.jsp" />
	
	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
						<hr width="25%">
							<h1 class="title">회원가입</h1>
							<hr width="25%">
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
			    	<form name="regForm" action="${initParam.root }member.do" method="post">
			    	<input type="hidden" name="command" value="registerMember">
			    	<input type="hidden" name="facebookId" value="${requestScope.facebookId}">
	                    <fieldset>
				    	  	<div class="form-group"><label>이메일</label>
				    		    <input class="form-control" placeholder="이메일 주소 입력" id="email" name="email" onkeyup="emailCheck()" type="text" value="${requestScope.email }">
				    		    <span id="emailCheckView"></span>
				    		</div>
				    		<div class="form-group"><label>비밀번호</label>
				    			<input class="form-control" placeholder="비밀번호 입력" name="password" id="password" type="password">
				    			<span id="passswordCheckView"></span>
				    		</div>
				    		
					    	<div class="form-group"><label>비밀번호 확인</label>
									<input type="password" class="form-control" id="rePassword" name="rePassword"
									placeholder="비밀번호를  한번 더 입력해주세요" value="">
							<span id="passwordEqul"></span> 
							</div>
							<div class="form-group"><label>닉네임</label>
									<input type="text" class="form-control" id="name" name="name"
									placeholder="닉네임을 입력해주세요" value="">
							<span id="passwordEqul"></span> 
							</div>
							<hr>
							
							<div class="form-group" id="facebook"><label><font color="white"><i class="fa fa-facebook-official fa-2x" aria-hidden="true"></i> 페이스북으로 로그인이 가능합니다</font></label>
								<p>
								<input type="checkbox" id="facebook" name="facebook" value="연동하기"> <font color="white">페이스북과 연동하기 </font>
								
									<div class="fb-login-button" data-scope="public_profile,email" data-max-rows="1" data-size="medium" data-show-faces="true" data-auto-logout-link="true" onlogin="checkLoginState();"></div>
							</div>
				</div>
			    <div class="checkbox">
			    		<label>
			    	    	 아래 <b>[회원가입]</b> 버튼을 눌러 <font color="blue">이용약관</font>에 동의 합니다<p>	
			    	    </label>
			    	</div>
			    	<button type="button" onclick="checkReg()" class="btn btn-lg btn-default btn-block">회원가입</button>
				    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>