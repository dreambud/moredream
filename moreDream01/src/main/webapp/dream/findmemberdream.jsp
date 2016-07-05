<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>More Dream</title>
<script type="text/javascript" src="${initParam.root}js/jquery.js"></script>
<script type="text/javascript"
	src="${initParam.root}js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${initParam.root}js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="${initParam.root}js/lightbox.min.js"></script>
<script type="text/javascript" src="${initParam.root}js/wow.min.js"></script>
<script type="text/javascript" src="${initParam.root}js/main.js"></script>
<link href="${initParam.root}css/bootstrap.min.css" rel="stylesheet">
<link href="${initParam.root}css/font-awesome.min.css" rel="stylesheet">
<link href="${initParam.root}css/lightbox.css" rel="stylesheet">
<link href="${initParam.root}css/animate.min.css" rel="stylesheet">
<link href="${initParam.root}css/main.css" rel="stylesheet">
<link href="${initParam.root}css/responsive.css" rel="stylesheet">

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
	<!--/#header-->

	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">
								<img class="img-circle"
									src="${initParam.root }upload/member/${rmvo.member_newFilename}"
									width="100px" height="100px">
								<h3 style="color: white; text-align: center">
									<strong>${rmvo.name}</strong>
								</h3>
								<h5 style="color: white; text-align: center">
									<c:if test="${countPayment>0}">
 &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-leaf" aria-hidden="true"></i>&nbsp;&nbsp;<strong>${countPayment}</strong>개 꿈을 응원한 Dreamaker <br>
									</c:if>
									<c:if test="${countCreateDream>0}">
										<i class="fa fa-leaf" aria-hidden="true"></i>&nbsp;&nbsp;<strong>${countCreateDream}</strong>개 꿈을 진행한 Dreamer
</c:if>

								</h5>
							</h1>

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
						<h2 class="page-header">
							<i class="fa fa-leaf" aria-hidden="true"></i>&nbsp;&nbsp;${rmvo.name}님의
							응원 꿈 <strong>${countPayment}</strong>개
						</h2>
						<div align="center" style="text-align: center;">
							<c:forEach items="${myDreamList}" var="dream">
								<c:if test="${dream.paymentVO.paymentState=='Y'}">
									<div class="portfolio-items">
										<div
											class="col-xs-6 col-sm-6 col-md-4 portfolio-item branded logos">
											<div class="portfolio-wrapper">
												<div class="portfolio-single">
													<div class="portfolio-thumb">
														<a
															href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dream.dreamVO.dreamId}">
															<img
															src="${initParam.root}upload/dream/${dream.dreamVO.dream_newFilename}"
															width="200px" height="250px"
															class="img-responsive img-rounded" alt=""
															style="height: 270px">
														</a>
													</div>
													<div class="portfolio-view">
														<ul class="nav nav-pills">
														</ul>
													</div>
												</div>

												<div class="portfolio-info">
													<img class="img-circle"
														src="./upload/member/${dream.memberVO.member_newFilename}"
														width="50px" height="50px"
														style="float: left; margin-top: 1em; margin-left: 30px;">

													<h2><${dream.dreamVO.titleDream}></h2>
													<h5 align="center" style="margin-bottom: 1em">
														<b>${dream.memberVO.name }</b>의 <b>${dream.dreamVO.category }
															꿈 프로젝트</b>
													</h5>
													<div class="progress">
														<c:if
															test="${((dream.dreamVO.statVO.totalMoney/dream.dreamVO.targetFund)*100)>=100}">
															<div class="progress-bar progress-bar-danger "
																role="progressbar" aria-valuenow="40" aria-valuemin="0"
																aria-valuemax="100" style="width: 100%"></div>
													</div>
								</c:if>

								<c:if
									test="${(((dream.dreamVO.statVO.totalMoney/dream.dreamVO.targetFund)*100)>=0)&&(((dream.dreamVO.statVO.totalMoney/dream.dreamVO.targetFund)*100)<100)}">
									<div class="progress-bar progress-bar-primary"
										role="progressbar" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100"
										style="width: ${(dream.dreamVO.statVO.totalMoney/dream.dreamVO.targetFund)*100}%"></div>
						</div>
						</c:if>


						<div class="post-bottom overflow">
							<p>
								모인 금액 ${dream.dreamVO.statVO.totalMoneyView} &nbsp;<span
									class="label label-primary"><fmt:formatNumber
										value="${(dream.dreamVO.statVO.totalMoney/dream.dreamVO.targetFund)*100}"
										type="percent" pattern="0" />%</span>
							</p>
							<p>
								<i class="fa fa-calendar"></i> &nbsp;
								<c:if test="${dream.dreamVO.statVO.endDay==0}">
									<font color='red'><b>오늘 마감</b></font>
								</c:if>
								<c:if test="${dream.dreamVO.statVO.endDay>0}">
앞으로 ${dream.dreamVO.statVO.endDay}일

<c:if
										test="${((dream.dreamVO.statVO.totalMoney/dream.dreamVO.targetFund)*100)>=100}">
										<font color='red'><b>HOT</b></font>
									</c:if>

								</c:if>
								<c:if test="${dream.dreamVO.statVO.endDay<0}">
									<font color='blue'><b>마감</b></font>

									<c:if
										test="${((dream.dreamVO.statVO.totalMoney/dream.dreamVO.targetFund)*100)>=100}">
&
<font color='red'><b>성공</b></font>
									</c:if>
								</c:if>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:if>
		</c:forEach>
		</div>
		</div>
		</div>
		</div>
		</div>
	</section>




	<section id="blog" class="padding-top">
		<div class="container">
			<c:if test="${countCreateDream>0}">
				<h2 class="page-header">
					<i class="fa fa-leaf" aria-hidden="true"></i>&nbsp;&nbsp;${rmvo.name}님의
					진행한 꿈 <strong>${countCreateDream}</strong>개
				</h2>
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<c:forEach items="${dreamList}" var="dream">
								<c:if test="${dream.confirmRequestDream=='Y'}">
									<div class="portfolio-items">
										<div
											class="col-xs-6 col-sm-6 col-md-4 portfolio-item branded logos">
											<div class="portfolio-wrapper">
												<div class="portfolio-single">
													<div class="portfolio-thumb">
														<a
															href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dream.dreamId}">
															<img
															src="${initParam.root}upload/dream/${dream.dream_newFilename}"
															width="200px" height="250px"
															class="img-responsive img-rounded" alt=""
															style="height: 270px">
														</a>
													</div>
													<div class="portfolio-view">
														<ul class="nav nav-pills">
														</ul>
													</div>
												</div>

												<div class="portfolio-info">
													<img class="img-circle"
														src="${initParam.root }upload/member/${rmvo.member_newFilename}"
														width="50px" height="50px"
														style="float: left; margin-top: 1em; margin-left: 30px;">

													<h2><${dream.titleDream}></h2>

													<h5 align="center" style="margin-bottom: 1em">
														<b>${rmvo.name }</b>의 <b>${dream.category } 꿈 프로젝트</b>
													</h5>
													<div class="progress">
														<c:if
															test="${((dream.statVO.totalMoney/dream.targetFund)*100)>=100}">
															<div class="progress-bar progress-bar-danger "
																role="progressbar" aria-valuenow="40" aria-valuemin="0"
																aria-valuemax="100" style="width: 100%"></div>
													</div>
								</c:if>

								<c:if
									test="${(((dream.statVO.totalMoney/dream.targetFund)*100)>=0)&&(((dream.statVO.totalMoney/dream.targetFund)*100)<100)}">
									<div class="progress-bar progress-bar-primary"
										role="progressbar" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100"
										style="width: ${(dream.statVO.totalMoney/dream.targetFund)*100}%"></div>
						</div>
			</c:if>


			<div class="post-bottom overflow">
				<p>
					모인 금액 ${dream.statVO.totalMoneyView} &nbsp;<span
						class="label label-primary"><fmt:formatNumber
							value="${(dream.statVO.totalMoney/dream.targetFund)*100}"
							type="percent" pattern="0" />%</span>
				</p>
				<p>
					<i class="fa fa-calendar"></i> &nbsp;
					<c:if test="${dream.statVO.endDay==0}">
						<font color='red'><b>오늘 마감</b></font>
					</c:if>
					<c:if test="${dream.statVO.endDay>0}">
앞으로 ${dream.statVO.endDay}일

<c:if test="${((dream.statVO.totalMoney/dream.targetFund)*100)>=100}">
							<font color='red'><b>HOT</b></font>
						</c:if>

					</c:if>
					<c:if test="${dream.statVO.endDay<0}">
						<font color='blue'><b>마감</b></font>

						<c:if
							test="${((dream.statVO.totalMoney/dream.targetFund)*100)>=100}">
&
<font color='red'><b>성공</b></font>
						</c:if>
					</c:if>
				</p>
			</div>
		</div>
		</div>
		</div>
		</div>
		</c:if>
		</c:forEach>
		</div>
		</div>
		</div>
		</c:if>
		</div>
	</section>


	<jsp:include page="../common/footer.jsp" />
	<!--/#footer-->

</body>
</html>
