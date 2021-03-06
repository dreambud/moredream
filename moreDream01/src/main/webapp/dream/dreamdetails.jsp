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
<link rel="shortcut icon" type="image/x-icon" href="${initParam.root }favicon.ico" />
<style type="text/css">
	.comments{
	display: none;
}
</style>
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

<script type="text/javascript">
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
    
    $(".comments").slice(0, 5).show(); // select the first ten
    $("#load").click(function(e){ // click event for load more
        e.preventDefault();
        $(".comments:hidden").slice(0, 5).show(); // select next 10 hidden divs and show them
        if($(".comments:hidden").length == 0){ // check if any hidden divs still exist
           
            $('#commentDetailBtn').html("<b>더이상 댓글이 없습니다.</b>");
        }
    });
});
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
											<div class="col-sm-2 col-md-2">
												<!-- 수정 160614 -->
												<c:choose>
													<c:when test="${(dreamVO.memberVO.member_newFilename!='-'&&dreamVO.memberVO.member_newFilename!=''&&dreamVO.memberVO.member_newFilename!=' '&&dreamVO.memberVO.member_newFilename!='  ')}">
														<img class="img-rounded" src="./upload/member/${dreamVO.memberVO.member_newFilename}">
													</c:when>
													<c:when test="${dreamVO.memberVO.facebookId!=''&&dreamVO.memberVO.facebookId!=null}">
														<img class="img-rounded" src="http://graph.facebook.com/${dreamVO.memberVO.facebookId}/picture?type=large">
													</c:when>
													<c:otherwise>
														<img class="img-rounded" src="./upload/member/member_df.jpg">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="col-sm-12 col-md-6" id="idbox1">
												<p id="namebox"><font color="#60C5B8">Dreamer</font> <a
																			href="${initParam.root}dream.do?command=yourMoreDream&&memberId=${dreamVO.memberVO.memberId}&&facebookId=${dreamVO.memberVO.facebookId}&&member_newFilename=${dreamVO.memberVO.member_newFilename }&&name=${dreamVO.memberVO.name}"
																			data-toggle="tooltip" data-placement="bottom"
																			title="${dreamVO.memberVO.name}님의 꿈 보기">${dreamVO.memberVO.name} </a><i class="fa fa-leaf" aria-hidden="true"></i></p> 
												<p> <i class="fa fa-envelope " aria-hidden="true"></i> ${dreamVO.memberVO.email}</p>
												
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<ul id="tab1" class="nav nav-tabs">
											<li class="active"><a href="#tab1-item1"
												data-toggle="tab">Update <span class="label label-default">${updateDreamCount}</span></a></li>
											<li><a href="#tab1-item2" data-toggle="tab">Comment <span class="label label-default">${replyCount }</span></a></li>
											<li><a href="#tab1-item3" data-toggle="tab">Dream Maker <span class="label label-default">${dreamMakerCount }</span></a></li>
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
											<c:when test="${(mvo.member_newFilename!='-'&&mvo.member_newFilename!=''&&mvo.member_newFilename!=' '&&mvo.member_newFilename!='  ')&&mvo.member_newFilename!=null}">
												<img src="./upload/member/${mvo.member_newFilename}"width="50px" height="50px">
											</c:when>
											<c:when test="${mvo.facebookId!=''&&mvo.facebookId!=null}">
												<img src="http://graph.facebook.com/${mvo.facebookId}/picture?type=large"width="50px" height="50px">
											</c:when>
											<c:otherwise>
												<img src="./upload/member/member_df.jpg" width="50px" height="50px">
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
                                                   disabled="disabled">Dream Maker(후원자)만 입력가능합니다.</textarea>
                                                <div align="right">
                                                   <input type="submit"
                                                      class="btn btn-lm btn-default" value="입력하기">
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
                                                <c:if test="${reply.memberVO.name != '-'}">
                                                   <li class="media comments">
                                                      <div class="post-comment">
                                                         <div class="pull-left">
                                                            <c:choose>
																<c:when test="${(reply.memberVO.member_newFilename!='-'&&reply.memberVO.member_newFilename!=''&&reply.memberVO.member_newFilename!=' '&&reply.memberVO.member_newFilename!='  ')}">
																	<img class="media-object" src="./upload/member/${reply.memberVO.member_newFilename}"width="80px" height="80px">
																</c:when>
																<c:when test="${reply.memberVO.facebookId!=''&&reply.memberVO.facebookId!=null}">
																	<img class="media-object" src="http://graph.facebook.com/${reply.memberVO.facebookId}/picture?type=large"width="80px" height="80px">
																</c:when>
																<c:otherwise>
																	<img class="media-object" src="./upload/member/member_df.jpg" width="80px" height="80px">
																</c:otherwise>
															</c:choose>

                                                         </div>


                                                         <div class="media-body">
                                                            <c:choose>
                                                               <c:when test="${dreamVO.memberVO.memberId==reply.memberVO.memberId }">
                                                                  <span><i class="fa fa-user"></i><b style="color: red;">Dreamer</b> ${reply.memberVO.name}</span>
                                                               </c:when>
                                                               <c:otherwise>
                                                                  <span><i class="fa fa-user"></i><b>Dream Maker</b>  ${reply.memberVO.name}</span>
                                                               </c:otherwise>
                                                            </c:choose>
                                                            
                                                            <p>${reply.content}</p>
                                                            <ul class="nav navbar-nav post-nav">
                                                               <li><a href="#"><i class="fa fa-clock-o"></i>${reply.writeDate}</a></li>
                                                               <c:if
                                                                  test="${mvo.memberId==reply.memberVO.memberId}">
                                                                <li><a href="#" onclick="deleteComment(${reply.replyId})"><i   class="glyphicon glyphicon-remove"></i>삭제하기</a></li>
                                                               </c:if>
                                                            </ul>
                                                         </div>
                                                      </div>

                                                   </li>
                                                   </c:if>
                                                </c:forEach>
                                                
                                                	<div id="commentDetailBtn" style="text-align: center; margin-bottom: 30px;">
														<a href="#" id="load"><!-- <input type="submit" value="댓글 더 보기" data-toggle="modal" data-target="#alertModal"
															class="btn btn-primary btn-lg" style="width: 200px;"> -->
														<button
											type="button" data-toggle="modal" data-target="#alertModal" class="btn btn-default btn-lg">더보기&nbsp;<i class="fa fa-leaf" aria-hidden="true"></i></button>
															
														</a>
													</div>	
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
																<c:if test="${member.name != '-'}">
																<div class="pull-left">
																<c:choose>
															<c:when test="${(member.member_newFilename!='-'&&member.member_newFilename!=''&&member.member_newFilename!=' '&&member.member_newFilename!='  ')}">
																<img class="media-object" src="./upload/member/${member.member_newFilename}"width="80px" height="80px">
															</c:when>
															<c:when test="${member.facebookId!=''&&member.facebookId!=null}">
																<img class="media-object" src="http://graph.facebook.com/${member.facebookId}/picture?type=large"width="80px" height="80px">
															</c:when>
															<c:otherwise>
																<img class="media-object" src="./upload/member/member_df.jpg" width="80px" height="80px">
															</c:otherwise>
														</c:choose>
																</div>
																<div class="media-body">
																	<p id="media-padding">
																		<strong><a
																			href="${initParam.root}dream.do?command=yourMoreDream&&memberId=${member.memberId}&&facebookId=${member.facebookId}&&member_newFilename=${member.member_newFilename }&&name=${member.name}"
																			data-toggle="tooltip" data-placement="bottom"
																			title="${member.name}님의 꿈 보기">${member.name}</a></strong><span>&nbsp;<i
																			class="fa fa-leaf"></i></span> 님이 응원 합니다 ! <br>
																	</p>
																	<hr>
																</div>
																</c:if>

															</c:forEach>
														</c:when>
														<c:otherwise>
															<h3>첫번째 Dream Maker가 되어주실래요 ?</h3>
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
						<div class="sidebar-item  recent" style="margin-bottom: 23px;">
							<h3 style="margin-bottom: 10px;">
								목표금액 <b>${dreamVO.targetFundView}원</b> 중 <b><fmt:formatNumber
										value="${(dreamVO.statVO.totalMoney/dreamVO.targetFund)*100}"
										type="percent" pattern="0" />%</b> 모임
							</h3>
							<div class="media" style="padding-top: 10px;padding-bottom: 5px; ">
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
												method="get" style="text-align: center;">
												<input type="hidden" name="dreamId" value="${dreamVO.dreamId}">
												<input type="hidden" name="memberId"
													value="${dreamVO.memberVO.memberId}"> <input
													type="submit" class="btn btn-default btn-lg"
													value="꿈 업데이트 하기">
											</form>
										</c:otherwise>
									</c:choose>

								</c:when>
								<c:when test="${is_dreamMaker==true }">
								당신은 이미 응원 하셨습니다!<br>
									<a href="${initParam.root }dream.do?command=myMoreDream">>
										응원내역 보기</a>
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
				<div class="media" style="padding-top: 0px;">
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
         	<div class="sidebar-item popular" align="center">
              <h3>진행했던 꿈 프로젝트</h3>
				<ul class="gallery">
                 <c:forEach items="${dreamList}" var="dream">
                     <c:choose>
                         <c:when test="${dreamList.size()==1 }">
                             전에 진행했던 꿈 프로젝트가 없습니다.
                         </c:when>
                         <c:when test="${dream.dream_newFilename!=dreamVO.dream_newFilename }">
                             <li><a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dream.dreamId}"><img
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
