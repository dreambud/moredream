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

<style type="text/css">

/* 추가 */
.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #5486da;
}

.jumbotron {
	padding: 100px 25px;
	font-family: Montserrat, sans-serif;
	margin-bottom: 0px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
}

#index1 {
	color: #fff;
	background-color: #1E88E5;
}

#index2 {
	color: #fff;
	background-color: #673ab7;
}

#index3 {
	color: #fff;
	background-color: #ff9800;
}

#index4 {
	color: #fff;
	background-color: #00bcd4;
}

#index5 {
	color: #fff;
	background-color: #009688;
}

@media screen and (max-width: 810px) {
	#index1, #index2, #index3, #index4, #index5 {
		margin-left: 150px;
	}
}
</style>

</head>
<!--/head-->

<body>

	<jsp:include page="./common/header.jsp" />

	<!-- 이미지 -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>

		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="images/intro/dream.png" alt="Image">
			</div>
			<div class="item">
				<img src="images/intro/dream2.jpg" alt="Image">
			</div>
			<div class="item">
				<img src="images/intro/logistics.jpg" alt="Image">
			</div>
			<div class="item">
				<img src="images/intro/moredream.png" alt="Image">
			</div>
		</div>
		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- /moredream intro img -->

	<!-- 모아드림 사이트명 -->
	<div class="jumbotron text-center"
		style="background-color: #282c2e; color: #fff">
		<h3 style="color: orange;">
			<b>작은 돈들이 모여 기적을 만들어내는 모아드림</b>
		</h3>
		<br>
		<h4 style="color: #8C8881;"><b>
			모아드림은 '모아서 주다' + '꿈을 모으다'가 합쳐진 용어로<br><br>
			꿈을 모아서 대중들에게 보이다. 또는 꿈의 실현을 주다. 라는<br><br>
			의미를 가지고 있습니다. 모아드림에서는 크라우드 펀딩을 모델로 하여<br><br>
			 수요와 공급을 연결할 수 있는 커뮤니티를 만들어가고 있습니다. <br><Br>
		</b></h4>
	</div>
	<div class="jumbotron text-center"
		style="background-color: #4F575B; color: #fff">
		<h2 style="color: orange;">
			<b>
			모아드림을 만나면
			당신의 꿈은 현실이 됩니다.<br><br>
			"Let's More Dream Together!!"<br><br>
			 "Shall We dream?"</b>
		</h2>
	</div>

	
	
	<jsp:include page="./common/footer.jsp" />
	<!--/#footer-->
</body>
</html>
