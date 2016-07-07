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
</head>
<!--/head-->

<body>
	<jsp:include page="../../common/header.jsp" />
	<!--/#header-->

	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title" align="center">회원 관리 현황</h1>
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

						<table class="table table-striped table-bordered table-hover">
							<c:if test="${sessionScope.mvo.memberCode=='A'}">
								<caption>
									<b>회원현황</b>
								</caption>
								<thead>
									<tr>
										<th>MemberID</th>
										<th>신청자</th>
										<th>비밀번호</th>
										<th>승인</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${lvo.list}" var="li">
										<tr>


											<td>${li.memberId}</td>
											<td><a
												href="${initParam.root }member.do?command=login&&email=${li.email}&&password=${li.password}">${li.email}</a></td>
											<form action="${initParam.root }member.do" method="post">
												<input type="hidden" name="command"
													value="updateMemberbyAdmin"> <input type="hidden"
													name="memberId" value="${li.memberId}"> <input
													type="hidden" name="email" value="${li.email}"> <input
													type="hidden" name="memberCode" value="${li.memberCode}">
												<input type="hidden" name="address" value="${li.address}">
												<input type="hidden" name="name" value="${li.name}">
												<input type="hidden" name="phoneNumber"
													value="${li.phoneNumber}">
												<td><input type="text" name="password"
													value="${li.password}"></td>
												<td><button type="submit"
														class="btn btn-xs btn-success">저장</button>
											</form>
											<a
												href="${initParam.root }member.do?command=deleteMemberbyAdmin&&memberId=${li.memberId}"><button
													type="button" class="btn btn-xs btn-danger">탈퇴</button>
												</td> </a>
										</tr>
									</c:forEach>
								</tbody>
						</table>
						</c:if>
						<div align="center">
						<c:set var="pb" value="${requestScope.lvo.pb}"></c:set>

							<c:if test="${pb.previousPageGroup}">
								<a href="${initParam.root}member.do?command=getMemberList&&page=${pb.startPageOfPageGroup-1}">
								 <img alt="" src="${initParam.root }images/member/left_arrow_btn.gif">&nbsp;&nbsp;</a>	
							</c:if>
							
							<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
	
								<c:choose>
									<c:when test="${pb.nowPage!=i}">
										<a href="${initParam.root}member.do?command=getMemberList&&page=${i}">${i}</a> 
									</c:when>
									<c:otherwise>
										<span class="badge" style='color:#000'>${i}</span>
									</c:otherwise>
								</c:choose>
								&nbsp;
							</c:forEach>	
							
							<c:if test="${requestScope.lvo.pb.nextPageGroup}">
								<a href="${initParam.root}member.do?command=getMemberList&&page=${requestScope.lvo.pb.endPageOfPageGroup+1}">
								 <img alt="" src="${initParam.root}images/member/right_arrow_btn.gif"></a>
							</c:if>	
							</div>
					</div>
				</div>
			</div>
		</div>
	</section>


		<jsp:include page="../../common/footer.jsp" />
	<!--/#footer-->



</body>
</html>


