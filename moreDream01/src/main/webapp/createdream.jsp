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
<script type="text/javascript">
	var now = new Date();
	function create(){
		var rewardInfoArr = document.frm.rewardInfo;
		if(document.frm.category.value==""){
			alert('카테고리를 선택해주세요');
			document.frm.category.focus();
			return false;
		}
		else if(document.frm.titleDream.value==""){
			alert('꿈 제목을 입력해주세요.');
			document.frm.titleDream.focus();
			return false;
		}
		else if(document.frm.detailDream.value==""){
			alert('꿈 내용을 입력해주세요.');
			document.frm.detailDream.focus();
			return false;
		}
		else if(document.frm.multipartFile.value==""){
			alert('파일을 반드시 등록해야합니다.');
			document.frm.multipartFile.focus();
			return false;
		}
		else if(document.frm.targetFund.value==""||document.frm.targetFund.value=="0"){
			alert('목표금액을 설정해주세요 ');
			document.frm.targetFund.focus();
			return false;
		}else if(document.frm.targetFund.value<100000){
			alert('목표금액이 10만원 보다 작습니다. 10만원 이상의 목표금액을 입력하세요.');
			document.frm.targetFund.focus();
			return false;
		}else if(document.frm.startDate.value==""){
			alert('시작일자를 선택하세요.');
			document.frm.startDate.focus();
			return false;
		}else if(document.frm.endDate.value==""){
			alert('마감일자를 선택하세요.');
			document.frm.endDate.focus();
			return false;
		}else{
			if(rewardInfoArr.length==undefined){//보상내역이 한개일때
				if(document.frm.rewardInfo.value==""){
					alert('보상정보를 입력하세요.');
					document.frm.rewardInfo.focus();
					return false;
				}else if(document.frm.rewardGuide.value==""){
					alert('보상 기준액 입력하세요.');
					document.frm.rewardGuide.focus();
					return false;
				}else if(document.frm.stock.value==""){
					alert('보상 수량 입력하세요.');
					document.frm.stock.focus();
					return false;
				}
			}else if(rewardInfoArr.length>=2){
				var rewardGuideArr = document.frm.rewardGuide;
				var stockArr = document.frm.stock;
				for(i=0;i<=rewardInfoArr.length;i++){
					if(rewardInfoArr[i].value==""){
						alert('보상정보를 입력하세요.');
						rewardInfoArr[i].focus();
						return false;
					}else if(rewardGuideArr[i].value==""){
						alert('보상 기준액 입력하세요.');
						rewardGuideArr[i].focus();
						return false;
					}else if(stockArr[i].value==""){
						alert('보상 수량 입력하세요.');
						stockArr[i].focus();
						return false;
					}
				}
			}
		}
	}
	$(function() {
		$('#datePicker1').datepicker(
				{
					dateFormat : "yy-mm-dd",
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					minDate : now
				});
	});
	$(function() {
		$('#datePicker2').datepicker(
				{
					dateFormat : "yy-mm-dd",
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					minDate : now
				});
	});
	$(document).ready(function(){
		$('#plusBtn').click(function(){
			$(this).before(
					"<div class='col-md-4' style='margin-top:10px'><textarea class='form-control' rows='5' placeholder='보상 정보' name='rewardInfo'></textarea><br><input type='text' class='form-control' placeholder='금액 기준' name='rewardGuide'><br>	<input type='text' class='form-control' placeholder='재고' name='stock'></div>");
		});
	});
</script>
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
<!--/head-->

<body>

	<jsp:include page="./header.jsp" />

	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">꿈 꾸기</h1>
							<p>당신의 꿈을 실현시켜보세요 !</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#page-breadcrumb-->
	<form name="frm" action="./dream.do" method="post" enctype="multipart/form-data" onsubmit="return create();">
		<section id="shortcodes">
			<div class="container">
				<div id="feature-container">
					<input type="hidden" name="command" value="requestDream"> 

					<div class="row">
						<div class="col-md-12">
							<h2 class="page-header" align="left"><b>WHAT ?</b> <small> - 어떤 꿈을 꾸시는가요 ? </small></h2>


							카테고리 선택 <select class="form-control" name="category">
								<option value="">======선택해주세요======</option>
								<option value="영화">영화</option>
								<option value="출판">출판</option>
								<option value="음악">음악</option>
							</select>
						</div>

						<div class="col-md-12">
							<div align="center">
								<h2 class="page-header" align="left"><small>꿈에 대한 타이틀을 정해주세요 !</small></h2>
								<textarea class="form-control" rows="2" name="titleDream"></textarea>

								<h2 class="page-header" align="left"><b>HOW ?</b> <small> - 꿈은 어떻게 진행되는가요 ?  </small></h2>
								<textarea class="form-control" rows="5" name="detailDream"></textarea>

								<h3 class="page-header" align="left"><b>첨부 파일</b>  <small> - 꿈에 대한 사진을 올려주세요 !</small></h3>
								<div align="left">
									<input type="file" name="multipartFile">
								</div>
							</div>
							<h3 class="page-header"><b>목표 금액</b>  <small> - 꿈이 진행되는데 필요한 목표 금액을 적어주세요 !  </small></h3>
							&nbsp;
							<div class="input-group">
								<input type="text" class="form-control"
									aria-label="Amount (to the nearest dollar)" name="targetFund" placeholder="">
								<span class="input-group-addon">￦</span>
							</div>
							&nbsp;
							<!-- 보상정보 추가 -->
							<h2 class="page-header"><b>For Sponsor !</b> <small>- 보상 정보를 등록해주세요 !</small></h2>
							<div class="col-md-12">
	
								<div class="col-md-4" style='margin-top:10px'>
									<textarea class="form-control" rows="5" placeholder="보상 정보" name="rewardInfo"></textarea><br>
									<input type="text" class="form-control" placeholder="금액 기준" name="rewardGuide"><br>
									<input type="text" class="form-control" placeholder="재고" name="stock">
								</div>
								
								<button type="button" class="btn btn-default btn-lg" id="plusBtn">
									<span class="glyphicon glyphicon-plus" aria-hidden="true" style="width:20px;height:20px"></span>
								</button>
								
								&nbsp;
							</div>
							&nbsp;
							<h2 class="page-header"><b>WHEN ?</b> <small>- 진행 과정 및 기한은 어떻게 되나요 ? </small></h2>
							&nbsp;
							<div class="col-md-12">

								<div class="col-md-6">
									<input id="datePicker1" name="startDate" type="text"
										class="form-control" placeholder="시작일을 선택해주세요">
								</div>


								<div class="col-md-6">
									<input id="datePicker2" name="endDate" type="text"
										class="form-control" placeholder="종료일을 선택해주세요">
								</div>
							</div>

							&nbsp; &nbsp;

							<h2 class="page-header"></h2>
							&nbsp;
							<div align="right">
								<button type="submit" class="btn btn-lg btn-primary">
									<i class="fa fa-heart"></i> 꿈 신청
								</button>
								&nbsp;
							</div>
							&nbsp;

						</div>

					</div>
				</div>

				<!--/#feature-container-->
			</div>
		</section>
	</form>

	<jsp:include page="./footer.jsp" />
	<!--/#footer-->
</body>
</html>
