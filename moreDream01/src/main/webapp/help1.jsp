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
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
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
		<h1 style="font-size: 36; font-weight: 500;">
			More <font style="color: #5486da">Dream</font>
		</h1>
	</div>

	<!-- Container (크라우드 펀딩 소개 About Section) -->
	<div class="jumbotron" id="index1">
		<h2 style="color: #fff;">Crowd Funding</h2>
		<ul class="elements">
			<li class="wow fadeInUp" data-wow-duration="900ms"
				data-wow-delay="100ms"><i class="fa fa-angle-right"></i>
				'대중으로부터 자금을 모은다.'는 뜻으로 소셜미디어나 인터넷 등의 매체를 활용해 자금을 모으는 투자 방식</li>
			<li class="wow fadeInUp" data-wow-duration="800ms"
				data-wow-delay="200ms"><i class="fa fa-angle-right"></i> 자금이 없는
				예술가나 사회활동가 등이 자신의 창작 프로젝트나 사회공익프로젝트를 인터넷에 공개하고 익명의 다수에게 투자를 받는 방식</li>
			<li class="wow fadeInUp" data-wow-duration="700ms"
				data-wow-delay="300ms"><i class="fa fa-angle-right"></i> 목표액과
				모금기간이 정해져 있고, 기간 내에 목표액을 달성하지 못하면 후원금이 전달되지 않기 때문에 창작자는 물론 후원자들도 적극
				나서 프로젝트 홍보를 돕는다.</li>
		</ul>
	</div>
	<div class="jumbotron" id="index2">
		<h2 style="color: #fff;">More Dream</h2>
		<ul class="elements">
			<li class="wow fadeInUp" data-wow-duration="900ms"
				data-wow-delay="100ms"><i class="fa fa-angle-right"></i> 다양한
				창조적 문화예술 분야의 꿈을 응원하는 리워드형 크라우드 펀딩(crowd funding)</li>
			<li class="wow fadeInUp" data-wow-duration="800ms"
				data-wow-delay="200ms"><i class="fa fa-angle-right"></i> 실현하고
				싶은 꿈을 꾸는 청년들을 위해 여러 사람들이 후원금을 모아 드리는 매개 사이트입니다.</li>
			<li class="wow fadeInUp" data-wow-duration="700ms"
				data-wow-delay="300ms"><i class="fa fa-angle-right"></i> 자신이 가진
				재능으로 이루고 싶은 꿈에 대한 프로젝트를 기획/홍보하여 후원을 진행해<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				그 꿈을 이룰수 있는 자금 마련을 중계 및 관리 해드립니다.</li>
		</ul>
	</div>

	<div class="jumbotron" id="index3">
		<h2 style="color: #fff;">꿈 꾸기</h2>
		<ul class="elements">
			<li class="wow fadeInUp" data-wow-duration="900ms"
				data-wow-delay="100ms"><i class="fa fa-angle-right"></i> 프로젝트
				등록</li>
			<li class="wow fadeInUp" data-wow-duration="800ms"
				data-wow-delay="200ms"><i class="fa fa-angle-right"></i> 실현하고
				싶은 꿈을 꾸는 사람들을 위해 여러 사람들이 후원금을 모아 주는 것</li>
			<li class="wow fadeInUp" data-wow-duration="700ms"
				data-wow-delay="300ms"><i class="fa fa-angle-right"></i> 자신이 가진
				재능으로 이루고 싶은 꿈에 대한 프로젝트를 기획/홍보하여 후원을 진행해<br /> 그 꿈을 이룰수 있는 자금 마련을 중계
				및 관리 해주는 것</li>
		</ul>
	</div>

	<div class="jumbotron" id="index4">
		<h2 style="color: #fff;">꿈 응원하기</h2>
		<ul class="elements">
			<li class="wow fadeInUp" data-wow-duration="900ms"
				data-wow-delay="100ms"><i class="fa fa-angle-right"></i> 프로젝트
				등록</li>
			<li class="wow fadeInUp" data-wow-duration="800ms"
				data-wow-delay="200ms"><i class="fa fa-angle-right"></i> 실현하고
				싶은 꿈을 꾸는 사람들을 위해 여러 사람들이 후원금을 모아 주는 것</li>
			<li class="wow fadeInUp" data-wow-duration="700ms"
				data-wow-delay="300ms"><i class="fa fa-angle-right"></i> 자신이 가진
				재능으로 이루고 싶은 꿈에 대한 프로젝트를 기획/홍보하여 후원을 진행해<br /> 그 꿈을 이룰수 있는 자금 마련을 중계
				및 관리 해주는 것</li>
		</ul>
	</div>

	<div class="jumbotron" id="index5">
		<h2 style="color: #fff;">계정 설정</h2>
		<ul class="elements">
			<li class="wow fadeInUp" data-wow-duration="900ms"
				data-wow-delay="100ms"><i class="fa fa-angle-right"></i> 로그인 하신
				후, 상단의 프로필에서 내 정보 수정-계정 설정에서 변경하실 수 있습니다 사이트 상단 오른쪽 부분에 ~님 환영합니다를
				마우스를 가져다대시면 회원정보수정이 로그인 하신 후, 상단의 프로필에서 내 정보 수정-계정 설정에서 변경하실 수 있습니다.</li>
			<li class="wow fadeInUp" data-wow-duration="800ms"
				data-wow-delay="200ms"><i class="fa fa-angle-right"></i> 먼저 로그인
				하신 후, 내 정보 수정-공개/알림 설정에서 설정할 수 있습니다.</li>
			<li class="wow fadeInUp" data-wow-duration="700ms"
				data-wow-delay="300ms"><i class="fa fa-angle-right"></i> 자신이 가진
				재능으로 이루고 싶은 꿈에 대한 프로젝트를 기획/홍보하여 후원을 진행해<br /> 그 꿈을 이룰수 있는 자금 마련을 중계
				및 관리 해주는 것</li>
		</ul>
	</div>
	
	<jsp:include page="./common/footer.jsp" />
	<!--/#footer-->
</body>
</html>
