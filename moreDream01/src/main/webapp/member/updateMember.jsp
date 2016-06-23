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
<title>More Dream</title>
<script type="text/javascript" src="${initParam.root }js/jquery.js"></script>
<script type="text/javascript"
	src="${initParam.root }js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${initParam.root }js/jquery.isotope.min.js"></script>
<script type="text/javascript"
	src="${initParam.root }js/lightbox.min.js"></script>
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

<!-- 프로필 사진삭제  -->
<script type="text/javascript">
	var xhr;
	function startRequest() {
		if (confirm("${sessionScope.mvo.member_newFilename} 사진을 정말 삭제 하시겠습니까?")) {
			xhr = new XMLHttpRequest();
			xhr.onreadystatechange = callback;
			xhr
					.open(
							"get",
							"${initParam.root }member.do?command=deleteFileMember&&member_newFilename=${mvo.member_newFilename}",
							true);
			xhr.send(null);
		}//if
	}
	function callback() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				document.getElementById("uploadView").innerHTML = "<input type='file' name='multipartFile' class='form-control'>";
			}
		}
	}

	$(document)
			.ready(
					function() {
						$('#rePassword')
								.keyup(
										function() {
											if ($(this).val() != $('#password')
													.val()) {
												$('#passwordEqul')
														.html(
																"<br><font color='red'><b>입력하신 비밀번호가 일치 하지 않습니다.</b></font>")
											} else {
												$('#passwordEqul')
														.html(
																"<br><font color='blue'><b>입력하신 비밀번호가 일치 합니다.</b></font>")
											}
											;
										});//keyup
						$('#facebook').change(function() {
							if (document.frm.facebook.checked) {
								checkLoginState();
							} else {
								document.frm.facebookId.value = "";
							}
						});
					});//ready

	function frmsubmit() {
		if (document.frm.password.value != document.frm.rePassword.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요");
		} else {
			if (!document.frm.facebook.checked) {
				document.frm.facebookId.value = "";
			}
			document.frm.submit();
		}//else
	}//submit

	function memberdelete() {
		if (confirm("정말 탈퇴 하시겠습니까?"))
			location.href = "${initParam.root }member.do?command=deleteMember";
	}
</script>
<script>
	// This is called with the results from from FB.getLoginStatus().
	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);
		if (response.status === 'connected') {
			checkLog();
		} else if (response.status === 'not_authorized') {
		}
	}

	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}

	window.fbAsyncInit = function() {
		FB.init({
			appId : '950393115078074',
			xfbml : true, // parse social plugins on this page
			version : 'v2.6' // use version 2.2
		});

		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});

	};

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.async = true;
		js.src = "//connect.facebook.net/ko_KR/sdk.js";
	}(document, 'script', 'facebook-jssdk'));

	var FBtoken = "";
	function checkLog() {
		FB.api('/me', function(response) {
			document.frm.facebookId.value = response.id;
		});
	}
	function updateFacebookChk() {
		loginCheck();
		checkLoginState();
	}
</script>
</head>
<!--/head-->

<body onload="updateFacebookChk();">

	<jsp:include page="../common/header.jsp" />

	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">회원정보 수정</h1>
							<p>당신의 꿈을 실현시켜보세요 !</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#page-breadcrumb-->

	<div class="contentwrap">
		<article class="container">
			<div class="page-header">
				<div class="container-fluid bg-1 text-center">
					<c:choose>
						<c:when
							test="${sessionScope.mvo.member_newFilename!=null&&sessionScope.mvo.member_newFilename!='-'}">
							<img
								src="${initParam.root }upload/member/${sessionScope.mvo.member_newFilename}"
								class="img-circle" width="250px" height="250px">
							<c:if test="${sessionScope.mvo.name!='-'}">
								<h3>${sessionScope.mvo.name}</h3>
							</c:if>
						</c:when>
						<c:when test="${sessionScope.mvo.facebookId!=''}">
							<img
								src="http://graph.facebook.com/${sessionScope.mvo.facebookId}/picture?type=large"
								class="img-circle" width="250px" height="250px">
						</c:when>
						<c:otherwise>
							<img src="${initParam.root }upload/member/member_df.jpg">
							<c:if test="${sessionScope.mvo.name!='-'}">
								<h3>${sessionScope.mvo.name}</h3>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div style="padding-left: 500">
				<form class="form-horizontal" name="frm"
					action="${initParam.root }member.do" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="command" value="updateMember"> <input
						type="hidden" name="memberId" value="${sessionScope.mvo.memberId}">
					<p align="right">
						<button type="button" onclick="memberdelete()"
							class="btn btn-sm btn-danger"><b>회원탈퇴</b></button>
					</p>
					<div class="form-group">
						<label for="inputId" class="col-sm-2 control-label">아이디</label>
						<div class="col-sm-6">
							<input type="text" name="email" class="form-control"
								readonly="readonly" value="${sessionScope.mvo.email}">
						</div>
						<div class="col-sm-4"></div>
					</div>

					<div class="form-group">
						<label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="변경할 비밀번호를 입력해주세요"
								value="${sessionScope.mvo.password}">
						</div>
					</div>

					<div class="form-group">
						<label for="reInputPassword" class="col-sm-2 control-label">비밀번호
							확인</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="rePassword"
								name="rePassword" placeholder="변경할 비밀번호를  한번 더 입력해주세요" value="">
							<span id="passwordEqul"></span>
						</div>
					</div>

					<div class="form-group">
						<label for="inputPasswordCheck" class="col-sm-2 control-label">주소</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name=address
								placeholder="주소를 입력해주세요" value="${sessionScope.mvo.address}">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPasswordCheck" class="col-sm-2 control-label">이름</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="name"
								placeholder="이름을 입력해주세요" value="${sessionScope.mvo.name}">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPhoneNumber" class="col-sm-2 control-label">전화번호</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="phoneNumber"
								placeholder="전화번호를 입력해주세요"
								value="${sessionScope.mvo.phoneNumber}">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPhoneNumber" class="col-sm-2 control-label">프로필
							사진</label>
						<div class="col-sm-6">
							<c:choose>
								<c:when
									test="${sessionScope.mvo.member_newFilename==null||sessionScope.mvo.member_newFilename=='-'}">
									<input type="file" name="multipartFile" class="form-control">

								</c:when>
								<c:otherwise>

									<span id="uploadView"> <c:if
											test="${sessionScope.mvo.member_newFilename!=null&&sessionScope.mvo.member_newFilename!='-'}">
											<img
												src="${initParam.root }upload/member/${sessionScope.mvo.member_newFilename}"
												width="100" height="100">
											&nbsp;&nbsp;&nbsp;
											<button onclick="srartRequest()" class="btn btn-mg btn-danger"style="vertical-align: bottom;" ><b>프로필 사진 삭제</b></button>
											<input type="hidden" name="member_newFilename"
												value="${sessionScope.mvo.member_newFilename}">
											<input type="hidden" name="member_orgFilename"
												value="${sessionScope.mvo.member_orgFilename}">
										</c:if>
									</span>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
					<div class="form-group">
						<label for="inputPhoneNumber" class="col-sm-2 control-label">페이스북
							연동</label>
						<div class="col-sm-6">
							<c:choose>
								<c:when
									test="${sessionScope.mvo.facebookId==''||sessionScope.mvo.facebookId==null}">
									<input type="hidden" name="facebookId" id="facebookId" value="">
									<b><font color="red">페이스북 연동 안됨</font></b>
									<br>
									<div class="fb-login-button" data-scope="public_profile,email"
										data-max-rows="1" data-size="medium" data-show-faces="true"
										data-auto-logout-link="true" onlogin="checkLoginState();"></div>
									<br>
									<font color="green"><b>* 페이스북과 연동하시려면 아래 체크박스를 클릭!
											<p>* 이후에 이메일 또는 페이스북으로 로그인이 가능합니다.
											<p>
									</b></font>
									<input type="checkbox" id="facebook" name="facebook"
										value="연동하기"> 페이스북과 연동하기
							</c:when>
								<c:otherwise>
									<input type="hidden" name="facebookId" id="facebookId"
										value="${sessionScope.mvo.facebookId}">
									<img
										src="http://graph.facebook.com/${sessionScope.mvo.facebookId}/picture?type=square">
									<b><font color="green">페이스북 연동 됨</font></b>
									<br>
									<input type="checkbox" id="facebook" name="facebook"
										value="연동하기" checked="checked">
									<b> 연동하기<font color="red">(체크 해제시 페이스북으로 로그인이
											불가능합니다)</font></b>

								</c:otherwise>
							</c:choose>

						</div>
					</div>
					<p align="center">
						<button type="button" onclick="frmsubmit()"
							class="btn btn-mg btn-success"><b>회원정보수정</b></button>
					</p>
					<p align="right"></p>
				</form>
			</div>
		</article>
	</div>




	<jsp:include page="../common/footer.jsp" />
	<!--/#footer-->



</body>
</html>
