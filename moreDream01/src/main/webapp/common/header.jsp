<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>

<link rel="stylesheet" href="${initParam.root}css/toastr.min.css">
<script src="${initParam.root}js/toastr.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		toastr.options = {
				  "closeButton": true,
				  "debug": false,
				  "newestOnTop": false,
				  "progressBar": false,
				  "positionClass": "toast-bottom-right",
				  "preventDuplicates": true,
				  "showDuration": "300",
				  "hideDuration": "1000",
				  "timeOut": "7000",
				  "extendedTimeOut": "1000",
				  "showEasing": "swing",
				  "hideEasing": "linear",
				  "showMethod": "fadeIn",
				  "hideMethod": "fadeOut"
				}
	});
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
			searchMove();
	}
	function searchMove(){
		location.replace('${initParam.root}dream.do?command=getAllListDream&&keyword='+document.getElementById("keyword1").value+document.getElementById("keyword2").value);
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
    
    var xhr;

	function alarm() {		//상단 알림 기능
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = callbackAlarm;
		var url = "${initParam.root}dream.do?command=alarm";
		xhr.open("get", url);
		xhr.send(null);
		setInterval(function(){
			if('${sessionScope.mvo!=null}'=='true'){//세션이 끊겼을때 처리
				xhr = new XMLHttpRequest();
				xhr.onreadystatechange = callbackAlarm;
				var url = "${initParam.root}dream.do?command=alarm";
				xhr.open("get", url);
				xhr.send(null);
			}
		},5000);//5초 간격으로 실행
	}
	alarmView = document.getElementById('alarmView');
	var defaultCount = 0;	//업데이트시 비교할 변수
	var flagCount = 0;		//처음시작하는지 비교할 변수 0이면 처음 시작 / 1이면 두번째 이후
	var updateCount = 0;
	function callbackAlarm() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var jsonData = JSON.parse(xhr.responseText);
				var list = jsonData.alarmList;
				if(flagCount==0||(flagCount==1&&defaultCount<list.length)){
					if(list.length==0){
						$('#alarmView').html("<li>업데이트된 알림이 없습니다.</li>").addClass('alarmnone').css('overflow-y','visible');
					}else{
						$('#alarmView').html("");
					}
					for(i=0;i<list.length;i++){
						$(function() { 
							$('#alarmView').append(
								"<hr style='margin:0px'><a href='${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId="+list[i].dreamVO.dreamId+"'>"+
								"<li style='padding-left:10px; padding-bottom:10px;padding-top:10px;background:white'>"+
									"<div style='display: -webkit-inline-box;'>"+
									"<span style='max-width:50px'>"+
									"<img style='margin-left:5px;border-radius: 20%;' src='${initParam.root}upload/dream/"+list[i].update_newFilename+"' width='70px' height='70px'></span>"+
									"<span style='max-width:50px'>"+
									"<div style='text-align:center'>"+
									"&nbsp;&nbsp;<font size='4' color='#60C5B8'><"+list[i].dreamVO.titleDream+"></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
									"</div>"+
									"<div>"+
									"&nbsp;&nbsp;<font size='3' color='black'><b>- 꿈 업데이트 정보가 있습니다.</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
									"</div>"+
									"<div>&nbsp;&nbsp;"+list[i].year+"년 "+list[i].month+"월 "+list[i].day+"일  "+list[i].hour+"시 "+list[i].minutes+"분 "+list[i].seconds+"초"+
									"</div>"+
									"</span>"+
									"</div>"+
								"</li>").addClass('alarm');
						});
					}

				}
				if(flagCount==0){
					defaultCount=list.length;
					flagCount=1;
					updateCount=list.length;
				}else if(flagCount==1&&defaultCount<list.length){
					toastr.info('<a href=${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId='+list[0].dreamVO.dreamId+'>업데이트 내역이 있습니다.</a>');
					defaultCount=list.length;
					updateCount+=1;
					var bgm = new Audio('');
					var bgm_url = '${initParam.root}common/ring.mp3';
					bgm = new Audio(bgm_url);
					bgm.play();
				}
				if(updateCount==0){
					$('#badge').html('');
				}else{
					$('#badge').html(updateCount);
				}
			}//if
		}//if
	}//callback
	function alarmCountUpdate(){
		updateCount=0;
		$('#badge').html('');
	}
    </script>
</head>
<c:choose>
<c:when test="${sessionScope.mvo!=null}">
<body onload="alarm();">
<%-- <jsp:include page="./alert.jsp" /> --%>
</c:when>
<c:otherwise>
<body>
</c:otherwise>
</c:choose>

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
				<div class="[ animbrand ] hidden-xs ">
					<a class="[ navbar-brand ][ animate ]" href="${initParam.root}/index.jsp">MOREDREAM<i class="fa fa-leaf" aria-hidden="true"></i></a>
				</div>
				
				<div class="[ animbrand ] visible-xs ">
					<a class="[ navbar-brand ][ animate ]" href="${initParam.root}/index.jsp"><i class="fa fa-leaf" aria-hidden="true"></i></a>
				</div>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="[ collapse navbar-collapse ]" id="bs-example-navbar-collapse-1">
					 <c:if test="${sessionScope.mvo.memberCode=='A'}">
				<ul class="[ nav navbar-nav navbar-left ]">
				<li>
						<a href="#" class="[ dropdown-toggle ][ animate ]" data-toggle="dropdown">모아드림 관리<span class="[ caret ]"></span></a>
						<ul class="[ dropdown-menu ]" role="menu">
							<li><a href="${initParam.root}member.do?command=getMemberList" class="[ animate ]">회원 관리 <span class="[ pull-right glyphicon glyphicon-pencil ]"></span></a></li>
							<li><a href="${initParam.root}dream.do?command=getAllListDreamForAdmin" class="[ animate ]">꿈 프로젝트 관리 <span class="[ pull-right glyphicon glyphicon-align-justify ]"></span></a></li>
						</ul>
				</li>
				</ul>
				 </c:if>
				<ul class="[ nav navbar-nav navbar-right ]">
					<li><a href="${initParam.root}dream.do?command=getAllListDream" class="[ animate ]">꿈 둘러보기</a></li>
					<li><a href="${initParam.root}dream/createdream_info.jsp" class="[ animate ]">꿈 만들기</a></li>
					<li><a href="#" class="[ dropdown-toggle ][ animate ]" data-toggle="dropdown">모아드림 소개<span class="[ caret ]"></span></a>
							<ul class="[ dropdown-menu ]" role="menu">
								<li><a href="${initParam.root }help1.jsp" class="[ animate ]">모아드림 이야기</a></li>
								<li><a href="${initParam.root }help2.jsp" class="[ animate ]">모아드림 회원 서비스</a></li>
								<li><a href="${initParam.root }dream.do?command=help3" class="[ animate ]">모아드림 한해 결산</a></li>
							</ul>
					</li>
				<c:choose>
					<c:when test="${sessionScope.mvo==null}">
						<li><a class="animate" href="${initParam.root}member/registerMember.jsp">회원 가입</a></li>
						<li><a class="animate" href="${initParam.root}member/login.jsp">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="#" class="[ dropdown-toggle ][ animate ]" data-toggle="dropdown">${mvo.name} 님<span class="[ caret ]"></span></a>
							<ul class="[ dropdown-menu ]" role="menu">
								<li><a href="${initParam.root}member/updateMember.jsp" class="[ animate ]">회원정보 <span class="[ pull-right glyphicon glyphicon-pencil ]"></span></a></li>
								<li><a href="${initParam.root}dream.do?command=myMoreDream" class="[ animate ]">나의 꿈 현황<span class="[ pull-right glyphicon glyphicon-align-justify ]"></span></a></li>
							</ul>
						</li>
						<li><a href="#" onclick="alarmCountUpdate();" class="[ dropdown-toggle ][ animate ]" data-toggle="dropdown"><i class="fa fa-bell-o" aria-hidden="true"></i><span class="badge" id="badge"></span></a>
								<ul class="[ dropdown-menu ]" role="menu">
								<div id='alarmTitle' class='alarm'>
									<li><h3 align='center'><b><i class="fa fa-bell-o" aria-hidden="true"></i> 꿈 업데이트 알림</b></h3></li>
								</div>
								<div id='alarmView'>
								</div>
								</ul>
							</li>
						<li><a class="animate" href="javascript:logout()">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				
					<li class="[ visible-xs ]">
						<div class="[ input-group ]">
							<input type="text" class="[ form-control ]" id="keyword1" placeholder="검색어를 입력하세요.." onkeydown='search();'>
							<span class="[ input-group-btn ]">
								<button class="[ btn btn-primary ]" type="button" onclick="searchMove();"><span class="[ glyphicon glyphicon-search ]"></span></button>
								<button class="[ btn btn-danger ]" type="reset"><span class="[ glyphicon glyphicon-remove ]"></span></button>
							</span>
						</div>
					</li>
                    <li class="[ hidden-xs ]"><a href="#toggle-search" class="[ animate ]"><span class="[ glyphicon glyphicon-search ]"></span></a></li>
				</ul>
			</div>
		</div>
		
		<div class="[ bootsnipp-search animate ]">
			<div class="[ container ]">
					<div class="[ input-group ]">
						<input type="text" class="[ form-control ]" id="keyword2" placeholder="검색어를 입력하세요..." onkeydown='search();'>
						<span class="[ input-group-btn ]">
							<button class="[ btn btn-primary ]" type="button" onclick="searchMove();"><span class="[ glyphicon glyphicon-search ]"></span></button>
							<button class="[ btn btn-danger ]" type="reset"><span class="[ glyphicon glyphicon-remove ]"></span></button>
						</span>
					</div>
			</div>
		</div>
	</nav>
</body>
</html>