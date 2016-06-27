<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>

<script type="text/javascript">
	function logout(){
		var f=confirm("로그아웃 하시겠습니까?");
		if(f)
			location.href="${initParam.root}member.do?command=logout"; //Controller에서 기능으로 연결..
	}

	function loginCheck(){
		var flag = ${sessionScope.mvo==null};
		if(flag){
			alert('로그인이 필요한 페이지 입니다.');
			location.replace('${initParam.root}member/login.jsp?url='+location.href);
		}
	}
	function isLogin(){
		var flag = ${sessionScope.mvo!=null};
		if(flag){
			location.replace('${initParam.root}index.jsp');
		}
	}
	function search(ev){
		if (window.event) // IE코드
			var code = window.event.keyCode;
		else // 타브라우저
			var code = ev.which;
		if(code=='13')
			location.replace('${initParam.root}dream.do?command=getAllListDream&&keyword='+document.getElementById("keyword").value);
		
	}
    var FaceBookApp = {
        	FBScopes: {scope: 'public_profile,email'},
        	accessToken: '',
        	// 초기화 함수
        	init: function(d, s, id) {
        	    	window.fbAsyncInit = function() {
        	    	    	FB.init({
        	    	    	    	appId : '950393115078074',
        	    	    	    	xfbml : true,
        	    	    	    	version : 'v2.6'
        	    	    	});
        	    	};

        	    	var js, fjs = d.getElementsByTagName(s)[0];
        	    	if (d.getElementById(id)) {return;}
        	     js = d.createElement(s); js.id = id;
        	    	js.src = "//connect.facebook.net/en_US/sdk.js";
        	     fjs.parentNode.insertBefore(js, fjs);
        	},
        	statusChangeCallback: function(response) {
        	    	FaceBookApp.accessToken = response.authResponse.accessToken;

        	    	// 연결 성공
        	    	if (response.status === 'connected') {
        	    	    	// 연결 성공시 실행할 코드
        	    	    	FaceBookApp.FBsigninCallback();
        	    	// 인증 거부
        	    	} else if (response.status === 'not_authorized') {
        	    	    	console.log('Please log into this app.');
        	    	// 그 밖..
        	    	} else {
        	    	    	console.log('Please log into Facebook.');
        	    	}
        	},
        	FBsigninCallback: function() {
        	    	FB.api('/me?fields=id,email,name', function(response) {
        	    	    	var id = response.id;
        	    	    	var token = FaceBookApp.accessToken;
        	    	    	var memberName = response.name;
        	    	    	var email = response.email;
        	    	    	location.href='${initParam.root}member.do?command=facebookLogin&&facebookId='+id+'&&email='+email;
        	    	    	// 실행할 코

         	   	});
        	}
    };
    // 초기화 실행
    FaceBookApp.init(document, 'script', 'facebook-jssdk');
    </script>
</head>
<body>

<nav class="[ navbar navbar-fixed-top ][ navbar-bootsnipp animate ] " role="navigation">
    	<div class="[ container ]">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="[ navbar-header]">
				<button type="button" class="[ navbar-toggle ]" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="[ sr-only ]">Toggle navigation</span>
					<span class="[ icon-bar ]"></span>
					<span class="[ icon-bar ]"></span>
					<span class="[ icon-bar ]"></span>
				</button>
				<div class="[ animbrand ]">
					<a class="[ navbar-brand ][ animate ]" href="${initParam.root}/index.jsp">MOREDREAM<i class="fa fa-leaf" aria-hidden="true"></i></a>
				</div>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="[ collapse navbar-collapse ]" id="bs-example-navbar-collapse-1">
					 <c:if test="${sessionScope.mvo.memberCode=='A'}">
				<ul class="[ nav navbar-nav navbar-left ]">
				<li>
						<a href="#" class="[ dropdown-toggle ][ animate ]" data-toggle="dropdown">관리자 <span class="[ caret ]"></span></a>
						<ul class="[ dropdown-menu ]" role="menu">
							<li><a href="${initParam.root}member.do?command=getMemberList" class="[ animate ]">회원 관리 <span class="[ pull-right glyphicon glyphicon-pencil ]"></span></a></li>
							<li><a href="${initParam.root}dream.do?command=getAllListDreamForAdmin" class="[ animate ]">꿈 프로젝트 관리 <span class="[ pull-right glyphicon glyphicon-align-justify ]"></span></a></li>
						</ul>
				</li>
				</ul>
				 </c:if>
				<ul class="[ nav navbar-nav navbar-right ]">
					<li><a href="${initParam.root}dream/createdream_info.jsp" class="[ animate ]">꿈 만들기</a></li>
					<li><a href="${initParam.root}dream.do?command=getAllListDream" class="[ animate ]">꿈 둘러보기</a></li>
					<li><a href="${initParam.root }help.jsp" class="[ animate ]">도움말1</a></li>
					<li><a href="${initParam.root }help1.jsp" class="[ animate ]">도움말2</a></li>
					
				<c:choose>
				<c:when test="${sessionScope.mvo==null}">
					<li><a class="animate" href="${initParam.root}member/registerMember.jsp">회원 가입</a></li>
					<li><a class="animate" href="${initParam.root}member/login.jsp">로그인</a></li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="#" class="[ dropdown-toggle ][ animate ]" data-toggle="dropdown">${mvo.name}<span class="[ caret ]"></span></a>
						<ul class="[ dropdown-menu ]" role="menu">
							<li><a href="${initParam.root}member/updateMember.jsp" class="[ animate ]">회원정보 <span class="[ pull-right glyphicon glyphicon-pencil ]"></span></a></li>
							<li><a href="${initParam.root}dream.do?command=myMoreDream" class="[ animate ]">나의 꿈 현황<span class="[ pull-right glyphicon glyphicon-align-justify ]"></span></a></li>
						</ul>
					</li>
					
					
					
					<li><a class="animate" href="javascript:logout()">로그아웃</a></li>
					</c:otherwise>
						</c:choose>
					<li class="[ visible-xs ]">
						<form action="#" method="GET" role="search">
							<div class="[ input-group ]">
								<input type="text" class="[ form-control ]" name="q" placeholder="검색어를 입력하세요">
								<span class="[ input-group-btn ]">
									<button class="[ btn btn-primary ]" type="submit"><span class="[ glyphicon glyphicon-search ]"></span></button>
									<button class="[ btn btn-danger ]" type="reset"><span class="[ glyphicon glyphicon-remove ]"></span></button>
								</span>
							</div>
						</form>
					</li>
                    <li class="[ hidden-xs ]"><a href="#toggle-search" class="[ animate ]"><span class="[ glyphicon glyphicon-search ]"></span></a></li>
				</ul>
			</div>
		</div>
		
		<div class="[ bootsnipp-search animate ]">
			<div class="[ container ]">
				<form action="#" method="post" role="search">
					<div class="[ input-group ]">
						<input type="text" class="[ form-control ]" name="q" placeholder="검색어를 입력하세요">
						<span class="[ input-group-btn ]">
							<button class="[ btn btn-danger ]" type="reset"><span class="[ glyphicon glyphicon-remove ]"></span></button>
						</span>
					</div>
				</form>
			</div>
		</div>
	</nav>
</body>
</html>