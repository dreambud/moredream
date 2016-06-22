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
<script type="text/javascript" src="${initParam.root }js/jquery.js"></script>
<script type="text/javascript" src="${initParam.root }js/bootstrap.min.js"></script>
<script type="text/javascript" src="${initParam.root }js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="${initParam.root }js/lightbox.min.js"></script>
<script type="text/javascript" src="${initParam.root }js/wow.min.js"></script>
<script type="text/javascript" src="${initParam.root }js/main.js"></script>
<link href="${initParam.root }css/bootstrap.min.css" rel="stylesheet">
<link href="${initParam.root }css/font-awesome.min.css" rel="stylesheet">
<link href="${initParam.root }css/lightbox.css" rel="stylesheet">
<link href="${initParam.root }css/animate.min.css" rel="stylesheet">
<link href="${initParam.root }css/main.css" rel="stylesheet">
<link href="${initParam.root }css/responsive.css" rel="stylesheet">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

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
	
</head>
<!--/head-->

<body>

	<jsp:include page="../common/header.jsp" />

	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">꿈 꾸기</h1>
							<p>당신의 꿈을 실현시켜보세요 !</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#page-breadcrumb-->
	<form action="${initParam.root }dream.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="command" value="registerReward">
	<input type="hidden" name="dreamId" value="${dreamId }">
		<section id="shortcodes">
			<div class="container">
				<div id="feature-container">
					<div class="row">
						<div class="col-md-12">
							<h2 class="page-header">보상 등록</h2>
							<div class="col-md-12">
								<div align="center">
									<h2 class="page-header" align="left">보상 내용</h2>
									<textarea class="form-control" rows="2" name="rewardInfo"></textarea>

									<h2 class="page-header" align="left">보상 기준 금액</h2>
									<textarea class="form-control" rows="2" name="rewardGuide"></textarea>

									<h2 class="page-header" align="left">보상 갯수</h2>
									<textarea class="form-control" rows="2" name="stock"></textarea>
								</div>

								<h2 class="page-header"></h2>
								&nbsp;
								<div align="right">
									<button type="submit" class="btn btn-lg btn-primary">
										<i class="fa fa-heart"></i> 보상 등록
									</button>
									&nbsp;
								</div>
								&nbsp;

							</div>
						</div>
					</div>
				</div>
				<!--/#feature-container-->
			</div>
		</section>
	</form>




	<jsp:include page="../common/footer.jsp"/>
	<!--/#footer-->



</body>
</html>
