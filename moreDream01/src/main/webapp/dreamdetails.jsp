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
<title>Blog Details | Triangle</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

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
<script type="text/javascript">
	var switchTo5x = true;
</script>
<script type="text/javascript"
	src="http://w.sharethis.com/button/buttons.js"></script>
<script type="text/javascript">
	stLight.options({
		publisher : "7e8eb33b-fbe0-4915-9b93-09490e3d10df",
		doNotHash : false,
		doNotCopy : false,
		hashAddressBar : false
	});
</script>
</head>
<!--/head-->

<body>
	<jsp:include page="./header.jsp" />

	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">Dream Details</h1>
							<p>꿈 내용</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#page-breadcrumb-->

	<section id="blog-details" class="padding-top">
		<div class="container">
			<div class="row">
				<div class="col-md-9 col-sm-7">
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="single-blog blog-details two-column">
								<div class="post-thumb" align="center">
									<img src="./upload/dream/${dreamVO.dream_newFilename}"
										class="img-responsive" alt="">
								</div>
								<div class="post-content overflow">
									<h2 class="post-title bold">${dreamVO.titleDream}</h2>
									<h3 class="post-author">
										<p>${dreamVO.detailDream}</p>
									</h3>

									<div class="post-bottom overflow">
										<ul class="nav navbar-nav post-nav">
											<li><a href="#"><i class="fa fa-tag"></i>Creative</a></li>
											<li><a href="#"><i class="fa fa-heart"></i>32 Love</a></li>
											<li><a href="#"><i class="fa fa-comments"></i>3
													Comments</a></li>
										</ul>
									</div>
									<div class="blog-share">
										<span class='st_facebook_hcount'></span> <span
											class='st_twitter_hcount'></span> <span
											class='st_linkedin_hcount'></span> <span
											class='st_pinterest_hcount'></span> <span
											class='st_email_hcount'></span>
									</div>
									<div class="author-profile padding">
										<div class="row">
											<div class="col-sm-2">
													<!-- 수정 160614 -->
												<c:choose>
													<c:when test="${dreamVO.memberVO.member_newFilename==' ' }">
														<img src="./upload/member/member_df.jpg" alt="">
													</c:when>
													<c:otherwise>
														<img alt=""
															src="./upload/member/${dreamVO.memberVO.member_newFilename }">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="col-sm-10">
												<h3>EMAIL : ${dreamVO.memberVO.email}</h3>
												<p>HP : ${dreamVO.memberVO.phoneNumber}</p>
												<span>Website:<a href="www.jooomshaper.com">
														www.jooomshaper.com</a></span>
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<ul id="tab1" class="nav nav-tabs">
											<li class="active"><a href="#tab1-item1"
												data-toggle="tab">업데이트</a></li>
											<li><a href="#tab1-item2" data-toggle="tab">댓글</a></li>
											<li><a href="#tab1-item3" data-toggle="tab">후원자</a></li>
										</ul>

										<!-- 업데이트 -->
										<div class="tab-content">
											<div class="tab-pane fade active in" id="tab1-item1">
												<div class="col-sm-12 col-md-12">
													<div class="single-blog single-column">
														<c:choose>
															<c:when test="${updateDreamList!=null }">
																<c:forEach items="${updateDreamList}" var="updateDream">
																	<div class="post-thumb">
																		<img
																			src="./upload/dream/${updateDream.update_newFilename}"
																			alt="">
																	</div>
																	<div class="post-content overflow">
																		<p>${updateDream.update_detailDream}</p>
																	</div>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<h3>업데이트 내용이 없습니다.</h3>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>

											<!-- 댓글 -->
											<div class="tab-pane fade" id="tab1-item2">
												<div>
													<c:choose>
														<c:when test="${mvo.member_newFilename==null}">
															<img src="./upload/member/member_df.jpg" alt=""
																width="50" height="50">
														</c:when>
														<c:otherwise>
															<img alt=""
																src="./upload/member/${mvo.member_newFilename }"
																width="50" height="50">
														</c:otherwise>
													</c:choose>
													&nbsp;&nbsp;&nbsp;&nbsp; 이름 : <input type="text"
														name="name" value="${mvo.name }" disabled="disabled">
												</div>
												<br>
												<div align="center">
													<form action="dream.do">
														<input type="hidden" name="command"
															value="writeReply">
														<input type="hidden" name="dreamId"
															value="${dreamVO.dreamId }">
														<c:choose>
															<c:when test="${is_dreamMaker==true }">
																<textarea rows="5" cols=125 name="content"></textarea>
																<div align="right">
																	<input type="submit" class="btn btn-lm btn-Info"
																		value="입력하기">
																</div>
																<br>
																<br>
															</c:when>
															<c:otherwise>
																<textarea rows="5" cols=125 name="content"
																	disabled="disabled">후원자만 입력가능합니다.</textarea>
																<div align="right">
																	<input type="submit"
																		class="btn btn-lm btn-Info disabled" value="입력하기">
																</div>
																<br>
																<br>
															</c:otherwise>
														</c:choose>
													</form>
												</div>

												<!-- 댓글 보여주기 -->
												<div class="response-area">
													<ul class="media-list">
														<c:choose>
															<c:when test="${replyList!=null }">
																<c:forEach items="${replyList}" var="reply">
																	<li class="media">
																		<div class="post-comment">
																		<div class="pull-left">
																			<c:choose>
																				<c:when test="${reply.memberVO.member_newFilename==null }">
																					<img
																				class="media-object" src="./upload/member/member_df.jpg"
																				alt="" width="80" height="80">
																				</c:when>
																				<c:otherwise>
																					<img
																				class="media-object" src="./upload/member/${reply.memberVO.member_newFilename}"
																				alt="" width="80" height="80">
																				</c:otherwise>
																			</c:choose>
																			
																		</div>
																			
																			
																			<div class="media-body">
																				<span><i class="fa fa-user"></i>Posted by <a
																					href="#">${reply.memberVO.name}</a></span>
																				<p>${reply.content}</p>
																				<ul class="nav navbar-nav post-nav">
																					<li><a href="#"><i class="fa fa-clock-o"></i>${reply.writeDate}</a></li>
																					<li><a href="#"><i class="fa fa-reply"></i>Reply</a></li>
																				</ul>
																			</div>
																		</div>

																	</li>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<h3>댓글이 없습니다.</h3>
															</c:otherwise>
														</c:choose>
													</ul>
												</div>
												<!--/Response-area-->
											</div>

											<!-- 후원자 -->
											<div class="tab-pane fade" id="tab1-item3">
												<div class="post-comment">
													<c:choose>
														<c:when test="${memberList!=null }">
															<c:forEach items="${memberList }" var="member">
																<div class="pull-left">
																	<img class="media-object"
																		src="./upload/member/${member.member_newFilename }"
																		alt="">
																</div>
																<div class="media-body">
																	<span><i class="fa fa-user"></i> ${member.name}</span>
																	<p>
																		<b>${member.name}</b>님이 응원 합니다 !
																	</p>
																</div>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<h3>첫번째 후원자가 되어주세요!!</h3>
														</c:otherwise>
													</c:choose>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-5">
					<div class="sidebar blog-sidebar">
						<div class="sidebar-item  recent">
							<h3>목표 3,000,000원 중 20% 모임</h3>
							<div class="media">
								<div class="pull-left"></div>
								<div class="media-body">
									<h4>
										<a href="#">현재 금액 1,000,000</a>
									</h4>
									<h4>함께하는 Dreamer 12명</h4>
									<h4>
										<a href="#">남은 시간 22일</a>
									</h4>
								</div>
							</div>
						</div>
						<p align="center">
							<a href="dream.do?command=getRewardByDreamId&&dreamId=${dreamVO.dreamId}"><button type="button" class="btn btn-primary btn-lg">응원하기</button></a>
						</p>
						<hr>
						<p>
							<font size="2">결제는 2016년 6월 29일 자정까지 최소 3,000,000원이 모여야만
								다함께 진행됩니다 </font>
						</p>

						<div class="sidebar-item tag-cloud">
							<h3>진행률</h3>
							<div class="progress">
								<div class="progress-bar progress-bar-striped active"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100" style="width: 120%">120%</div>
							</div>
						</div>
						<div class="sidebar-item popular">
							<h3>Latest Photos</h3>
							<ul class="gallery">
								<li><a href="#"><img
										src="images/portfolio/popular1.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="images/portfolio/popular2.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="images/portfolio/popular3.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="images/portfolio/popular4.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="images/portfolio/popular5.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="images/portfolio/popular1.jpg" alt=""></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#blog-->

	<jsp:include page="./footer.jsp" />


	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/lightbox.min.js"></script>
	<script type="text/javascript" src="js/wow.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
</body>
</html>
