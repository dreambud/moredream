<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>More Dream</title>
<link href="${initParam.root}css/bootstrap.min.css" rel="stylesheet">
<link href="${initParam.root}css/font-awesome.min.css" rel="stylesheet">
<link href="${initParam.root}css/lightbox.css" rel="stylesheet">
<link href="${initParam.root}css/animate.min.css" rel="stylesheet">
<link href="${initParam.root}css/main.css" rel="stylesheet">
<link href="${initParam.root}css/responsive.css" rel="stylesheet">
<script type="text/javascript" src="${initParam.root}js/jquery.js"></script>
<script type="text/javascript" src="${initParam.root}js/bootstrap.min.js"></script>
<script type="text/javascript" src="${initParam.root}js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="${initParam.root}js/lightbox.min.js"></script>
<script type="text/javascript" src="${initParam.root}js/wow.min.js"></script>
<script type="text/javascript" src="${initParam.root}js/main.js"></script>

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
<script>
	if(${dreamList==null})
	{
		location.replace("${initParam.root}dream.do?command=getAllListDream");
	}
</script>
	<jsp:include page="../common/header.jsp" />
	
	<!--/#header-->

	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<hr width="25%"><h1 class="title">
							꿈 둘러보기
							</h1><hr width="25%">
							<p>
							<c:choose>
							<c:when test="${(keyword!=null)}">&nbsp;&nbsp;<font size="4"><b><font color="blue">"${keyword}"</font></b> 에 대한 검색결과 총 <b>${dreamList.size()}</b>건</font></c:when>
							<c:when test="${(category==null)||(category=='none')||(category=='')}">(전체)</c:when>
							<c:otherwise>
								(${category})
							</c:otherwise>
							</c:choose>
							
							<p></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#page-breadcrumb-->


	<section id="projects1">
		<div class="container">
			<div class="row" id="finddream">
				<div class="col-md-9 col-sm-8">
					<div class="row">
					<div class="col-sm-3">
     						
     				</div>
						<ul class="portfolio-filter text-right" style="margin: 90px 20px 30px 0px;">
						<li>
							<select onchange="searchFilter('${category}')" id="filter"
								class="form-control" class="span3">
									
									<c:choose>
									<c:when test="${requestScope.filter==0}"><option value="0" selected="selected"></c:when>
									<c:otherwise>
										<option value="0">
									</c:otherwise>
									</c:choose>필터</option>
									<c:choose>
									<c:when test="${requestScope.filter==1}"><option value="1" selected="selected"></c:when>
									<c:otherwise>
										<option value="1">
									</c:otherwise>
									</c:choose>새로운 꿈</option>
									<c:choose>
									<c:when test="${requestScope.filter==2}"><option value="2" selected="selected"></c:when>
									<c:otherwise>
										<option value="2">
									</c:otherwise>
									</c:choose>마감 임박</option>
									<c:choose>
									<c:when test="${requestScope.filter==3}"><option value="3" selected="selected"></c:when>
									<c:otherwise>
										<option value="3">
									</c:otherwise>
									</c:choose>최다 후원</option>
									<c:choose>
									<c:when test="${requestScope.filter==4}"><option value="4" selected="selected"></c:when>
									<c:otherwise>
										<option value="4">
									</c:otherwise>
									</c:choose>최고 후원</option>
							</select>
						</li>
						</ul>
						<!--/#dream-filter-->
						
						<c:forEach items="${dreamList}" var="dream">
							<c:if test="${dream.confirmRequestDream=='Y'}">
								
								<div class="portfolio-items">
									<div class=" col-md-4 col-sm-9 portfolio-item branded logos">
										<div class="portfolio-wrapper">
											<div class="portfolio-single">
												<div class="portfolio-thumb">
												<a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dream.dreamId}">
													<img src="${initParam.root}upload/dream/${dream.dream_newFilename}"
														width="200px" height="250px" class="img-responsive img-rounded" alt=""
														style="height: 270px"></a>
												</div>
											</div>
											<div class="portfolio-info">
												<h2>
												<c:choose>
												<c:when test="${dream.titleDream.length()<19}">
													&lt;${dream.titleDream}&gt;
												</c:when>
												<c:otherwise>
													&lt;${dream.titleDream.substring(0,19)}..&gt;
												</c:otherwise>
												</c:choose>
												</h2>
												
												<h5 align="center">
														<b>${dream.memberVO.name }</b>의 <b>${dream.category } 꿈 프로젝트</b>
													</h5>
												
												<div class="progress">
													<c:if test="${((dream.statVO.totalMoney/dream.targetFund)*100)>=100}">
														<div class="progress-bar progress-bar-danger "
														role="progressbar" aria-valuenow="40" aria-valuemin="0"
														aria-valuemax="100" style="width: 100%"></div>
												</div>
													</c:if>
													
													<c:if test="${(((dream.statVO.totalMoney/dream.targetFund)*100)>=0)&&(((dream.statVO.totalMoney/dream.targetFund)*100)<100)}">
														<div class="progress-bar progress-bar-primary"
														role="progressbar" aria-valuenow="40" aria-valuemin="0"
														aria-valuemax="100" style="width: ${(dream.statVO.totalMoney/dream.targetFund)*100}%"></div>
														</div>
													</c:if>
												<div class="post-bottom overflow">
														<p>모인 금액
																${dream.statVO.totalMoneyView} &nbsp;
																<c:choose>
																<c:when test="${(dream.statVO.totalMoney/dream.targetFund)*100>=100}">
																<span class="label label-danger">
																</c:when>
																<c:otherwise>
																<span class="label label-primary">
																</c:otherwise>
																</c:choose>
																<fmt:formatNumber value="${(dream.statVO.totalMoney/dream.targetFund)*100}" type="percent" pattern="0"/>%</span></p>
														<p><i class="fa fa-calendar"></i> &nbsp;
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
																	
																	<c:if test="${((dream.statVO.totalMoney/dream.targetFund)*100)>=100}">
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
					
						<div class="portfolio-pagination">
							<c:choose>
							<c:when test="${dreamList[0]==null}">
								등록된 자료가 없습니다.
							</c:when>
							<c:otherwise>
							<!-- <ul class="pagination">
								<li><a href="#">left</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li class="active"><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">6</a></li>
								<li><a href="#">7</a></li>
								<li><a href="#">8</a></li>
								<li><a href="#">9</a></li>
								<li><a href="#">right</a></li>
							</ul> -->
							</c:otherwise>
							</c:choose>
						</div>
				
				<div class="col-md-3 col-sm-4 padding-top1 hidden-xs">
					<div class="sidebar portfolio-sidebar">
						<div class="sidebar-item categories">
							<h3>Dream Categories</h3>
							<input type="hidden" name="category" id="category" value="${requestScope.category}">
							<ul class="nav navbar-stacked">
								<c:choose>
									<c:when test="${(category==null)||(category=='none')||(category=='')}">
									<li class="active">
									</c:when>
									<c:otherwise>
									<li>
									</c:otherwise>
								</c:choose><a href="javascript:searchFilter('none')">Total<span class="pull-right"><span class="badge">${totalCnt}</span></span></a></li>
								<c:choose>
									<c:when test="${(category=='디자인')}">
									<li class="active">
									</c:when>
									<c:otherwise>
									<li>
									</c:otherwise>
								</c:choose><a href="javascript:searchFilter('디자인')">디자인<span class="pull-right"><span class="badge">${designCnt}</span></span></a></li>
								<c:choose>
									<c:when test="${(category=='패션')}">
									<li class="active">
									</c:when>
									<c:otherwise>
									<li>
									</c:otherwise>
								</c:choose><a href="javascript:searchFilter('패션')">패션<span class="pull-right"><span class="badge">${fashionCnt}</span></span></a></li>
								<c:choose>
									<c:when test="${(category=='출판')}">
									<li class="active">
									</c:when>
									<c:otherwise>
									<li>
									</c:otherwise>
								</c:choose><a href="javascript:searchFilter('출판')">출판<span class="pull-right"><span class="badge">${publishCnt}</span></span></a></li>
								<c:choose>
									<c:when test="${category=='요리'}">
									<li class="active">
									</c:when>
									<c:otherwise>
									<li>
									</c:otherwise>
								</c:choose><a href="javascript:searchFilter('요리')">요리<span class="pull-right"><span class="badge">${cookingCnt}</span></span></a></li>
								<c:choose>
									<c:when test="${category=='음악'}">
									<li class="active">
									</c:when>
									<c:otherwise>
									<li>
									</c:otherwise>
								</c:choose><a href="javascript:searchFilter('음악')">음악<span class="pull-right"><span class="badge">${musicCnt}</span></span></a></li>
								<c:choose>
									<c:when test="${category=='공연'}">
									<li class="active">
									</c:when>
									<c:otherwise>
									<li>
									</c:otherwise>
								</c:choose><a href="javascript:searchFilter('공연')">공연<span class="pull-right"><span class="badge">${concertCnt}</span></span></a></li>
								<c:choose>
									<c:when test="${category=='영화'}">
									<li class="active">
									</c:when>
									<c:otherwise>
									<li>
									</c:otherwise>
								</c:choose><a href="javascript:searchFilter('영화')">영화<span class="pull-right"><span class="badge">${movieCnt}</span></span></a></li>
								</ul>
						</div>
						<div class="sidebar-item  recent">
							<h3>Recent Dreams</h3>
							<c:forEach items="${requestScope.recentProjects}" var="rp" end="2">
							<div class="media" style="padding-left: 3%; padding-right: 3%">
								<div class="pull-left">
									<a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${rp.dreamId}"><img src="${initParam.root}upload/dream/${rp.dream_newFilename}" style="width: 52px; height: 52px" alt=""></a>
								</div>
								<div class="media-body">
									<h4>
										<a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${rp.dreamId}">
										<font size="2">${rp.titleDream}</font></a>
									</h4>
									<p><b>마감일</b> ${rp.end_year}년 ${rp.end_month}월 ${rp.end_day}일</p>
								</div>
							</div>
							</c:forEach>
						</div>
						<div class="sidebar-item popular">
							<h3>Popular Dreams</h3>
							<ul class="gallery">
							<c:forEach items="${requestScope.popularProjects}" var="pp" end="5">
								<li><a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${pp.dreamId}">
								<img src="${initParam.root}upload/dream/${pp.dream_newFilename}" style="width: 66px; height: 66px" alt=""></a></li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#projects-->

	<jsp:include page="../common/footer.jsp" />
	<!--/#footer-->
	<script type="text/javascript">
		function searchFilter(category) {
			document.getElementById('category').value = category;			
			var filter = document.getElementById('filter').value;
			
			location.href = "${initParam.root}dream.do?command=getAllListDream&&filter="
					+ filter+"&&category="+category;
		}
		
	</script>
	
</body>
</html>
