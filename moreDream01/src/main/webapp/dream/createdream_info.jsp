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
$(document).ready(function() {
	$('#re1').click(function(e){
		if($("input[name='agree']:checked").val()=="Y"){		
			if(${sessionScope.mvo!=null})
				location.href="${initParam.root}dream/createdream.jsp";
			else{
				alert("로그인을 하시고 신청해주세요.");
				location.href="${initParam.root}member/login.jsp";
			}
		}else{
			alert("위 내용을 모두 읽고 동의하셨으면 체크해주세요.");return;
		}
	});
}); //end ready()
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
							<hr width="25%"><h1 class="title">꿈 만들기</h1><hr width="25%">
							<p>당신의 꿈을 실현시켜보세요 !</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#page-breadcrumb-->
	
	<br><br>
	<div class="row" class="row" style="margin-bottom: 40px;margin-left: 10%;margin-right: 10%;">
  		<div style="border-style: groove; border-color: #22ACC1;padding-left: 20px;padding-right: 20px;">
  		<br>
  			<h2 align="center"><strong>꿈 개설 신청 안내</strong></h2>
  		<br>

	 <p>
          반갑습니다! More Dream에서 꿈을 꾸시기 전,
          아래 가이드라인을 충분히 읽어주신 후 프로젝트 개설을 신청해주세요!
         <p>
        <strong>
        모아드림은 실현하고 싶은 꿈을 꾸는 모든 청년들에게 열려있습니다.
        </strong>
          <hr>
        <p>
         <br>
          여기서 말하는 '꿈'이란 이루고 싶었던 목표를 실행하는 데 있어 
          경제적인 원조가 필요한 프로젝트를 의미하며, 
          목표의 최종적인 결과가 유형의 것이나 무형의 것이나 상관없이 
          시작과 끝이 명확한 활동을 지칭합니다.
        </p>
       <ul style="padding-left: 10px">
       	 	<li>o 카테고리 : 디자인, 패션, 출판, 요리, 음악, 공연, 영화 </li>
       	 	<li>o 범위 : 시작과 끝이 명확한 활동</li>
       </ul>
        <p>
         More Dream은 이러한 목표의 꿈들을 소개합니다.
        </p>
        <p>
         <b>꿈 개설 신청 후 약 일주일 기간의 승인 여부 심사를 통해 꿈이 개설됩니다.
         만약 위의 가이드라인 내용과 부합하지 않는 경우,  
         꿈 개설 신청 승인이 거절될 수 있다는 점 미리 알려드립니다.</b>
        </p>
        <p>
        More Dream은 언제나 여러분의 꿈이 개설되고 응원받길 소망합니다.
        </p>
     
     <br><hr><br>
  	 <div class="checkbox" align="center">
  		<label>
    		<input type="checkbox" value="Y" class="chk" name="agree" >
  			 위 모든 사항을 확인하였습니다.
  		</label>
	</div><br>
   
   <div align="center">
    <button type="button" class="btn btn-common" id="re1">꿈 개설 신청하기</button>
    <p><br><p>
    </div>
    
  		</div>
	
	</div>


<jsp:include page="../common/footer.jsp" />
	<!--/#footer-->



</body>
</html>
