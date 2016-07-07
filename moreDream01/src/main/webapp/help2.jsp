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

.jumbotron {
	padding: 100px 25px;
	font-family: Montserrat, sans-serif;
	margin-bottom: 0px;
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

#index5 {
	color: #fff;
	background-color: #1E88E5;
}

#index6 {
	color: #fff;
	background-color: #673ab7;
}

@media screen and (max-width: 810px) {
	#index1, #index2, #index3, #index4, #index5 {

	}
}
</style>

</head>
<!--/head-->

<body>

	<jsp:include page="./common/header.jsp" />

	<!-- 모아드림 사이트명 -->
	<div class="jumbotron text-center"
		style="background-color: #282c2e; color: #fff; margin-top: 50px;">
		<h1 style="font-size: 36; font-weight: 500;">
			More <font style="color: #5486da">Dream</font>
		</h1>
	</div>
	
	<div class="jumbotron" id="index1">
		<font style="color: #fff;" size="14"><b>꿈 둘러보기</b></font><p><p>
		<div align="left" >
		<ul class="elements">
			<li class="wow fadeInUp" data-wow-duration="900ms"
				data-wow-delay="100ms" style="font-size: 20px"><i class="fa fa-angle-right"></i>  사이트 상단의 꿈 둘러보기를 클릭하면 모아드림에 게시된 꿈 목록을 보실 수 있습니다.</li>
			<li class="wow fadeInUp" data-wow-duration="800ms"
				data-wow-delay="200ms" style="font-size: 20px"><i class="fa fa-angle-right"></i>  꿈 목록의 오른쪽 배너에서 카테고리별로 상세 검색을 하실 수 있습니다.</li>
			<li class="wow fadeInUp" data-wow-duration="700ms"
				data-wow-delay="300ms" style="font-size: 20px"><i class="fa fa-angle-right"></i>  목록에 나타난 하나의 꿈을 클릭하면 해당 꿈의 상세 정보를 보실 수 있습니다.</li>
		</ul>
		</div>
	</div>
	
	<div class="jumbotron" id="index2">
		<font style="color: #fff;" size="14"><b>꿈 상세보기</b></font><p><p>
		<div align="left" >
		<ul class="elements">
			<li class="wow fadeInUp" data-wow-duration="900ms"
				data-wow-delay="100ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 꿈에 대한 이미지와 부가 설명 그리고 드리머에 대한 간략한 정보를 보여줍니다.</li>
			<li class="wow fadeInUp" data-wow-duration="800ms"
				data-wow-delay="200ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 오른쪽 배너에서 현재 해당 꿈의 후원 현황을 보실 수 있습니다. </li>
			<li class="wow fadeInUp" data-wow-duration="700ms"
				data-wow-delay="300ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 상세보기 하단의 탭에서 해당 꿈의 업데이트 현황 보기, 댓글 작성, 후원자 현황 보기 기능을 이용하실 수 있습니다.</li>
			</ul>
		</div>
	</div>

	<div class="jumbotron" id="index3">
			<font style="color: #fff;" size="14"><b>꿈 응원하기</b></font><p><p>
			<div align="left" >
				<ul class="elements">
					<li class="wow fadeInUp" data-wow-duration="900ms"
						data-wow-delay="100ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 꿈 상세 페이지에서 오른쪽 배너의 응원하기 버튼을 통해 해당 꿈을 후원하실 수 있습니다.</li>
					<li class="wow fadeInUp" data-wow-duration="800ms"
						data-wow-delay="200ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 꿈 프로젝트가 완료되면 받을 수 있는 보상 목록이 보여지게 됩니다. 보상은 하나만 선택하실 수 있습니다.</li>
					<li class="wow fadeInUp" data-wow-duration="700ms"
						data-wow-delay="300ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 응원한 결과(결제 결과)는 모아드림 현황에서 확인해 보실 수 있습니다.</li>
				</ul>
			</div>
	</div>

	<div class="jumbotron" id="index4">
		<font style="color: #fff;" size="14"><b>꿈 만들기</b></font><p><p>
		<div align="left" >
			<ul class="elements">
				<li class="wow fadeInUp" data-wow-duration="900ms"
					data-wow-delay="100ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 사이트 상단의 꿈 만들기를 클릭하면 사용자의 꿈을 모아드림에 신청하실 수 있습니다.</li>
				<li class="wow fadeInUp" data-wow-duration="800ms"
					data-wow-delay="200ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 먼저 꿈 신청 안내를 읽으시고 동의를 해주셔야 합니다.</li>
				<li class="wow fadeInUp" data-wow-duration="700ms"
					data-wow-delay="300ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 모아드림에서 제공하는 신청 양식에 맞춰 작성하여 신청을 완료 합니다.</li>
				<li class="wow fadeInUp" data-wow-duration="700ms"
					data-wow-delay="400ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 신청한 꿈은 나의 꿈 현황 페이지에서 확인하실 수 있고 
					관리자로부터 승인 처리를 받아 꿈 프로젝트 시작일에 꿈이 게시됩니다. &nbsp; &nbsp; (승인 처리 기간 : 약 일주일)</li>
			</ul>
		</div>
	</div>

	<div class="jumbotron" id="index5">
		<font style="color: #fff;" size="14"><b>꿈 업데이트</b></font><p><p>
		<div align="left" >
			<ul class="elements">
				<li class="wow fadeInUp" data-wow-duration="900ms"
					data-wow-delay="100ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 꿈을 개설한 사용자(드리머)는 해당 꿈의 진행 상황을 계속해서 업데이트 하실 수 있습니다.</li>
				<li class="wow fadeInUp" data-wow-duration="800ms"
					data-wow-delay="200ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 자신의 나의 꿈 현황의 하단에 있는 진행하고 있는 꿈 프로젝트 목록에서 업데이트 버튼을 클릭하시면 됩니다.</li>
			</ul>
		</div>
	</div>

	<div class="jumbotron" id="index6">
		<font style="color: #fff;" size="14"><b>계정 설정</b></font><p><p>
		<div align="left" >
			<ul class="elements">
				<li class="wow fadeInUp" data-wow-duration="900ms"
					data-wow-delay="100ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 모아드림의 핵심 기능인 꿈 만들기와 꿈 응원하기는 사이트에 회원가입을 하신후 사용가능 합니다.</li>
				<li class="wow fadeInUp" data-wow-duration="800ms"
					data-wow-delay="200ms" style="font-size: 20px"><i class="fa fa-angle-right"></i> 자신의 회원 정보는 로그인 후 사이트 상단에 나타나는 사용자 이름에서 확인 및 수정을 하실 수 있습니다.</li>
			</ul>
		</div>
	</div>
	
	<jsp:include page="./common/footer.jsp" />
	<!--/#footer-->
</body>
</html>
