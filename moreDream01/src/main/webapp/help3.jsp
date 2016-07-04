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

.jumbotron {
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

@media screen and (max-width: 810px) {
	#index1, #index2, #index3, #index4, #index5 {
		margin-left: 150px;
	}
}
</style>
<script type="text/javascript">
	function findDream() {
		location.href = "${initParam.root}dream.do?command=getAllListDream";
	}
	function registDream() {
		location.href = "${initParam.root}dream/createdream_info.jsp";
	}
</script>
</head>
<!--/head-->

<body>

	<jsp:include page="./common/header.jsp" />
				
				<!-- 모아드림 사이트명 -->
				<div class="jumbotron text-center"
					style="background-color: #282c2e; color: #fff; height: 230px;">
					<h1 style="font-size: 36; font-weight: 500;">
					More <font style="color: #5486da">Dream</font>
					</h1>
				</div>
		<div class="row">
			<div class="col-sm-4" style="padding-left: 0px;padding-right: 0px">
				<div class="jumbotron"
					style="background-color: #60C5B8;">
					<img src="${initParam.root }images/aboutus/dreamCnt.png" width="150"
						height="130" ><br><hr style="color: #fff; width: 50px;"><br>
						<font style="font-size: 2em; color: white;" class="wow fadeInUp" data-wow-duration="900ms"
				data-wow-delay="100ms">신청된 총 꿈 프로젝트 수 <br><br> <b>${dreamCnt }</b>개</font>
				</div>
			</div>	
			
			<div class="col-sm-4" style="padding-left: 0px;padding-right: 0px">
				<div class="jumbotron"
					style="background-color: #22ACC1;" >
					<img src="${initParam.root }images/aboutus/person.png" width="200"
						height="130"><br><hr style="color: #fff; width: 50px;"><br>
					<font style="font-size: 2em; color: white;" class="wow fadeInUp" data-wow-duration="900ms"
				data-wow-delay="100ms">총 회원 수 <br><br> <b>${ memberCnt}</b>명</font>
				</div>
			</div>
			
			<div class="col-sm-4" style="padding-left: 0px;padding-right: 0px">	
				<div class="jumbotron"
					style="background-color: #60C5B8;" >
					<img src="${initParam.root }images/aboutus/totalMoney.png" width="150"
						height="130" ><br><hr style="color: #fff; width: 50px;"><br>
						<font style="font-size: 2em; color: white;" class="wow fadeInUp" data-wow-duration="900ms"
				data-wow-delay="100ms">총 후원 금액 <br><br> <b>${totalMoney}</b>원</font>
				</div>
			</div>
	</div>


	<jsp:include page="./common/footer.jsp" />
	<!--/#footer-->
</body>
</html>
