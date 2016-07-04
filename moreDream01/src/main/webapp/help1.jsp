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
<script type="text/javascript">
function findDream() {
	location.href="${initParam.root}dream.do?command=getAllListDream";
}
function registDream() {
	location.href="${initParam.root}dream/createdream_info.jsp";
}

</script>
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

	<!-- 크라우드 펀딩 소개 -->
	<div class="jumbotron text-center"
		style="background-color: #4F575B; color: #fff">
		<h3 style="color: orange;">
			<b>크라우드 펀딩이란?</b>
		</h3>
		<br>
		<h4>
			<b><font color="#fff"> '대중으로부터 자금을 모은다.'는 뜻으로 소셜미디어나 인터넷 등의 매체를 활용해 자금을 모으는 투자 방식</font>
			<br><hr style="color: #282c2e;" width="50"><br>
				자금이 없는 예술가나 사회활동가 등이 자신의 창작 프로젝트나 사회공익 프로젝트를<br><Br> 
				인터넷에 공개하고 익명의 다수에게 투자를 받는 방식으로 목표액과 모금기간이 정해져 있고,<br><br>
				기간 내에 목표액을 달성하지 못하면 후원금이 전달되지 않기 때문에<br><br>
				창작자는 물론 후원자들도 적극 나서 프로젝트 홍보를 돕는 것을 말합니다.</b>
		</h4>
	</div>

	<div class="jumbotron text-center"
		style="background-color: #282c2e; color: #fff">
		<h3 style="color: orange;">
			<b>작은 돈들이 모여 기적을 만들어내는 모아드림</b>
		</h3>
		<br>
		<h4 style="color: #8C8881;">
			<b> 모아드림은 '모아서 주다' + '꿈을 모으다'가 합쳐진 용어로<br> <br> 꿈을 모아서 
				대중들에게 보이다. 또는 꿈의 실현을 주다. 라는 의미를 가지고 있습니다. <br> <br> 
				모아드림은 꿈을 꾸는 청년들을 위해 여러 사람들이 후원금을 모아 드리는 리워드형 크라우드 펀딩 사이트 입니다.<br><br>
				여러분의 재능으로 이루고 싶은 꿈을 모아드림과 함께 해보세요. 
			</b>
		</h4>
	</div>
	<div class="jumbotron text-center"
		style="background-color: #4F575B; color: #fff">
		<h2 style="color: orange;">
			<b> 모아드림은 당신의 꿈을 응원합니다!!<br> <br> "Let's More
				Dream Together!!"<br> <br> "Shall We dream?"
			</b>
		</h2>
		<br><br>
		<button class="btn btn-default btn-lg" onclick="findDream()">꿈 둘러보기</button>&nbsp;&nbsp;&nbsp;
		<button class="btn btn-default btn-lg" onclick="registDream()">꿈 만들기</button>
	</div>
	


	<jsp:include page="./common/footer.jsp" />
	<!--/#footer-->
</body>
</html>
