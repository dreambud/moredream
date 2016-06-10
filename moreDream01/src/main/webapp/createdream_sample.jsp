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


<title>More Dream</title>



<!-- datePicker -->
<script type="text/javascript" src="js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="css/datepicker3.css" />
<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker.kr.js"></script>
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

<script type="text/javascript">
	$('#datepicker').datepicker({
		format : "yyyy-mm-dd",
		language : "kr"
	});
</script>


<body>
	<jsp:include page="./header.jsp"/>

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
	<section id="shortcodes">
		<div class="container">
			<div id="feature-container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="page-header">Features</h2>
					</div>

					<h4 align="right">당신의 꿈을 이뤄보세요 !</h4>


					<form action="./dream.do" method="post" enctype="mutipart/form-data">
					<input type="hidden" name="command" value="requestDream">
						카테고리 선택 
						<select>
							<option value="영화">movie</option>
							<option value="출판">출판</option>
							<option value="음악">음악</option>
						</select>


						<div align="center">
							꿈 제목
							<textarea class="form-control" rows="2"></textarea>


							꿈 내용
							<textarea class="form-control" rows="5"></textarea>


							<input type="file" name="multipartFile">
							
							<input type="submit" value="신청하기">
					</form>
				</div>
			</div>
		</div>
		<!--/#feature-container-->
		</div>
	</section>


	Date:
	<input type="text" id="datepicker">

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
