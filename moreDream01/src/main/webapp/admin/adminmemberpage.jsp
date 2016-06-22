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
	<jsp:include page="../common/header.jsp"/>
	<!--/#header-->

<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title" align="center"> 회원 관리 현황</h1>
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
        <caption>신청현황</caption>
        <thead>
            <tr>
                <th>#</th>
                <th>신청자</th>
                <th>비밀번호</th>
                <th>승인</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td><a href="#">123@naver.com</a></td>
                <td><input type="password"></td>
               	<td><button type="button" class="btn btn-xs btn-success">저장</button><button type="button" class="btn btn-xs btn-danger">탈퇴</button></td>
            </tr>
            <tr>
               	 <td>2</td>
                <td><a href="#">123@naver.com</a></td>
                <td><input type="password"></td>
               	<td><button type="button" class="btn btn-xs btn-success">저장</button><button type="button" class="btn btn-xs btn-danger">탈퇴</button></td>
            </tr>
            <tr>
                <td>3</td>
                <td><a href="#">123@naver.com</a></td>
                <td><input type="password"></td>
               	<td><button type="button" class="btn btn-xs btn-success">저장</button><button type="button" class="btn btn-xs btn-danger">탈퇴</button></td>
            </tr>
        </tbody>
    </table>
					</div>
				</div>
			</div>
		</div>
	</section>
	

	<jsp:include page="../common/footer.jsp"/>
	<!--/#footer-->



</body>
</html>
