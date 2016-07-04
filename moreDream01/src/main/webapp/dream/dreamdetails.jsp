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
<title>Blog Details | Triangle</title>
<link href="${initParam.root }css/bootstrap.min.css" rel="stylesheet">
<link href="${initParam.root }css/font-awesome.min.css" rel="stylesheet">
<link href="${initParam.root }css/lightbox.css" rel="stylesheet">
<link href="${initParam.root }css/animate.min.css" rel="stylesheet">
<link href="${initParam.root }css/main.css" rel="stylesheet">
<link href="${initParam.root }css/responsive.css" rel="stylesheet">
	<script type="text/javascript" src="${initParam.root }js/jquery.js"></script>
	<script type="text/javascript"
		src="${initParam.root }js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${initParam.root }js/lightbox.min.js"></script>
	<script type="text/javascript" src="${initParam.root }js/wow.min.js"></script>
	<script type="text/javascript" src="${initParam.root }js/main.js"></script>
<!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->
<!-- link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png"> -->

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

<script type="text/javascript">
function deleteComment(replyId) {
	if(confirm("삭제하시겠습니까?")){
		location.href="${initParam.root}dream.do?command=deleteCommentByReplyId&&replyId="+replyId+"&&dreamId=${dreamVO.dreamId}";
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
							<hr width="25%"><h1 class="title">${dreamVO.titleDream}</h1><hr width="25%">
							<p>${dreamVO.memberVO.name}의 ${dreamVO.category}프로젝트 </p>
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
									<img
										src="${initParam.root }upload/dream/${dreamVO.dream_newFilename}"
										class="img-responsive" alt="">
								</div>
								<div class="post-content overflow">
									<h2 class="post-title bold">${dreamVO.titleDream}</h2>
									<h3 class="post-author">
										<p>${dreamVO.detailDream}</p>
									</h3>

									
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
												<h3>Dreamer<i class="fa fa-leaf" aria-hidden="true"></i></h3>
												<c:choose>
													<c:when test="${dreamVO.memberVO.member_newFilename==' ' }">
														<img src="${initParam.root }upload/member/member_df.jpg"
															class="img-rounded">
													</c:when>
													<c:otherwise>
														<img alt=""
															src="${initParam.root }upload/member/${dreamVO.memberVO.member_newFilename }" class="img-rounded">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="col-sm-10" id="idbox1">
												
												${dreamVO.memberVO.email}
												${dreamVO.memberVO.name}
												<span><i class="fa fa-envelope-o fa-2x" aria-hidden="true"></i></span>
												<span><i class="fa fa-instagram fa-2x" aria-hidden="true"></i></span>
												<span><i class="fa fa-facebook-official fa-2x" aria-hidden="true"></i></span>
												<span><i class="fa fa-twitter fa-2x" aria-hidden="true"></i></span>
												
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<ul id="tab1" class="nav nav-tabs">
											<li class="active"><a href="#tab1-item1"
												data-toggle="tab">업데이트 <span class="label label-default">${updateDreamCount}</span></a></li>
											<li><a href="#tab1-item2" data-toggle="tab">댓글 <span class="label label-default">${replyCount }</span></a></li>
											<li><a href="#tab1-item3" data-toggle="tab">후원자 <span class="label label-default">${dreamMakerCount }</span></a></li>
										</ul>

										<!-- 업데이트 -->
										<div class="tab-content">
											<div class="tab-pane fade active in" id="tab1-item1">
												<div class="col-sm-12 col-md-12">
													<div class="single-blog single-column">
														<c:choose>
															<c:when test="${!updateDreamList.isEmpty()}">
																<c:forEach items="${updateDreamList}" var="updateDream">
																	<div class="post-thumb">
																		<img
																			src="${initParam.root }upload/dream/${updateDream.update_newFilename}"
																			alt="">
																	</div>
																	<div class="post-content overflow">
																		<p>${updateDream.update_detailDream}</p>
																	</div>
																	<!-- 160623 업데이트 날짜 추가 -->
																	<div class="post-content overflow">
																		<p class="updatedate">${updateDream.update_writeDate}</p>
																	</div>
																	<hr>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<h3>아직 업데이트 내용이 없습니다.</h3>
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
                                             <img src="${initParam.root }upload/member/member_df.jpg"
                                                alt="" width="50" height="50">
                                          </c:when>
                                          <c:otherwise>
                                             <img alt=""
                                                src="${initParam.root }upload/member/${mvo.member_newFilename }"
                                                width="50" height="50">
                                          </c:otherwise>
                                       </c:choose>
                                       &nbsp;&nbsp;&nbsp;&nbsp; 이름 : <input type="text"
                                          name="name" value="${mvo.name }" disabled="disabled">
                                    </div>
                                    <br>
                                    <div align="center">
                                       <form action="${initParam.root }dream.do">
                                          <input type="hidden" name="command" value="writeComment">
                                          <input type="hidden" name="dreamId"
                                             value="${dreamVO.dreamId }">
                                          <c:choose>
                                             <c:when test="${is_dreamMaker==true }">
                                                <textarea rows="5" cols=110 name="content"></textarea>
                                                <div align="right">
                                                   <input type="submit" class="btn btn-lm btn-default"
                                                      value="입력하기" id="btnmove">
                                                </div>
                                                <br>
                                                <br>
                                             </c:when>
                                             <c:when test="${dreamVO.memberVO.memberId == mvo.memberId }">
                                                <textarea rows="5" cols=110 name="content"></textarea>
                                                <div align="right">
                                                   <input type="submit" class="btn btn-lm btn-default"
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
                                             <c:when test="${!replyList.isEmpty()}">
                                                <c:forEach items="${replyList}" var="reply">
                                                   <li class="media">
                                                      <div class="post-comment">
                                                         <div class="pull-left">
                                                            <c:choose>
                                                               <c:when
                                                                  test="${reply.memberVO.member_newFilename==null }">
                                                                  <img class="media-object"
                                                                     src="${initParam.root }upload/member/member_df.jpg"
                                                                     alt="" width="80" height="80">
                                                               </c:when>
                                                               <c:otherwise>
                                                                  <img class="media-object"
                                                                     src="${initParam.root }upload/member/${reply.memberVO.member_newFilename}"
                                                                     alt="" width="80" height="80">
                                                               </c:otherwise>
                                                            </c:choose>

                                                         </div>


                                                         <div class="media-body">
                                                            <c:choose>
                                                               <c:when test="${dreamVO.memberVO.memberId==reply.memberVO.memberId }">
                                                                  <span><i class="fa fa-user"></i><b>작성자</b> ${reply.memberVO.name}</span>
                                                               </c:when>
                                                               <c:otherwise>
                                                                  <span><i class="fa fa-user"></i><b>후원자</b>  ${reply.memberVO.name}</span>
                                                               </c:otherwise>
                                                            </c:choose>
                                                            
                                                            <p>${reply.content}</p>
                                                            <ul class="nav navbar-nav post-nav">
                                                               <li><a href="#"><i class="fa fa-clock-o"></i>${reply.writeDate}</a></li>
                                                               <c:if
                                                                  test="${mvo.memberId==reply.memberVO.memberId}">
                                                                  <li><a href="#"
                                                                     onclick="deleteComment(${reply.replyId})"><i
                                                                        class="glyphicon glyphicon-remove"></i>삭제하기</a></li>
                                                               </c:if>
                                                            </ul>
                                                         </div>
                                                      </div>

                                                   </li>
                                                </c:forEach>
                                             </c:when>
                                             <c:otherwise>
                                                <hr>
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
														<c:when test="${!memberList.isEmpty()}">
															<c:forEach items="${memberList }" var="member">
																<div class="pull-left">
																	<img class="media-object"
																		src="${initParam.root }upload/member/${member.member_newFilename }"
																		alt="" width="80" height="80">
																</div>
																<div class="media-body">
																	<p id="media-padding">
																		<strong>${member.name}</strong><span>&nbsp;<i class="fa fa-leaf"></i></span> 님이 응원 합니다 !															</p>
																	<hr>
																</div>
																
															</c:forEach>
														</c:when>
														<c:otherwise>
															<h3>첫번째 후원자가 되어주실래요 ??</h3>
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
							<h3>
								목표금액 <b>${dreamVO.targetFundView}원</b> 중 <b><fmt:formatNumber
										value="${(dreamVO.statVO.totalMoney/dreamVO.targetFund)*100}"
										type="percent" pattern="0" />%</b> 모임
							</h3>
							<div class="media">
								<div class="pull-left"></div>
								<div class="media-body">
									<h4>
										현재 금액 <strong>${dreamVO.statVO.totalMoneyView}</strong>
									</h4>
									<h4>함께하는 Dreamer <strong>${dreamVO.statVO.supporterCnt }명</strong></h4>
									<h4>
										<c:choose>
											<c:when test="${dreamVO.statVO.endDay==0}">
												오늘이 마감일 입니다!
											</c:when>
											<c:when test="${dreamVO.statVO.endDay<0}">
											</c:when>
											<c:otherwise>
												남은 시간 <strong>${dreamVO.statVO.endDay}일</strong>
											</c:otherwise>
										</c:choose>
									</h4>
								</div>
							</div>
						</div>
						
						<p align="center">
							<c:choose>
								<c:when test="${mvo.memberId==dreamVO.memberVO.memberId}">

									<c:choose>
										<c:when test="${dreamVO.confirmRequestDream==' ' }">
											<b>심사중입니다...</b>
										</c:when>
										<c:when test="${dreamVO.confirmRequestDream=='N' }">
											<b>해당 꿈은 거절되었습니다.</b>
										</c:when>
										<c:otherwise>
											<form action="${initParam.root}dream/updateDream.jsp"
												method="get">
												<input type="hidden" name="dreamId" value="${dreamVO.dreamId}">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="hidden" name="memberId"
													value="${dreamVO.memberVO.memberId}"> <input
													type="submit" class="btn btn-default btn-lg"
													value="꿈 업데이트 하기">
											</form>
										</c:otherwise>
									</c:choose>

								</c:when>
								<c:when test="${is_dreamMaker==true }">
								당신은 이미 후원 하셨습니다!<br>
									<a href="${initParam.root }dream.do?command=myMoreDream">>
										후원내역 보기</a>
								</c:when>
								<c:when test="${dreamVO.statVO.endDay<0}">
									<b>해당 꿈은 마감되었습니다.</b>
								</c:when>
								<c:otherwise>
									<a
										href="${initParam.root }dream.do?command=getRewardByDreamId&&dreamId=${dreamVO.dreamId}"><button
											type="button" class="btn btn-default btn-lg">응원하기&nbsp;<i class="fa fa-leaf" aria-hidden="true"></i></button></a>
								</c:otherwise>
							</c:choose>

						</p>
						<hr>
						<p>
							<font size="2"><b>결제는<font color="red">
										${dreamVO.end_year}년 ${dreamVO.end_month}월 ${dreamVO.end_day}일
										자정</font>까지 <br> 최소 <font color="red">${dreamVO.targetFundView}원</font>이
									모여야만 <br> 꿈을 실현할 수 있습니다.
							</b></font>
						</p>

						<div class="sidebar-item tag-cloud">
							<h3>모금 진행률</h3>
							<p>
							<c:choose>
								<c:when test="${dreamVO.statVO.totalMoney!=0}">
									<c:if
										test="${((dreamVO.statVO.totalMoney/dreamVO.targetFund)*100)>=100}">
										<div class="progress-bar progress-bar-primary"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 100%">
											<fmt:formatNumber
												value="${(dreamVO.statVO.totalMoney/dreamVO.targetFund)*100}"
												type="percent" pattern="0" />
											%
										</div>
						</div>
						</c:if>
						<c:if
							test="${(((dreamVO.statVO.totalMoney/dreamVO.targetFund)*100)>=50)&&(((dreamVO.statVO.totalMoney/dreamVO.targetFund)*100)<100)}">
							<div class="progress-bar progress-bar-primary"
								role="progressbar" aria-valuenow="40" aria-valuemin="0"
								aria-valuemax="100"
								style="width: ${(dreamVO.statVO.totalMoney/dreamVO.targetFund)*100}">
								<fmt:formatNumber
									value="${(dreamVO.statVO.totalMoney/dreamVO.targetFund)*100}"
									type="percent" pattern="0" />
								%
							</div>
					</div>
					</c:if>
					<c:if
						test="${((dreamVO.statVO.totalMoney/dreamVO.targetFund)*100)<50}">
						<div class="progress-bar progress-bar-primary"
							role="progressbar" aria-valuenow="40" aria-valuemin="0"
							aria-valuemax="100" style="width: 30%">
							<fmt:formatNumber
								value="${(dreamVO.statVO.totalMoney/dreamVO.targetFund)*100}"
								type="percent" pattern="0" />
							%
						</div>
				</div>
				</c:if>
				</c:when>
				<c:otherwise>
					<div class="progress-bar progress-bar-warning active"
						role="progressbar" aria-valuenow="40" aria-valuemin="0"
						aria-valuemax="100" style="width: 100%">0%</div>
			</div>
			</c:otherwise>
			</c:choose>
		</div>

		<div class="sidebar-item  recent">
			<c:forEach items="${rewardList}" var="rl" varStatus="count">
				<div class="media">
					<div class="pull-left">
						<h3 class="page-header">
							<a
								href="${initParam.root }dream.do?command=getRewardByDreamId&&dreamId=${dreamVO.dreamId}"><strong>${rl.rewardGuide}</strong><span>원
									이상 응원시 혜택</span></a>
						</h3>
						<div class="media-body">
							<span class="badge badge-info">보상 내용</span><p>${rl.rewardInfo}</p>
								<span class="badge badge-info">재고 수량</span><p>${rl.stock} 개</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>


	<div class="sidebar blog-sidebar">
		<div class="sidebar-item popular">
			<h3>진행했던 꿈 프로젝트</h3>
			<ul class="gallery">
				<c:forEach items="${dreamList}" var="dream">
					<c:choose>
						<c:when test="${dreamList.size()==1 }">
							<div align="center">
								전에 진행했던 꿈 프로젝트가 없습니다.
							</div>
						</c:when>
						<c:when test="${dream.dream_newFilename!=dreamVO.dream_newFilename }">
							<li><a href="#"><img
								src="${initParam.root }upload/dream/${dream.dream_newFilename}"></a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
	</div>
	
		</div>
		</div>
		</div>
		</div>
	</section>
	<!--/#blog-->

	<jsp:include page="../common/footer.jsp" />
</body>
</html>
