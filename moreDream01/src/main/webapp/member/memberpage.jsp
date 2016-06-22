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
<script type="text/javascript" src="${initParam.root}js/jquery.js"></script>
<script type="text/javascript" src="${initParam.root}js/bootstrap.min.js"></script>
<script type="text/javascript" src="${initParam.root}js/jquery.isotope.min.js"></script>
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
	
	<script type="text/javascript">
		function payCancel(rewardId,paymentId){
			if(confirm("결제를 취소하시겠습니까?")){
				location.href='${initParam.root}dream.do?command=cancelPayment&&paymentId='+paymentId+'&&rewardId='+rewardId;
			}else{
				
			}
		}
	</script>
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
							<h1 class="title">모아드림 현황보기</h1>
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
						<div align="center" style="text-align: center;">
							<table class="table table-striped table-bordered table-hover">

								<caption></caption>

								<thead>
									<tr>
										<th style="text-align: center;">#</th>
										<th style="text-align: center;" colspan='2'>꿈 제목</th>
										<th style="text-align: center;">마 감 일</th>
										<th style="text-align: center;">보상내용</th>
										<th style="text-align: center;">후원금액</th>
										<th style="text-align: center;">결제상태</th>
										<th style="text-align: center;">비 고</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${myDreamList}" var="my" varStatus="number">
										<tr>
											<td class="tdAlign">${number.count}</td>
											<td><img alt=""
												src="./upload/dream/${my.dreamVO.dream_newFilename}"
												width="50px" height="50px"></td>
											<td><a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${my.dreamVO.dreamId}">${my.dreamVO.titleDream}</a></td>
											<td>${my.dreamVO.endDate}</td>
											<td>${my.rewardVO.rewardInfo}</td>
											<td>${my.paymentVO.money}</td>
											<td>
											<c:choose>
											<c:when test="${my.paymentVO.paymentState=='Y'}">
												<button type="button" class="btn btn-xs btn-success" style="cursor:default;">결제완료</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-xs btn-danger" style="cursor:default;">결제취소</button>
											</c:otherwise>
											</c:choose>
												
											</td>
											<td>
											<c:choose>
											<c:when test="${my.paymentVO.paymentState=='Y' && my.dreamVO.statVO.endDay>0}">
												<button type="button" class="btn btn-xs btn-danger" onclick="payCancel('${my.rewardVO.rewardId}','${my.paymentVO.paymentId }');">취소</button>
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
											</c:choose>
											</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>




	<section id="blog" class="padding-top">

		<div class="container">
			<h2 class="page-header">내가 진행하고 있는 꿈 목록</h2>
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<c:forEach items="${dreamList}" var="dream">
							<div class="col-md-4 col-sm-12 blog-padding-right">
								<div class="single-blog two-column">
									<div class="post-thumb">
										<a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dream.dreamId}"><img
											src="${initParam.root}upload/dream/${dream.dream_newFilename}"
											class="img-responsive" alt="" width="480" height="270"></a>
									</div>
									<div class="post-content overflow">
										<h2 class="post-title bold">
											<a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dream.dreamId}">${dream.detailDream}</a>
										</h2>
										<h3 class="post-author">
											<strong>Application Date : ${dream.requestDate}</strong>
										</h3>
										<%-- <p>${dream.detailDream}</p> --%>
									
										<c:choose>
										<c:when test="${dream.confirmRequestDream==' '}">
										<h2>심사중</h2>
										</c:when>
										<c:when test="${dream.confirmRequestDream=='Y'}">
										<h2>승인완료</h2>
										</c:when>
										<c:otherwise>
										<h2>거절되었습니다.</h2>
										</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>





	<jsp:include page="../common/footer.jsp" />
	<!--/#footer-->



</body>
</html>
