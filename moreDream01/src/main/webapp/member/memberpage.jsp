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
						<hr width="25%">
							<h1 class="title">모아드림 현황보기</h1>
							<hr width="25%">
							<p>나의 꿈 프로젝트</p>
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
						<h2 class="page-header">내 꿈 후원 현황
						<!-- 160707 Modal 추가-->
						<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">
						<i class="fa fa-tasks" aria-hidden="true"></i>&nbsp;&nbsp;현재 진행 상태</button>
						</h2>
						<!-- modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog modal-md">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h3 class="modal-title">
										<i class="fa fa-tasks" aria-hidden="true"></i>
										후원하는 총 ${countPayment}개 꿈의 현재 진행 상태</h3>
									</div>
									<div class="modal-body">
									<c:choose>
									<c:when test="${countPayment>0}">
												<c:forEach items="${myDreamList}" var="my"
													varStatus="number">
													<c:if test="${my.paymentVO.paymentState=='Y'}">
														<div class="task-info" style="margin-bottom: 5px;">
																<a
																	href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${my.dreamVO.dreamId}"><font size="3px"><${my.dreamVO.titleDream}></font></a> 
																	<span class="label label-primary"><fmt:formatNumber
																	value="${(my.dreamVO.statVO.totalMoney/my.dreamVO.targetFund)*100}"
																	type="percent" pattern="0" />%</span> 
																
																	<c:if test="${my.dreamVO.statVO.endDay==0}">
																		<font color='red' size="2px">오늘 마감</font>
																	</c:if>
																	<c:if test="${my.dreamVO.statVO.endDay>0}">
																	<font size="2px">${my.dreamVO.statVO.endDay}일 남음</font>
																</c:if>
																	<c:if test="${my.dreamVO.statVO.endDay<0}">
																		<font color='blue' size="2px">마감</font>
																		<c:if
																			test="${((my.dreamVO.statVO.totalMoney/my.dreamVO.targetFund)*100)>=100}">
																		&
																		<font color='red' size="2px">성공</font>
																		</c:if>
																	</c:if>
																</div>
															
															<div class="progress">
																<c:if
																	test="${((my.dreamVO.statVO.totalMoney/my.dreamVO.targetFund)*100)>=100}">
																	<div class="progress-bar progress-bar-danger "
																		role="progressbar" aria-valuenow="40"
																		aria-valuemin="0" aria-valuemax="100"
																		style="width: 100%"></div>

																</c:if>

																<c:if
																	test="${(((my.dreamVO.statVO.totalMoney/my.dreamVO.targetFund)*100)>=0)&&(((my.dreamVO.statVO.totalMoney/my.dreamVO.targetFund)*100)<100)}">
																	<div class="progress-bar progress-bar-primary"
																		role="progressbar" aria-valuenow="40"
																		aria-valuemin="0" aria-valuemax="100"
																		style="width: ${(my.dreamVO.statVO.totalMoney/my.dreamVO.targetFund)*100}%"></div>

																</c:if>
															</div>
													</c:if>
												</c:forEach>
											</c:when>
								<c:otherwise>
									<div align="center" style="margin-bottom: 3em">
									<h3><b>현재 응원한 꿈이 없습니다.</b></h3>
									</div>
								</c:otherwise>
							</c:choose>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
						<!-- end modal -->
						<div align="center" style="text-align: center;">
						
						<c:choose>
							<c:when test="${lvo!=null }">
								<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">

								<caption></caption>

								<thead >
									<tr>
			                            <th style="text-align: center; width: 20%;" colspan='2'>꿈 제목</th>
			                            <th style="text-align: center; width: 9%;">마 감 일</th>
			                            <th style="text-align: center; width: 30%;">보상내용</th>
			                            <th style="text-align: center; width: 7%;">후원금액</th>
			                            <th style="text-align: center; width: 9%;">결 제 일</th>
			                            <!-- 160623 -->
			                            <th style="text-align: center; width: 5%">결제상태</th>
			                            <th style="text-align: center; width: 5%;">비 고</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${lvo.list}" var="my" varStatus="number">
										<tr>
											<td><img alt=""
												src="./upload/dream/${my.dreamVO.dream_newFilename}"
												width="50px" height="50px"></td>
											<td><a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${my.dreamVO.dreamId}">${my.dreamVO.titleDream}</a></td>
											<td>${my.dreamVO.endDate}</td>
											<td>${my.rewardVO.rewardInfo}</td>
											<td>${my.paymentVO.moneyView}</td>
											<td>${my.paymentVO.paymentDate }</td>
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
											<c:if test="${my.paymentVO.paymentState=='Y' && my.dreamVO.statVO.endDay>=0}">
												<button type="button" class="btn btn-xs btn-danger" onclick="payCancel('${my.rewardVO.rewardId}','${my.paymentVO.paymentId }');">취소</button>
											</c:if>
											<c:if test="${my.paymentVO.paymentState=='Y' && my.dreamVO.statVO.endDay<0}">
												<button type="button" class="btn btn-xs btn-info" style="cursor:default;">마감</button>
											</c:if>
											</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
							</div>
							<c:set var="pb" value="${requestScope.lvo.pb}"></c:set>

							<c:if test="${pb.previousPageGroup}">
								<a href="dream.do?command=myMoreDream&&pageNo=${pb.startPageOfPageGroup-1}">
								 <img alt="" src="${initParam.root }images/member/left_arrow_btn.gif">&nbsp;&nbsp;</a>	
							</c:if>
							
							<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
	
								<c:choose>
									<c:when test="${pb.nowPage!=i}">
										<a href="dream.do?command=myMoreDream&&pageNo=${i}">${i}</a> 
									</c:when>
									<c:otherwise>
										<span class="badge" style='color:#000'>${i}</span>
									</c:otherwise>
								</c:choose>
								&nbsp;
							</c:forEach>	
							
							<c:if test="${requestScope.lvo.pb.nextPageGroup}">
								<a href="dream.do?command=myMoreDream&&pageNo=${requestScope.lvo.pb.endPageOfPageGroup+1}">
								 <img alt="" src="${initParam.root }images/member/right_arrow_btn.gif"></a>
							</c:if>	
							
							</c:when>
							<c:otherwise>
								<h3 style="margin-top: 2em"><b>후원한 내역이 없습니다.</b></h3>
							</c:otherwise>
						</c:choose>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>




	<section id="blog" class="padding-top">

		<div class="container">
			<h2 class="page-header">나의 꿈 프로젝트</h2>
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<c:choose>
							<c:when test="${dreamList.size() !=0 }">
								<c:forEach items="${dreamList}" var="dream">
							<div class="col-md-4 col-sm-12 blog-padding-right">
								
								<div class="single-blog2 two-column">
									<div class="post-thumb">
										<a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dream.dreamId}">
										<img src="${initParam.root}upload/dream/${dream.dream_newFilename}"
											style="width: 350px; height: 260px" class="img-responsive"></a>
									</div>
									<div class="post-content overflow">
										<h2 class="post-title bold">
											<a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dream.dreamId}">${dream.titleDream}</a>
										</h2>
										<h3 class="post-author">
											<strong>Application Date : ${dream.requestDate}</strong>
										</h3>
										<%-- <p>${dream.detailDream}</p> --%>
									
										<c:choose>
										<c:when test="${dream.confirmRequestDream==' '}">
										<h2> 꿈 프로젝트가 심사중입니다.</h2>
										</c:when>
										<c:when test="${dream.confirmRequestDream=='Y'}">
										<h2>꿈 프로젝트가 승인되었습니다.</h2>
										<!-- 160623 업데이트 작성부분 추가 -->
										<p>
										<form action="${initParam.root}dream/updateDream.jsp" method="get" >
										<input type="hidden" name="dreamId" value="${dream.dreamId}">
										<input type="submit" class="btn btn-default btn-lg" value="꿈 프로젝트 업데이트">
										</form>
										</p>
										</c:when>
										<c:otherwise>
										<h2>거절되었습니다.</h2>
										</c:otherwise>
										</c:choose>
									</div>
								</div>
								
							</div>
						</c:forEach>
							</c:when>
							<c:otherwise>
							<div align="center" style="margin-bottom: 3em">
								<h3><b>신청된 꿈 프로젝트가 없습니다.</b></h3>
							</div>
								
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</section>





	<jsp:include page="../common/footer.jsp" />
	<!--/#footer-->



</body>
</html>
