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

<body onload="loginCheck()">
	<jsp:include page="./header.jsp" />
	<!--/#header-->

	<section id="shortcodes">
		<div class="container">
			<div id="feature-container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="page-header">내 꿈 목록</h2>
						<div align="center" style="text-align: center;">
							<table class="table table-striped table-bordered table-hover">

								<caption></caption>

								<thead>
									<tr>
										<th style="text-align: center;">#</th>
										<th style="text-align: center;" colspan='2'>꿈 제목</th>
										<th style="text-align: center;">마 감 일</th>
										<th style="text-align: center;">응원현황</th>
										<th style="text-align: center;">결제상태</th>
										<th style="text-align: center;">비    고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="tdAlign">1</td>
										<td><img alt=""
											src="./upload/dream/1465541268977_시연용 파일.jpg" width="50px"
											height="50px"></td>
										<td><a href="#">꿈 제목</a></td>
										<td>마감일</td>
										<td>응원 금액</td>
										<td><button type="button" class="btn btn-xs btn-success">결제완료</button>
											<button type="button" class="btn btn-xs btn-danger">결제취소</button></td>
										<td>-</td>
									</tr>

								</tbody>
							</table>
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
						<h2 class="page-header">내 꿈 목록</h2>
						<table class="table table-striped table-bordered table-hover">

							<caption></caption>

							<thead>
								<tr>
									<th>#</th>
									<th>꿈 제목</th>
									<th>마감일</th>
									<th>응원 현황</th>
									<th>결제 상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td><a href="#">꿈 제목</a></td>
									<td>마감일</td>
									<td>응원 금액</td>
									<td><button type="button" class="btn btn-xs btn-success">결제완료</button>
										<button type="button" class="btn btn-xs btn-danger">결제취소</button></td>
								</tr>

							</tbody>

							<tbody>
								<tr>
									<td>2</td>
									<td><a href="#">꿈 제목</a></td>
									<td>마감일</td>
									<td>응원 금액</td>
									<td><button type="button" class="btn btn-xs btn-success">결제완료</button>
										<button type="button" class="btn btn-xs btn-danger">결제취소</button></td>
								</tr>

							</tbody>

							<tbody>
								<tr>
									<td>3</td>
									<td><a href="#">꿈 제목</a></td>
									<td>마감일</td>
									<td>응원 금액</td>
									<td><button type="button" class="btn btn-xs btn-success">결제완료</button>
										<button type="button" class="btn btn-xs btn-danger">결제취소</button></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="blog" class="padding-top">

		<div class="container">
			<h2 class="page-header">함께 꾸는 꿈</h2>
			<div class="row">
				<div class="col-md-12">
					<div class="row">


						<div class="col-md-4 col-sm-12 blog-padding-right">
							<div class="single-blog two-column">
								<div class="post-thumb">
									<a href="blogdetails.html"><img
										src="images/blog/timeline/1.jpg" class="img-responsive" alt=""></a>
									<div class="post-overlay">
										<span class="uppercase"><a href="#">14 <br> <small>Feb</small></a></span>
									</div>
								</div>
								<div class="post-content overflow">
									<h2 class="post-title bold">
										<a href="blogdetails.html">Advanced business cards design</a>
									</h2>
									<h3 class="post-author">
										<a href="#">Posted by micron News</a>
									</h3>
									<p>Duis autem vel eum iriure dolor in hendrerit in
										vulputate velit esse molestie consequat, vel illum dolore eu
										feugiat nulla facilisis at vero eros et accumsan et iusto odio
										dignissim qui blandit praesent luptatum zzril delenit augue
										duis dolore te feugait nulla facilisi. Nam liber [...]</p>
									<div class="progress">
										<div class="progress-bar progress-bar-striped active"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 80%">80%</div>
									</div>
									<div class="post-bottom overflow">
										<ul class="nav navbar-nav post-nav">
											<li><a href="#"><i class="fa fa-tag"></i>모인 금액
													12,000,000</a></li>
											<br>
											<li><a href="#"><i class="fa fa-heart"></i> 후원자 123</a></li>
											<br>
											<li><a href="#"><i class="fa fa-comments"></i> 앞으로
													13일</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>





	<jsp:include page="./footer.jsp" />
	<!--/#footer-->



</body>
</html>
