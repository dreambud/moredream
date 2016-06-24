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
<title>Portfolio Three Columns | Triangle</title>
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
	
	<style type="text/css">
		.tdAlign{
			vertical-align: middle;
		}
	</style>
	
	<script type="text/javascript">
		function updateStateN(dreamId) {//승인거절
			if(confirm("정말 거절하시겠습니까?")){
				location.href="${initParam.root }dream.do?command=confirmRequestDream&&dreamId="+dreamId+"&&confirmRequestDream=N";
				
			}
		}
		function updateStateCancel(dreamId) {//승인취소
			if(confirm("해당 꿈에 대해 승인을 취소하시겠습니까?")){
				location.href="${initParam.root }dream.do?command=confirmRequestDream&&dreamId="+dreamId+"&&confirmRequestDream=N";
			}
		}
		function updateStateY(dreamId){//승인
			if(confirm("승인하시겠습니까?")){
				location.href="${initParam.root }dream.do?command=confirmRequestDream&&dreamId="+dreamId+"&&confirmRequestDream=Y";
			}
		}
	</script>
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
							<h1 class="title" align="center">꿈 신청 현황</h1>
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
						<div align="center" style="text-align:center;">
							<table class="table table-striped table-bordered table-hover" >
								<caption>신청현황</caption>
									<tr>
										<th style="text-align:center;">#</th>
										<th style="text-align:center;">신 청 자</th>
										<th style="text-align:center;" colspan='2'>꿈 제목</th>
										<th style="text-align:center;">신 청 일</th>
										<th style="text-align:center;">신청상태</th>
										<th style="text-align:center;">비    고</th>
									</tr>
								<tbody>
									<c:forEach items="${adminDreamList }" var="dream">
										<tr>
											<td class="tdAlign">${dream.dreamId}</td>
											<td>${dream.memberVO.email}</td>
											<td><img alt=""
												src="${initParam.root }upload/dream/${dream.dream_newFilename }" width="50px" height="50px" ></td>
											<td><a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dream.dreamId}">${dream.titleDream }</a></td>
											<td>${dream.requestDate}</td>
											<td>
												<c:choose>
													<c:when test="${dream.confirmRequestDream=='Y'}">
														<button type="button" class="btn btn-xs btn-success">승인완료</button><br>
													</c:when>
													<c:when test="${dream.confirmRequestDream=='N'}">
														<button type="button" class="btn btn-xs btn-danger">승인거절</button><br>
													</c:when>
													<c:otherwise>
														<button type="button" class="btn btn-xs btn-primary">승인중</button><br>
													</c:otherwise>
												</c:choose>
											</td>
											<td>
												<c:choose>
													<c:when test="${dream.confirmRequestDream=='Y'}">
														<button type="button" class="btn btn-xs btn-danger" onclick="updateStateCancel(${dream.dreamId})">승인취소</button>
													</c:when>
													<c:when test="${dream.confirmRequestDream=='N'}">
														<font color="red" size="2">/</font>
													</c:when>
													<c:otherwise>
														<button type="button" class="btn btn-xs btn-success" onclick="updateStateY(${dream.dreamId})">승인</button>
														<button type="button" class="btn btn-xs btn-danger" onclick="updateStateN(${dream.dreamId})">거절</button>
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






	<jsp:include page="../common/footer.jsp" />



</body>
</html>
