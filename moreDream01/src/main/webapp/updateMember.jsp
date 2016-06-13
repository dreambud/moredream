<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>More Dream</title>
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

	<jsp:include page="./header.jsp" />

	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">회원정보 수정</h1>
							<p>당신의 꿈을 실현시켜보세요 !</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#page-breadcrumb-->

	<div class="contentwrap">
		<article class="container">
			<div class="page-header"></div>
			<form class="form-horizontal" action="member.do">
			<input type="hidden" name="command" value="updateMember">
			<input type="hidden" name="memberId" value="${sessionScope.mvo.memberId}">
				
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-6">
						<input type="text" name="cid" class="form-control"
							readonly="readonly" value="${sessionScope.mvo.email}">
					</div>
					<div class="col-sm-4"></div>
				</div>
				
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" name="password"
							placeholder="변경할 비밀번호를 입력해주세요" value="${sessionScope.mvo.password}">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputPasswordCheck" class="col-sm-2 control-label">주소</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="passwordCheck"
							placeholder="주소를 입력해주세요" value="${sessionScope.mvo.address}">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputPasswordCheck" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="passwordCheck"
							placeholder="이름을 입력해주세요" value="${sessionScope.mvo.name}">
					</div>
				</div>

				<div class="form-group">
					<label for="inputPhoneNumber" class="col-sm-2 control-label">전화번호</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="telnumber"
							placeholder="전화번호를 입력해주세요" value="${sessionScope.mvo.phoneNumber}">
					</div>
					
				</div>
				<p align="center"><button type="submit" class="btn btn-lg btn-success">회원정보수정</button></p>
			</form>
		</article>
	</div>




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
