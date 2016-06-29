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

<script type="text/javascript">
	function number_chk(ev) { //숫자만 입력가능하게 제어하는 함수
		if (window.event) // IE코드
			var code = window.event.keyCode;
		else			  // 타브라우저
			var code = ev.which;
		// 숫자허용 PASS항목
		if ((code >= 48 && code <= 57) || // 숫자열 0 ~ 9 : 48 ~ 57  
		(code >= 96 && code <= 105) || //키패드 0 ~ 9 : 96 ~ 105
		code < 32 || //BackSpace
		code == 46 || //Delete
		code == 37 || //좌 화살표
		code == 39 || //우 화살표
		code == 35 || //End 키
		code == 36  //Home 키
		) {
			window.event.returnValue = true;
			return;
		}
		if (window.event)
			window.event.returnValue = false;
		else
			Ev.preventDefault();
	}
</script>
<body>

	<jsp:include page="../common/header.jsp" />
	<!--/#header-->

	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">꿈 응원하기</h1>
							<p>당신의 꿈을 실현시켜보세요 !</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!--/#page-breadcrumb-->

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-6">
				<c:choose>
					<c:when test="${sessionScope.mvo!=null}">
						<form name="frm" id="frm" method="post">
							<c:forEach items="${rewardList}" var="rl" varStatus="count">

								<div>
									<div>
<%-- 										<input type="radio" name="rewardId" value="${rl.rewardId}_${rl.rewardGuide}"> 선택 --%>
									</div>
									<div>
										<h3 class="page-header">
											<span>${rl.rewardGuide}</span> <span>원 이상 밀어주시는 분께</span> <span>드리는
												특전</span>
										</h3>

										<div class="input-group">

											<input value="${rl.rewardGuide}" name="input_money" type="text"
												onkeydown="number_chk(event);" style="IME-MODE: disabled"
												class="form-control" /> 
											<span class="input-group-btn">
												<button	type="button" id="payment" name="reward" value="${rl.rewardId}_${rl.rewardGuide}"
													class="btn btn-large btn-primary" onclick="javascript:pay('${count.count-1}','${rewardList.size()}');">결제하기
													</button>
											</span>

										</div>
										<p>

											<input type="hidden" name="command" value="payment">
										<p align="center"></p>
										<span class="label label-primary">더 많이 입력 하실 수있습니다</span>
										<p>
										<div>
											<span class="badge badge-info">보상 내용</span> <span
												class="label label-info">${rl.rewardInfo}</span>
											<p>
												<span class="badge badge-info">재고 수량</span> <span
													class="label label-info">${rl.stock}</span>
										</div>
									</div>
								</div>
								<hr>
							</c:forEach>
							<input type="hidden" id="rewardId" name="rewardId">
							<input type="hidden" id="money" name="money">
						</form>
					</c:when>
					<c:otherwise>
						<b>잘못된 접근 입니다.</b>
					</c:otherwise>
				</c:choose>

			</div>

		</div>
	</div>
<script type="text/javascript">
	function pay(i,index){
		if(index==1){
			var input_money = document.frm.input_money;
			var rewardGuide = document.frm.reward.value;
		}else{
			var input_money = document.frm.input_money[i];
			var rewardGuide = document.frm.reward[i].value;
		}
		var v = rewardGuide.split("_");
		if (input_money.value==""||input_money.value=="0"){
			alert("0 또는 공백을 입력할 수 없습니다.");
			input_money.focus();
			return false;
		}
		if (input_money.value < v[1]) {
			alert("선택 하신 보상기준 보다 많은 금액을 입력하세요.");
			input_money.focus();
			return false;
		} 
		document.frm.rewardId.value = v[0];
		document.frm.money.value = input_money.value;
		document.frm.action="${initParam.root}dream.do";
		document.frm.submit();
		return true;
	}
</script>
	<jsp:include page="../common/footer.jsp" />
	<!--/#footer-->
</body>
</html>
