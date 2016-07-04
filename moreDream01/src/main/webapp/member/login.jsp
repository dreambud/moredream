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

<%-- <script type="text/javascript" src="${initParam.root}js/sns_login_facebook.js"></script> --%>
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
	function loginLoad(){
		isLogin();
		var url = '${param.url}';
		if(url==''){
			url=document.referrer;
			document.getElementById("url").value=url;
		}
	}
	function facebookLogin(){
		FB.login(FaceBookApp.statusChangeCallback, FaceBookApp.FBScopes);		
	}
</script>
</head>
<!--/head-->

<body onload="loginLoad()">

	<jsp:include page="../common/header.jsp" />

	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
						<hr width="25%">
							<h1 class="title">로그인</h1>
							<hr width="25%">
							<p>당신의 꿈을 실현시켜보세요 !</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#page-breadcrumb-->
	
	
		
	<div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			  	<h2></h2>
			 	</div>
			  	<div class="panel-body">
			    	<form action="${initParam.root}member.do" method="post">
			    	<input type="hidden" name="command" value="login">
                    <fieldset>
			    	  	<div class="form-group"><label>이메일</label>
			    		    <input class="form-control" placeholder="이메일 주소 입력" name="email" type="text">
			    		</div>
			    		<div class="form-group"><label>비밀번호</label>
			    			<input class="form-control" placeholder="비밀번호 입력" name="password" type="password" value="">
			    		</div>
			    		<div class="checkbox">
			    	    	<label>
			    	    		 계정이 없으신가요? <a href="${initParam.root}member/registerMember.jsp"><font color="blue">새 계정 만들기</font><p></a>	
			    	    	</label>
			    	    </div>
			    	    <input type="hidden" id="url" name="url" value="${param.url}">
			    		<input class="btn btn-lg btn-default btn-block" type="submit" value="로그인">
			    		<hr>
			    		<a href="javascript:facebookLogin();"><img src="${initParam.root}images/sign-in-facebook.png" width="100%" height="60%"></a>
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>


	<jsp:include page="../common/footer.jsp" />
	<!--/#footer-->



</body>
</html>
