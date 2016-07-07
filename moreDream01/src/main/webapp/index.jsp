<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>More Dream</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/footer-distributed-with-address-and-phones.css" rel="stylesheet">
<link href="css/full-slider.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/lightbox.min.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="js/jquery.counterup.min.js"></script> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script type="text/javascript" src="js/main.js"></script> 

<!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->

<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">

<script type="text/javascript">
	function recentDream() {
		location.href = "dream.do?command=recentDream"
	}
	
	function reverse_counter(d_day,i){
		today = new Date();
		d_day = new Date(d_day);
		days = (d_day - today) / 1000 / 60 / 60 / 24;
		daysRound = Math.floor(days);
		hours = (d_day - today) / 1000 / 60 / 60 - (24 * daysRound);
		hoursRound = Math.floor(hours);
		minutes = (d_day - today) / 1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound);
		minutesRound = Math.floor(minutes);
		seconds = (d_day - today) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) -
		(60 * minutesRound);
		secondsRound = Math.round(seconds);
		sec = " 초.";
		min = " 분, ";
		hr = " 시간, ";
		dy = " 일, ";
		hoursRound=hoursRound+'';
		minutesRound=minutesRound+'';
		secondsRound=secondsRound+'';
		daysRound=daysRound+1;
		if(daysRound==0){
			daysRound='day';
		}
		if(hoursRound.length==1){
			hoursRound='0'+hoursRound;
		}
		if(minutesRound.length==1){
			minutesRound='0'+minutesRound;
		}
		if(secondsRound.length==1){
			secondsRound='0'+secondsRound;
		}
		
		//텍스트 출력 부분
	     document.getElementById("counter"+i).innerHTML = 
	    	"D-"+daysRound + "<br>" + 
	    	hoursRound + ":" + 
	    	minutesRound + ":" + 
	    	secondsRound; 
	}
</script>

<script>
jQuery(document).ready(function( $ ) {
$('#number1').counterUp({
delay: 10, // the delay time in ms
time: 2000 // the speed time in ms
});
});

jQuery(document).ready(function( $ ) {
	$('#number2').counterUp({
	delay: 10, // the delay time in ms
	time: 2000 // the speed time in ms
	});
	});
	
jQuery(document).ready(function( $ ) {
	$('#number3').counterUp({
	delay: 10, // the delay time in ms
	time: 2000 // the speed time in ms
	});
	});
	
jQuery(document).ready(function( $ ) {
	$('#number4').counterUp({
	delay: 10, // the delay time in ms
	time: 2000 // the speed time in ms
	});
	});	
</script>


</head>
<!--/head-->
<c:choose>
	<c:when test="${flag==1}">
		<body>
			<jsp:include page="./common/header.jsp" />
	
			
			   <!-- Full Page Image Background Carousel Header -->
    
    
    <div class="visible-xs" style="padding-top: 40px; text-align: center;">
    <h2 style="color:#60C5B8; font-weight: 900;">MOREDREAM</h2>
    </div>
    
    <div id="myCarousel" class="carousel slide hidden-xs">
        <!-- Indicators -->
        
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for Slides -->
        <div class="carousel-inner">
           <c:forEach items="${recentProjects}" var="dl" begin="6" end="6">
            <div class="item active">
                <!-- Set the first background image using inline CSS below. -->
                <div class="fill" style="background-image:url('http://wallpapers-and-backgrounds.net/wp-content/uploads/2015/11/mint-green-wallpaper_1.jpg');">
                
                
                </div>
               
               
                <div class="carousel-caption">
                   <a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dl.dreamId}"><img src="${initParam.root}upload/dream/${dl.dream_newFilename}" width="300px" height="300px" style="border-radius:10%;"/></a>
									&nbsp;<p>
								<font color="white" size="35px"><h1>${dl.titleDream}</h1></font>
								<c:choose>
									<c:when test="${(dl.memberVO.member_newFilename!='-'&&dl.memberVO.member_newFilename!='')}">
										<img class="img-circle" src="./upload/member/${dl.memberVO.member_newFilename}"width="50px" height="50px">
									</c:when>
									<c:when test="${dl.memberVO.facebookId!=''||dl.memberVO.facebookId!=null}">
										<img class="img-circle" src="http://graph.facebook.com/${dl.memberVO.facebookId}/picture?type=square"width="50px" height="50px">
									</c:when>
									<c:otherwise>
										<img class="img-circle" src="./upload/member/member_df.jpg" width="50px" height="50px">
									</c:otherwise>
								</c:choose> 
								<b>${dl.memberVO.name }</b>의 ${dl.category} 프로젝트
								</p>
								<p>
									<a class="btn btn-default btn-lg" href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dl.dreamId}" role="button">더 보기 <i class="fa fa-leaf" aria-hidden="true"></i></a>
								</p>
								&nbsp;
								
                </div>
                
            </div>
            </c:forEach>
            
            <c:forEach items="${recentProjects}" var="dl" begin="7" end="9">
            <div class="item">
                <!-- Set the second background image using inline CSS below. -->
                <div class="fill" style="background-image:url('http://wallpapers-and-backgrounds.net/wp-content/uploads/2015/11/mint-green-wallpaper_1.jpg');"></div>
                
                
               <div class="carousel-caption">
                   <a href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dl.dreamId}"><img src="${initParam.root}upload/dream/${dl.dream_newFilename}" width="300px" height="300px" style="border-radius:10%;"/></a>
									&nbsp;<p>
								<font color="white" size="35px"><h1>${dl.titleDream}</h1></font>
								<c:choose>
									<c:when test="${(dl.memberVO.member_newFilename!='-'&&dl.memberVO.member_newFilename!='')}">
										<img class="img-circle" src="./upload/member/${dl.memberVO.member_newFilename}"width="50px" height="50px">
									</c:when>
									<c:when test="${dl.memberVO.facebookId!=''||dl.memberVO.facebookId!=null}">
										<img class="img-circle" src="http://graph.facebook.com/${dl.memberVO.facebookId}/picture?type=square"width="50px" height="50px">
									</c:when>
									<c:otherwise>
										<img class="img-circle" src="./upload/member/member_df.jpg" width="50px" height="50px">
									</c:otherwise>
								</c:choose>
								<b>${dl.memberVO.name }</b>의 ${dl.category} 프로젝트
								</p>
								<p>
									<a class="btn btn-default btn-lg" href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dl.dreamId}" role="button">더 보기 <i class="fa fa-leaf" aria-hidden="true"></i></a>
								</p>
								&nbsp;
								
                </div>
                
            </div>
            </c:forEach>
            
        </div>
		
        <!-- Controls -->
       <!--  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
 -->
    </div>
		
			
			<!--/#home-slider-->
			
<section>
				<div class="jumbotron col-xs">
					<h1>당신의 꿈을 시작하세요</h1>
					<br>
					<p>모아드림은 특별히 차별화된 플랫폼의 기능들을 통해 자신의 꿈을 기획 , 제작 , 운영 , 소통 하며 자금을
						모금할 수 있는 공간입니다 .</p>
						&nbsp;
					<p>
					<a class="btn btn-default btn-lg" href="${initParam.root}dream/createdream_info.jsp" role="button">꿈 만들기 <i class="fa fa-leaf" aria-hidden="true"></i></a>
					<br><br><br>
			<div class="col-sm-3" style="padding-left: 0px;padding-right: 0px">
					<div class="jumbotron"
						style="background-color: #22ACC1;" >
						<img src="${initParam.root }images/aboutus/person.png" width="200"
							height="130"><br><hr style="color: #fff; width: 50px;"><br>
						<font style="font-size: 2em; color: white;" class="wow fadeInUp" data-wow-duration="900ms"
					data-wow-delay="100ms">드리머 & 드림메이커 <br><br> <b><span id="number1">${ memberCnt}</span></b>명</font>
					</div>
			</div>
			
			<div class="col-sm-3" style="padding-left: 0px;padding-right: 0px">
				<div class="jumbotron"
					style="background-color: #60C5B8;">
					<img src="${initParam.root }images/aboutus/dreamCnt.png" width="150"
						height="130" ><br><hr style="color: #fff; width: 50px;"><br>
						<font style="font-size: 2em; color: white;" class="wow fadeInUp" data-wow-duration="900ms"
				data-wow-delay="300ms">신청된 꿈 프로젝트 <br><br> <b><span id="number2">${dreamCnt }</span></b>개</font>
				</div>
			</div>	
			
			<div class="col-sm-3" style="padding-left: 0px;padding-right: 0px">	
				<div class="jumbotron"
					style="background-color: #22ACC1;" >
					<img src="${initParam.root }images/aboutus/successDream.png" width="250"
						height="130" ><br><hr style="color: #fff; width: 50px;"><br>
						<font style="font-size: 2em; color: white;" class="wow fadeInUp" data-wow-duration="900ms"
				data-wow-delay="500ms">성공한 꿈 프로젝트<br><br> <b><span id="number3">${successDreamCnt}</span></b>개</font>
				</div>
			</div>
			
			
			<div class="col-sm-3" style="padding-left: 0px;padding-right: 0px">	
				<div class="jumbotron"
					style="background-color: #60C5B8;" >
					<img src="${initParam.root }images/aboutus/totalMoney.png" width="150"
						height="130" ><br><hr style="color: #fff; width: 50px;"><br>
						<font style="font-size: 2em; color: white;" class="wow fadeInUp" data-wow-duration="900ms"
				data-wow-delay="700ms">후원 금액 <br><br> <b> <span id="number4">${totalMoney}</span></b>원</font>
			</div>
	</div>
					
				</div>	
</section>
			
			
			
			

<section>
		<div class="container-main col-md-12">
			<div class="row">
		
				<div id="carousel-example" class="carousel slide col-md-12"
					data-ride="carousel">
					<!-- Wrapper for slides -->
					<div class="carousel-inner" >

 					<c:forEach items="${popularProjects}" var="dl" end="5" varStatus="i">
 					<c:if test="${i.count==1}">
						<div class="item active">
							<div class="row">
					</c:if>
					<c:if test="${i.count==4}">
						<div class="item">
							<div class="row">
					</c:if>
								<div class="col-md-4 col-sm-12" >
								<a class="selecterItem" href="${initParam.root}dream.do?command=getDetailDreamByDreamId&&dreamId=${dl.dreamId}">
									
									<div class="col-item" id="pjtbox">
										<div class="photo">
											<div class="endTimer">
												<h2 style="background-color: rgba(96,197,184,0.7);width: 50%;margin: auto;padding: 20px;border-radius: 5%;"><b>
													<font color="#FFF"><span id="counter${i.count}"></span></font>
														<script>
														setInterval(function(){
															reverse_counter('${dl.endDate} 00:00:00','${i.count}');
														},1000);
														</script>
													</b>
												</h2>
											</div>
											<div>
												<img src="./upload/dream/${dl.dream_newFilename}" style="width: 350px; height: 260px" class="img-responsive">
											</div>
											
										</div>
										<div class="info">	
											<div class="row">
												<div class="rating col-md-2 col-sm-2">
														<c:choose>
															<c:when test="${(dl.memberVO.member_newFilename!='-'&&dl.memberVO.member_newFilename!=''&&dl.memberVO.member_newFilename!=' '&&dl.memberVO.member_newFilename!='  ')}">
																<img class="img-circle" src="./upload/member/${dl.memberVO.member_newFilename}"width="50px" height="50px">
															</c:when>
															<c:when test="${dl.memberVO.facebookId!=''&&dl.memberVO.facebookId!=null}">
																<img class="img-circle" src="http://graph.facebook.com/${dl.memberVO.facebookId}/picture?type=square"width="50px" height="50px">
															</c:when>
															<c:otherwise>
																<img class="img-circle" src="./upload/member/member_df.jpg" width="50px" height="50px">
															</c:otherwise>
														</c:choose>

												</div>
												<div >
													<h5>
														<b> <c:choose>
																<c:when test="${dl.titleDream.length()<19}">
																	${dl.titleDream}
																</c:when>
																<c:otherwise>
																	${dl.titleDream.substring(0,19)}..
																</c:otherwise>
															</c:choose></b>
													</h5>
													<h5>
														<b>${dl.memberVO.name }</b>의 <b>${dl.category} 꿈 프로젝트</b>
													</h5>
													<h5 class="price-text-color">
														<label>모인 금액</label>   ${dl.statVO.totalMoneyView} 원
													</h5>
												</div>
											</div>
											 <div class="progress">
													<div class="progress-bar progress-bar-primary active"
														role="progressbar" aria-valuenow="40" aria-valuemin="0"
														aria-valuemax="100" style="width: ${(dl.statVO.totalMoney/dl.targetFund)*100}%"></div>
													</div>
											<div class="separator clear-left">
												<p class="btn-add">
												<i class="fa fa-heart"></i>${dl.statVO.supporterCnt}명
												</p>
												<p class="btn-details">
													<i class="fa fa-calendar"></i><c:if test="${dl.statVO.endDay==0}">
																	<b>오늘 마감!!!</b>
																</c:if>
																<c:if test="${dl.statVO.endDay>0}">
																	앞으로 ${dl.statVO.endDay}일
																</c:if>
																<c:if test="${dl.statVO.endDay<0}">
																	<b>마감!!!</b>
																</c:if>
												</p>
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
								</a>
								<c:if test="${i.count==3||i.count==6}">
							</div>
						</div><!-- div .item-active / div .item end -->
								
								</c:if>
						</c:forEach>

					<a class="left carousel-control" href="#carousel-example"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span>
					</a> <a class="right carousel-control" href="#carousel-example"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>


					</div>
				</div>
			</div>
		</div>
</section>
	<!-- project -->



		<jsp:include page="./common/footer.jsp" />
		</body>
	</c:when>
	<c:otherwise>
		<body onload="recentDream()" />
	</c:otherwise>
</c:choose>
</html>
