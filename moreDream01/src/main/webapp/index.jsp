<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->       
    
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    
    <script type="text/javascript">
    function recentDream(){
    	location.href="dream.do?command=recentDream"
	}
 
    </script>
    
</head><!--/head-->
<c:choose>
<c:when test="${dreamList!=null}">
<body>
	<jsp:include page="./header.jsp"/>

    <section id="home-slider">
        <div class="container">
            <div class="row">
                <div class="main-slider">
                    <div class="slide-text">
                        <h1>Welcome More Dream Site</h1>
                        <p>Boudin doner frankfurter pig. Cow shank bresaola pork loin tri-tip tongue venison pork belly meatloaf short loin landjaeger biltong beef ribs shankle chicken andouille.</p>
                        <a href="registerMember.jsp" class="btn btn-common">회원가입</a>
                    </div>
                    <img src="images/home/slider/hill.png" class="slider-hill" alt="slider image">
                    <img src="images/home/slider/house.png" class="slider-house" alt="slider image">
                    <img src="images/home/slider/sun.png" class="slider-sun" alt="slider image">
                    <img src="images/home/slider/birds1.png" class="slider-birds1" alt="slider image">
                    <img src="images/home/slider/birds2.png" class="slider-birds2" alt="slider image">
                </div>
            </div>
        </div>
        <div class="preloader"><i class="fa fa-sun-o fa-spin"></i></div>
    </section>
    <!--/#home-slider-->

        <section id="recent-projects" class="recent-projects">
        <div class="container">
            <div class="row">
                <h1 class="title text-center wow fadeInDown" data-wow-duration="500ms" data-wow-delay="300ms">Recently Dream</h1>
                <p class="text-center padding-bottom wow fadeInDown" data-wow-duration="400ms" data-wow-delay="400ms">가장 최근의 꿈</p>
                
                <c:forEach items="${dreamList}" var="dl" end="7">
                <div class="col-sm-3 col-xs-6 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms" >
                    <div class="portfolio-wrapper">   
                        <div class="portfolio-single">
                            <div class="portfolio-thumb" style="border: solid 1px;">
                                <img src="./upload/dream/${dl.dream_newFilename}" style="width: 261px; height: 269px" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                            <ul class="nav nav-pills">
								<li>
						<a href="dream.do?command=getDetailDreamByDreamId&&dreamId=${dl.dreamId}">자세히 보기 <i class="fa fa-plus-circle" aria-hidden="true"></i></a></li></ul>
                                <ul class="nav nav-pills">
                                </ul>
                            </div>
                        </div>
                        <h2>${dl.titleDream }</h2>
                        <hr>
                        <div class="progress">
													<div class="progress-bar progress-bar-danger active"
														role="progressbar" aria-valuenow="40" aria-valuemin="0"
														aria-valuemax="100" style="width: 50%">0%</div>
													</div>
                        <div class="portfolio-info">
                          <i class="fa fa-heart"></i>모인 금액 ${dl.statVO.totalMoneyView}원<br>
								<i class="fa fa-users"></i>후원자  ${dl.statVO.supporterCnt}명<br>
								<i class="fa fa-calendar"></i>
																<c:if test="${dl.statVO.endDay==0}">
																	<b>오늘 마감!!!</b>
																</c:if>
																<c:if test="${dl.statVO.endDay>0}">
																	앞으로 ${dl.statVO.endDay}일
																</c:if>
																<c:if test="${dl.statVO.endDay<0}">
																	<b>마감!!!</b>
																</c:if>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!--/#recent-projects-->

    <jsp:include page="./footer.jsp"/>

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/lightbox.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>   
</body>
</c:when>
<c:otherwise>
<body onload="recentDream()"/>
</c:otherwise>
</c:choose>
</html>
