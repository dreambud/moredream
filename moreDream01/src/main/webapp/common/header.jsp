<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home | Triangle</title>
<!-- <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet"> -->

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
 
body, table, div, p {font-family:'Nanum Gothic';}
/* 나눔글꼴 */
</style>

<!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->
<!-- <link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png"> -->
<script type="text/javascript">
    var FaceBookApp = {
        	FBScopes: {scope: 'public_profile,email'},
        	accessToken: '',
        	// 초기화 함수
        	init: function(d, s, id) {
        	    	window.fbAsyncInit = function() {
        	    	    	FB.init({
        	    	    	    	appId : '950393115078074',
        	    	    	    	xfbml : true,
        	    	    	    	version : 'v2.6'
        	    	    	});
        	    	};

        	    	var js, fjs = d.getElementsByTagName(s)[0];
        	    	if (d.getElementById(id)) {return;}
        	     js = d.createElement(s); js.id = id;
        	    	js.src = "//connect.facebook.net/en_US/sdk.js";
        	     fjs.parentNode.insertBefore(js, fjs);
        	},
        	statusChangeCallback: function(response) {
        	    	FaceBookApp.accessToken = response.authResponse.accessToken;

        	    	// 연결 성공
        	    	if (response.status === 'connected') {
        	    	    	// 연결 성공시 실행할 코드
        	    	    	FaceBookApp.FBsigninCallback();
        	    	// 인증 거부
        	    	} else if (response.status === 'not_authorized') {
        	    	    	console.log('Please log into this app.');
        	    	// 그 밖..
        	    	} else {
        	    	    	console.log('Please log into Facebook.');
        	    	}
        	},
        	FBsigninCallback: function() {
        	    	FB.api('/me?fields=id,email,name', function(response) {
        	    	    	var id = response.id;
        	    	    	var token = FaceBookApp.accessToken;
        	    	    	var memberName = response.name;
        	    	    	var email = response.email;
        	    	    	location.href='${initParam.root}member.do?command=facebookLogin&&facebookId='+id+'&&email='+email;
        	    	    	// 실행할 코

         	   	});
        	}
    };
    // 초기화 실행
    FaceBookApp.init(document, 'script', 'facebook-jssdk');
    </script>
</head>
<!--/head-->

<body>

	<header id="header">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 overflow">
					<div class="social-icons pull-right">
						<ul class="nav nav-pills">
							<li><a href=""><i class="fa fa-facebook"></i></a></li>
							<li><a href=""><i class="fa fa-twitter"></i></a></li>
							<li><a href=""><i class="fa fa-google-plus"></i></a></li>
							<li><a href=""><i class="fa fa-dribbble"></i></a></li>
							<li><a href=""><i class="fa fa-linkedin"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="navbar navbar-inverse" role="banner">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

					<a class="navbar-brand" href="${initParam.root}index.jsp">
						<h1>MORE DREAM</h1>
					</a>

				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="${initParam.root}dream.do?command=getAllListDream ">꿈 찾기</a></li>
						<li><a href="${initParam.root}dream/createdream_info.jsp ">꿈 꾸기</a></li>
						<li><a href="# ">도움말</a></li>
						<c:if test="${sessionScope.mvo.memberCode=='A'}">
							<li class="dropdown"><a href="#">Admin<i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="${initParam.root}member.do?command=getMemberList">회원 관리</a></li>
									<li><a href="${initParam.root}dream.do?command=getAllListDreamForAdmin">꿈
											관리</a></li>
								</ul></li>
						</c:if>
						<c:choose>
							<c:when test="${sessionScope.mvo==null}">
								<li><a href="${initParam.root}member/login.jsp">로그인</a></li>
								<li><a href="${initParam.root}member/registerMember.jsp">회원 가입</a></li>
							</c:when>
							<c:otherwise>
							<li class="dropdown"><a href="#">${mvo.name}님 환영합니다.<i class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="${initParam.root}member/updateMember.jsp">회원 정보 수정</a></li>
									<li><a href="${initParam.root}dream.do?command=myMoreDream">모아드림 현황 보기</a></li>
								</ul>
							</li>
							
							<li>
								<a href="javascript:logout()">로그아웃</a>
							</li>
							
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="search">
						<i class="fa fa-search"></i>
						<div class="field-toggle">
							<div class="inner-addon left-addon">
								<i class="glyphicon glyphicon-search"></i>
								<input type="text" class="form-control" id="keyword" onkeydown="search()">
							</div>
						</div>
				</div>
			</div>
		</div>
	</header>
	<!--/#header-->
</body>
</html>
