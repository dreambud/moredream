<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Portfolio Three Columns | Triangle</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

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
</head>
<jsp:include page="./header.jsp" />

<section id="page-breadcrumb">
	<div class="vertical-center sun">
		<div class="container">
			<div class="row">
				<div class="action">
					<div class="col-sm-12">
						<h1 class="title">꿈 찾기</h1>
						<p></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--/#page-breadcrumb-->

<section id="projects">
	<div class="container">
		<div class="row">
			<div class="col-md-9 col-sm-8">
				<div class="row">
					<ul class="portfolio-filter text-center">
						<li>
							<select onchange="searchFilter()" id="filter" class="form-control" class="span3">
								<option value="0">필터</option>
								<option value="1">새로운 꿈</option>
								<option value="2">마감 임박</option>
								<option value="3">최다 후원</option>
								<option value="4" >최고 후원</option>
							</select>
						</li>
					</ul>
					<!--/#dream-filter-->
					<c:forEach items="${dreamList}" var="dream">
						<c:if test="${dream.confirmRequestDream=='Y'}">
							<div class="portfolio-items">
								<div class="col-xs-6 col-sm-6 col-md-4 portfolio-item branded logos">
									<div class="portfolio-wrapper">
										<div class="portfolio-single">
											<div class="portfolio-thumb">
												<%-- <img src="./upload/dream/${dream.dream_newFilename}"
													class="img-responsive" alt=""> --%>
												<img src="./upload/dream/${dream.dream_newFilename}" width="200px" height="250px"
													class="img-responsive" alt="" style="height:270px">
											</div>
											<div class="portfolio-view">
												<ul class="nav nav-pills">
													<li><a href="dreamdetails.jsp"><i
															class="fa fa-link"></i></a></li>
													<li><a href="./upload/dream/${dream.dream_newFilename}"
														data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
												</ul>
											</div>
										</div>
										<div class="portfolio-info " style="text-align: center">
											<h2>${dream.titleDream }</h2>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>

					<div class="portfolio-pagination">
						<ul class="pagination">
							<li><a href="#">left</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li class="active"><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">6</a></li>
							<li><a href="#">7</a></li>
							<li><a href="#">8</a></li>
							<li><a href="#">9</a></li>
							<li><a href="#">right</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-4 padding-top">
				<div class="sidebar portfolio-sidebar">
					<div class="sidebar-item categories">
						<h3>Project Categories</h3>
						<ul class="nav navbar-stacked">
							<li><a href="#">Branded<span class="pull-right">(1)</span></a></li>
							<li class="active"><a href="#">Design<span
									class="pull-right">(8)</span></a></li>
							<li><a href="#">Folio<span class="pull-right">(4)</span></a></li>
							<li><a href="#">Logos<span class="pull-right">(9)</span></a></li>
							<li><a href="#">Mobile<span class="pull-right">(3)</span></a></li>
							<li><a href="#">Mockup<span class="pull-right">(4)</span></a></li>
							<li><a href="#">Php<span class="pull-right">(2)</span></a></li>
							<li><a href="#">Wordpress<span class="pull-right">(8)</span></a></li>
						</ul>
					</div>
					<div class="sidebar-item  recent">
						<h3>Recent Projects</h3>
						<div class="media">
							<div class="pull-left">
								<a href="#"><img src="images/portfolio/project1.jpg" alt=""></a>
							</div>
							<div class="media-body">
								<h4>
									<a href="#">Lorem ipsum dolor sit amet consectetur
										adipisicing elit,</a>
								</h4>
								<p>posted on 07 March 2014</p>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<a href="#"><img src="images/portfolio/project2.jpg" alt=""></a>
							</div>
							<div class="media-body">
								<h4>
									<a href="#">Lorem ipsum dolor sit amet consectetur
										adipisicing elit,</a>
								</h4>
								<p>posted on 07 March 2014</p>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<a href="#"><img src="images/portfolio/project3.jpg" alt=""></a>
							</div>
							<div class="media-body">
								<h4>
									<a href="#">Lorem ipsum dolor sit amet consectetur
										adipisicing elit,</a>
								</h4>
								<p>posted on 07 March 2014</p>
							</div>
						</div>
					</div>
					<div class="sidebar-item popular">
						<h3>Popular Projects</h3>
						<ul class="gallery">
							<li><a href="#"><img src="images/portfolio/popular1.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="images/portfolio/popular2.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="images/portfolio/popular3.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="images/portfolio/popular4.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="images/portfolio/popular5.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="images/portfolio/popular1.jpg"
									alt=""></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--/#projects-->


<jsp:include page="./footer.jsp" />

<script type="text/javascript">
	function searchFilter(){
		var filter = document.getElementById('filter').value;
		location.href="dream.do?command=getAllListDream&&filter="+filter;
	}
</script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="js/lightbox.min.js"></script>
<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>
