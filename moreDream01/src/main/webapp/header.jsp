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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
 
body, table, div, p {font-family:'Nanum Gothic';}
/* 나눔글꼴 */
</style>

<!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">
    <script type="text/javascript">
	function logout(){
		var f=confirm("로그아웃 하시겠습니까?");
		if(f)
			location.href="./member.do?command=logout"; //Controller에서 기능으로 연결..
	}
	
	function loginCheck(){
		var flag = ${sessionScope.mvo==null};
		if(flag){
			alert('로그인이 필요한 페이지 입니다.');
			location.replace('login.jsp?url='+location.href);
		}
	}
	function isLogin(){
		var flag = ${sessionScope.mvo!=null};
		if(flag){
			location.replace('index.jsp');
		}
	}
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

					<a class="navbar-brand" href="index.jsp">
						<h1>MORE DREAM</h1>
					</a>

				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="./dream.do?command=getAllListDream ">꿈 찾기</a></li>
						<li><a href="createdream.jsp ">꿈 꾸기</a></li>
						<li><a href="# ">도움말</a></li>
						<c:if test="${sessionScope.mvo.memberCode=='A'}">
							<li class="dropdown"><a href="#">Admin<i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="member.do?command=getMemberList">회원 관리</a></li>
									<li><a href="dream.do?command=getAllListDreamForAdmin">꿈
											관리</a></li>
								</ul></li>
						</c:if>
						<c:choose>
							<c:when test="${sessionScope.mvo==null}">
								<li><a href="login.jsp">로그인</a></li>
								<li><a href="registerMember.jsp">회원 가입</a></li>
							</c:when>
							<c:otherwise>
							<li class="dropdown"><a href="#">${mvo.email}님 환영합니다.<i class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="updateMember.jsp">회원 정보 수정</a></li>
									<li><a href="memberpage.jsp">나의 꿈 응원 현황</a></li>
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
					<form role="form">
						<i class="fa fa-search"></i>
						<div class="field-toggle">
							<input type="text" class="search-form" autocomplete="off"
								placeholder="	깨진다...">
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>
	<!--/#header-->
</body>
</html>
