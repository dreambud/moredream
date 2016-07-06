<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link href="css/responsive.css" rel="stylesheet">
	<link rel="stylesheet" href="css/footer-distributed-with-address-and-phones.css"> -->
	
	<link rel="stylesheet" href="${initParam.root}css/footer-distributed-with-address-and-phones.css">
	
    <!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <!-- <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<footer class="footer-distributed col-md-12">

			<div class="footer-left">

				<h1>MORE<span>DREAM<i class="fa fa-leaf" aria-hidden="true"></i></span></h1>

				<p class="footer-links">
					<a href="${initParam.root }index.jsp">Home</a>
					·
					<a href="${initParam.root}dream.do?command=getAllListDream">꿈 둘러보기</a>
					·
					<a href="${initParam.root}dream/createdream_info.jsp">꿈 만들기</a>
					·<br>
					<a href="${initParam.root }help1.jsp">모아드림 소개</a>
					·
					<a href="${initParam.root }help2.jsp">이용안내</a>
					·
					<a href="${initParam.root}contact.jsp">Contact</a>
				</p>

				<p class="footer-company-name">More Dream &copy; 2016</p>
			</div>

			<div class="footer-center">

				<div>
					<i class="fa fa-map-marker"></i>
					<p>판교테크노 밸리<span>유스페이트 2B동 한국소프트웨어진흥협회 3강의장</span> </p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>+82 1111-1111</p>
				</div>

				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:MoreDream@moredream.com">moredream@moredream.com</a></p>
				</div>

			</div>

			<div class="footer-right">
			<font style="color: #60C5B8 ">Dream Categories</font>
				<p class="footer-links">
					<a href="${initParam.root}dream.do?command=getAllListDream">전체</a>
					·
					<a href="${initParam.root}dream.do?command=getAllListDream&&category=디자인">디자인</a>
					·
					<a href="${initParam.root}dream.do?command=getAllListDream&&category=패션">패션</a>
					·
					<a href="${initParam.root}dream.do?command=getAllListDream&&category=출판">출판</a>
					·<br>
					<a href="${initParam.root}dream.do?command=getAllListDream&&category=요리">요리</a>
					·
					<a href="${initParam.root}dream.do?command=getAllListDream&&category=음악">음악</a>
					·
					<a href="${initParam.root}dream.do?command=getAllListDream&&category=공연">공연</a>
					·
					<a href="${initParam.root}dream.do?command=getAllListDream&&category=영화">영화</a>
				</p>
				
				<!-- <p class="footer-company-about">
					<span>About the MoreDream</span>
					Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu auctor lacus vehicula sit amet.
				</p> -->

				<div class="footer-icons">

					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
					<a href="#"><i class="fa fa-github"></i></a>

				</div>

			</div>

		</footer>
    <!--/#footer-->
</body>
</html>
