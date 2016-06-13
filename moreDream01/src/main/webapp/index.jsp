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
    
    
    
    
</head><!--/head-->

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
                <h1 class="title text-center wow fadeInDown" data-wow-duration="500ms" data-wow-delay="300ms">Recent Projects</h1>
                <p class="text-center padding-bottom wow fadeInDown" data-wow-duration="400ms" data-wow-delay="400ms">Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br>
                Ut enim ad minim veniam, quis nostrud </p>
                <div class="col-sm-3 col-xs-6 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                    <div class="portfolio-wrapper">   
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="images/portfolio/1.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="images/portfolio/1.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-xs-6 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="400ms">
                    <div class="portfolio-wrapper">   
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="images/portfolio/2.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="images/portfolio/2.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-xs-6 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="500ms">
                    <div class="portfolio-wrapper">   
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="images/portfolio/3.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="images/portfolio/3.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-xs-6 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                    <div class="portfolio-wrapper">   
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="images/portfolio/4.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="images/portfolio/4.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-xs-6 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="700ms">
                    <div class="portfolio-wrapper">   
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="images/portfolio/5.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="images/portfolio/5.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-xs-6 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="800ms">
                    <div class="portfolio-wrapper">   
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="images/portfolio/6.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="images/portfolio/6.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-xs-6 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
                    <div class="portfolio-wrapper">   
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="images/portfolio/7.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="images/portfolio/7.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-xs-6 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="1000ms">
                    <div class="portfolio-wrapper">   
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="images/portfolio/8.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="images/portfolio/8.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
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
</html>
