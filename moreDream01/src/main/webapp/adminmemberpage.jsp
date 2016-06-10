<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Portfolio Three Columns | Triangle</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="js/lightbox.min.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

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
						<li><a href="finddream.jsp ">꿈 찾기</a></li>
						<li><a href="createdream.jsp ">꿈 꾸기</a></li>
						<li><a href="# ">도움말</a></li>
						<li><a href="# ">로그인</a></li>
						<li><a href="# ">회원 가입</a></li>
						<li><a href="# ">로그아웃</a></li>
						<li><a href="# ">내 정보</a></li>
					</ul>
				</div>
				<div class="search">
					<form role="form">
						<i class="fa fa-search"></i>
						<div class="field-toggle">
							<input type="text" class="search-form" autocomplete="off"
								placeholder="	꿈 검색하기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>
	<!--/#header-->

<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title" align="center"> 회원 관리 현황</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
		
	<section id="shortcodes">
		<div class="container">
			<div id="feature-container">
				<div class="row">
					<div class="col-md-12">
					
					<table class="table table-striped table-bordered table-hover">
        <caption>신청현황</caption>
        <thead>
            <tr>
                <th>#</th>
                <th>신청자</th>
                <th>비밀번호</th>
                <th>승인</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td><a href="#">123@naver.com</a></td>
                <td><input type="password"></td>
               	<td><button type="button" class="btn btn-xs btn-success">저장</button><button type="button" class="btn btn-xs btn-danger">탈퇴</button></td>
            </tr>
            <tr>
               	 <td>2</td>
                <td><a href="#">123@naver.com</a></td>
                <td><input type="password"></td>
               	<td><button type="button" class="btn btn-xs btn-success">저장</button><button type="button" class="btn btn-xs btn-danger">탈퇴</button></td>
            </tr>
            <tr>
                <td>3</td>
                <td><a href="#">123@naver.com</a></td>
                <td><input type="password"></td>
               	<td><button type="button" class="btn btn-xs btn-success">저장</button><button type="button" class="btn btn-xs btn-danger">탈퇴</button></td>
            </tr>
        </tbody>
    </table>
					
					
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	
	

	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center bottom-separator">
					<img src="images/home/under.png" class="img-responsive inline"
						alt="">
				</div>
				<div class="col-md-4 col-sm-6"></div>
				<div class="col-md-3 col-sm-6"></div>
				<div class="col-md-4 col-sm-12">
					<div class="contact-form bottom"></div>
				</div>
				<div class="col-sm-12">
					<div class="copyright-text text-center">
						<p>&copy; Your Company 2014. All Rights Reserved.</p>
						<p>
							Designed by <a target="_blank" href="http://www.themeum.com">Themeum</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/#footer-->



</body>
</html>
