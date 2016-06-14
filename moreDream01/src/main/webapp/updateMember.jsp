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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="js/lightbox.min.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

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

<!-- 프로필 사진삭제  -->
<script type="text/javascript">
	var xhr;
	function startRequest() {
		if(confirm("${sessionScope.mvo.member_newFilename} 사진을 정말 삭제 하시겠습니까?")){
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = callback;
		xhr
				.open(
						"get",
						"member.do?command=deleteFileMember&&member_newFilename=${mvo.member_newFilename}",
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
					});//ready

	function frmsubmit() {
		if (document.frm.password.value != document.frm.rePassword.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요");
		} else {
			document.frm.submit();
		}//else
	}//submit

	function memberdelete() {
		if (confirm("정말 탈퇴 하시겠습니까?"))
			location.href = "member.do?command=deleteMember";
	}
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
				<c:when test="${sessionScope.mvo.member_newFilename!=null&&sessionScope.mvo.member_newFilename!='-'}">
					<img src="./upload/member/${sessionScope.mvo.member_newFilename}" class="img-circle">
					<c:if test="${sessionScope.mvo.name!='-'}">
					<h3>${sessionScope.mvo.name}</h3>
					</c:if>
				</c:when>
				<c:otherwise>
				<img src="./upload/member/member_df.jpg">
					<c:if test="${sessionScope.mvo.name!='-'}">
					<h3>${sessionScope.mvo.name}</h3>
					</c:if>
				</c:otherwise>
				</c:choose>
				</div>
			</div>
			<form class="form-horizontal" name="frm" action="member.do"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="command" value="updateMember"> <input
					type="hidden" name="memberId" value="${sessionScope.mvo.memberId}">
				<p align="right">
							<button type="button" onclick="memberdelete()"
						class="btn btn-sm btn-danger">회원탈퇴</button></p>
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
											src="./upload/member/${sessionScope.mvo.member_newFilename}">
										<br><br>
										<input type="button" value="프로필 사진 삭제"
											onclick="startRequest()" class="btn btn-lg btn-danger">
										<input type="hidden" name="member_newFilename" value="${sessionScope.mvo.member_newFilename}">
									    <input type="hidden" name="member_orgFilename" value="${sessionScope.mvo.member_orgFilename}">
									</c:if>
								</span>
							</c:otherwise>
						</c:choose>
						
					</div>
				</div>

				<p align="center">
					<button type="button" onclick="frmsubmit()"
						class="btn btn-lg btn-success">회원정보수정</button>
				</p>
				<p align="right">
					
				</p>
			</form>
		</article>
	</div>




	<jsp:include page="./footer.jsp" />
	<!--/#footer-->



</body>
</html>
