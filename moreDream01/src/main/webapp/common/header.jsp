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
<script type="text/javascript" src="${initParam.root }js/jquery.js"></script>
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
	function logout(){
		var f=confirm("로그아웃 하시겠습니까?");
		if(f)
			location.href="${initParam.root}member.do?command=logout"; //Controller에서 기능으로 연결..
	}

	function loginCheck(){
		var flag = ${sessionScope.mvo==null};
		if(flag){
			alert('로그인이 필요한 페이지 입니다.');
			location.replace('${initParam.root}member/login.jsp?url='+location.href);
		}
	}
	function isLogin(){
		var flag = ${sessionScope.mvo!=null};
		if(flag){
			location.replace('${initParam.root}index.jsp');
		}
	}
	function search(ev){
		if (window.event) // IE코드
			var code = window.event.keyCode;
		else // 타브라우저
			var code = ev.which;
		if(code=='13')
			location.replace('${initParam.root}dream.do?command=getAllListDream&&keyword='+document.getElementById("keyword").value);
		
	}
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
    
    var xhr;

	function alarm() {
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = callbackAlarm;
		var url = "${initParam.root}dream.do?command=alarm";
		xhr.open("get", url);
		setInterval(xhr.send(null), 10000);
	}
	alarmView = document.getElementById('alarmView');
	function callbackAlarm() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var jsonData = JSON.parse(xhr.responseText);
				var list = jsonData.alarmList;
				$('#alarmView').html("<li><b><h3 align='center'>꿈 업데이트 알림 보기</h3></b></li>");
				for(i=0;i<list.length;i++){
					$(function() { 
						$('#alarmView').append("<hr><a href='${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId="+list[i].dreamVO.dreamId+"'><li style='margin-left:10px'><div><img src='${initParam.root}upload/dream/"+list[i].update_newFilename+"' width='50px' height='50px'></div>"+"<div>&nbsp;&nbsp;<font size='3'>꿈 업데이트 정보가 있습니다.</font><br>"+list[i].update_writeDate+"</div></li>");
					});
				}
			}//if
		}//if
	}//callback
    </script>
</head>
<!--/head-->
<c:choose>
<c:when test="${sessionScope.mvo!=null}">
<body onload="alarm();">
</c:when>
<c:otherwise>
<body>
</c:otherwise>
</c:choose>
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
						<li class="dropdown"><a href="#">모아드림 소개<i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="${initParam.root }help1.jsp">모아드림 이야기</a></li>
									<li><a href="${initParam.root }help2.jsp">모아드림 회원서비스</a></li>
								</ul>
						</li>
						<li><a href="${initParam.root}dream.do?command=getAllListDream ">꿈 찾기</a></li>
						<li><a href="${initParam.root}dream/createdream_info.jsp ">꿈 꾸기</a></li>
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
							<li class="dropdown-toggle"><a href="#" onmouseover="javascript:alarm();"><img src="${initParam.root}images/document_icon.png" width="30px"></img></a>
								<ul role="menu" class="sub-menu" id="alarmView" style='width:400px; left: inherit;right:0'>
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
