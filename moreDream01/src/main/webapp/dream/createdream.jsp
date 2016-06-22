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
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/ui-darkness/jquery-ui.css">

<link rel="stylesheet" href="${initParam.root}css/editor.css" type="text/css" charset="utf-8"/>
<script src="${initParam.root}js/editor_loader.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	var now = new Date();
	

	function number_chk(ev){		//숫자만 입력가능하게 제어하는 함수
		var frm = document.reg_frm;
		if (window.event) // IE코드
	        var code = window.event.keyCode;
	    else // 타브라우저
	        var code = ev.which;
		// 숫자허용 PASS항목
		if( ( code >=  48 && code <=  57 ) ||   // 숫자열 0 ~ 9 : 48 ~ 57  
			      ( code >=  96 && code <= 105 ) ||   //키패드 0 ~ 9 : 96 ~ 105
			        code <=  32 ||    //BackSpace
			        code ==  46 ||    //Delete
			        code ==  37 ||    //좌 화살표
			        code ==  39 ||    //우 화살표
			        code ==  35 ||    //End 키
			        code ==  36       //Home 키
				){
				window.event.returnValue = true;
				
		        return;
				}
		if (window.event)
	        window.event.returnValue = false;
	    else
	        Ev.preventDefault(); 
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
		$('#enableBtn').hide();
		$('#rewardDefaultDiv').hide();
		
		$('#enableBtn').click(function(){
			$('#disableBtn').show();
			$('#enableBtn').hide();
			$('#plusBtnDiv').show();
			$('#rewardInputDiv').html("<div class='col-md-3' style='margin: 10px 1px 1px 6px;background: #f1f0f0;padding: 10px 6px 6px 10px;'>	<textarea class='form-control' rows='5' placeholder='보상 정보' name='rewardInfo'></textarea><br>		<input type='text' class='form-control' placeholder='금액 기준' name='rewardGuide' onkeydown='number_chk(event);' style='IME-MODE: disabled'><br>	<input type='text' class='form-control' placeholder='재고' name='stock' onkeydown='number_chk(event);' style='IME-MODE: disabled'></div>");
		});
		$('#disableBtn').click(function(){
			$('#enableBtn').show();
			$('#disableBtn').hide();
			$('#plusBtnDiv').hide();
			$('#rewardInputDiv').html("<div class='col-md-3' style='margin-top:10px'>	<textarea class='form-control' rows='5' placeholder='보상 정보' name='rewardInfo' readonly='readonly'>-</textarea><br>		<input type='text' class='form-control' placeholder='금액 기준' name='rewardGuide' readonly='readonly' value='0'><br>	<input type='text' class='form-control' placeholder='재고' name='stock' readonly='readonly' value='0'></div>");
		});
		$('#plusBtn').click(function(){
			$('#rewardInputDiv').append(
					"<div class='col-md-3' style='margin: 10px 1px 1px 6px;background: #f1f0f0;padding: 10px 6px 6px 10px;'><textarea class='form-control' rows='5' placeholder='보상 정보' name='rewardInfo' ></textarea><br><input type='text' class='form-control' placeholder='금액 기준' name='rewardGuide' onkeydown='number_chk(event);' style='IME-MODE: disabled'><br>	<input type='text' class='form-control' placeholder='재고' name='stock' onkeydown='number_chk(event);' style='IME-MODE: disabled'></div>");
		});
		//title 글자 수
		$('#titleDream').keyup(function () {
			var inputLength = $(this).val().length;
			var remain = 15 - inputLength;
			
			var titleDream = document.getElementById("titleDream");
			var titleCheckView = document.getElementById("titleCheckView");

			if (titleDream.value.length > 15) {
				titleCheckView.innerHTML = "<font color='red'> 꿈 제목은 15자 이하로 가능합니다.</font>";
				return;
			}
			$('#titleCheckView').html(" ("+remain+"/15)");	
		});
	});
	function inputDetail() {
		 Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
		}
	 function validForm(editor) {
			// Place your validation logic here
			// sample : validate that content exists
			
			var validator = new Trex.Validator();
			var content = editor.getContent();
			
			document.getElementById("detailDream").value = content;
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
			else if(document.frm.titleDream.value.length>15){
				alert('꿈 제목은 15자 이하로 가능합니다.');
				document.frm.titleDream.focus();
				return false;
			}
			if (!validator.exists(content)) {
				alert('내용을 입력하세요');
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
			}else if(document.frm.targetFund.value<1000){
				alert('목표금액이 1000원 보다 작습니다. 1000원 이상의 목표금액을 입력하세요.');
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
					for(i=0;i<rewardInfoArr.length;i++){
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
				document.frm.submit();
				return true;
			}
			
		}
</script>


</head>
<!--/head-->

<body onload="loginCheck()">

	<jsp:include page="../common/header.jsp" />

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
	<form name="frm" action="${initParam.root}dream.do" method="post" enctype="multipart/form-data">
		<section id="shortcodes">
			<div class="container">
				<div id="feature-container">
					<input type="hidden" name="command" value="requestDream"> 

					<div class="row">
						<div class="col-md-12">
							<h2 class="page-header" align="left"><b>WHAT ?</b> <small> - 어떤 꿈을 꾸시는가요 ? </small></h2>


							카테고리 선택 <select class="form-control" name="category">
								<option value="">======선택해주세요======</option>
								<option value="디자인">디자인</option>
								<option value="패션">패션</option>
								<option value="출판">출판</option>
								<option value="요리">요리</option>
								<option value="음악">음악</option>
								<option value="공연">공연</option>
								<option value="영화">영화</option>
							</select>
						</div>

						<div class="col-md-12">
							<div align="center">
								<h2 class="page-header" align="left"><small>꿈에 대한 타이틀을 정해주세요 !<span id="titleCheckView"></small></h2>
								<textarea class="form-control" rows="2" name="titleDream" placeholder="15자 이내로 입력해주세요." id="titleDream" name="titleDream"></textarea>

								<h2 class="page-header" align="left"><b>HOW ?</b> <small> - 꿈은 어떻게 진행되는가요 ?  </small></h2>
								<input type="hidden" name="detailDream" id="detailDream">
								
									<form name="tx_editor_form" id="tx_editor_form" accept-charset="utf-8">
		<!-- 에디터 컨테이너 시작 -->
		<div id="tx_trex_container" class="tx-editor-container">
			<!-- 사이드바 -->
			<div id="tx_sidebar" class="tx-sidebar">
				<div class="tx-sidebar-boundary">
					<!-- 사이드바 / 첨부 -->
					<ul class="tx-bar tx-bar-left tx-nav-attach">
					
					</ul>
					<!-- 사이드바 / 우측영역 -->
					<ul class="tx-bar tx-bar-right">
						<li class="tx-list">
							<div unselectable="on" class="tx-btn-lrbg tx-fullscreen" id="tx_fullscreen">
								<a href="javascript:;" class="tx-icon" title="넓게쓰기 (Ctrl+M)">넓게쓰기</a>
							</div>
						</li>
					</ul>
					<ul class="tx-bar tx-bar-right tx-nav-opt">
						<li class="tx-list">
							<div unselectable="on" class="tx-switchtoggle" id="tx_switchertoggle">
								<a href="javascript:;" title="에디터 타입">에디터</a>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<!-- 툴바 - 기본 시작 -->
			<!--
				@decsription
				툴바 버튼의 그룹핑의 변경이 필요할 때는 위치(왼쪽, 가운데, 오른쪽) 에 따라 <li> 아래의 <div>의 클래스명을 변경하면 된다.
				tx-btn-lbg: 왼쪽, tx-btn-bg: 가운데, tx-btn-rbg: 오른쪽, tx-btn-lrbg: 독립적인 그룹

				드롭다운 버튼의 크기를 변경하고자 할 경우에는 넓이에 따라 <li> 아래의 <div>의 클래스명을 변경하면 된다.
				tx-slt-70bg, tx-slt-59bg, tx-slt-42bg, tx-btn-43lrbg, tx-btn-52lrbg, tx-btn-57lrbg, tx-btn-71lrbg
				tx-btn-48lbg, tx-btn-48rbg, tx-btn-30lrbg, tx-btn-46lrbg, tx-btn-67lrbg, tx-btn-49lbg, tx-btn-58bg, tx-btn-46bg, tx-btn-49rbg
			-->
			<div id="tx_toolbar_basic" class="tx-toolbar tx-toolbar-basic"><div class="tx-toolbar-boundary">
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list">
						<div id="tx_fontfamily" unselectable="on" class="tx-slt-70bg tx-fontfamily">
							<a href="javascript:;" title="글꼴">굴림</a>
						</div>
						<div id="tx_fontfamily_menu" class="tx-fontfamily-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list">
						<div unselectable="on" class="tx-slt-42bg tx-fontsize" id="tx_fontsize">
							<a href="javascript:;" title="글자크기">9pt</a>
						</div>
						<div id="tx_fontsize_menu" class="tx-fontsize-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-font">

					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-lbg 	tx-bold" id="tx_bold">
							<a href="javascript:;" class="tx-icon" title="굵게 (Ctrl+B)">굵게</a>
						</div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-bg 	tx-underline" id="tx_underline">
							<a href="javascript:;" class="tx-icon" title="밑줄 (Ctrl+U)">밑줄</a>
						</div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-bg 	tx-italic" id="tx_italic">
							<a href="javascript:;" class="tx-icon" title="기울임 (Ctrl+I)">기울임</a>
						</div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-bg 	tx-strike" id="tx_strike">
							<a href="javascript:;" class="tx-icon" title="취소선 (Ctrl+D)">취소선</a>
						</div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-slt-tbg 	tx-forecolor" id="tx_forecolor">
							<a href="javascript:;" class="tx-icon" title="글자색">글자색</a>
							<a href="javascript:;" class="tx-arrow" title="글자색 선택">글자색 선택</a>
						</div>
						<div id="tx_forecolor_menu" class="tx-menu tx-forecolor-menu tx-colorpallete"
							 unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-slt-brbg 	tx-backcolor" id="tx_backcolor">
							<a href="javascript:;" class="tx-icon" title="글자 배경색">글자 배경색</a>
							<a href="javascript:;" class="tx-arrow" title="글자 배경색 선택">글자 배경색 선택</a>
						</div>
						<div id="tx_backcolor_menu" class="tx-menu tx-backcolor-menu tx-colorpallete"
							 unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-align">
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-lbg 	tx-alignleft" id="tx_alignleft">
							<a href="javascript:;" class="tx-icon" title="왼쪽정렬 (Ctrl+,)">왼쪽정렬</a>
						</div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-bg 	tx-aligncenter" id="tx_aligncenter">
							<a href="javascript:;" class="tx-icon" title="가운데정렬 (Ctrl+.)">가운데정렬</a>
						</div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-bg 	tx-alignright" id="tx_alignright">
							<a href="javascript:;" class="tx-icon" title="오른쪽정렬 (Ctrl+/)">오른쪽정렬</a>
						</div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-rbg 	tx-alignfull" id="tx_alignfull">
							<a href="javascript:;" class="tx-icon" title="양쪽정렬">양쪽정렬</a>
						</div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-tab">
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-lbg 	tx-indent" id="tx_indent">
							<a href="javascript:;" title="들여쓰기 (Tab)" class="tx-icon">들여쓰기</a>
						</div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-rbg 	tx-outdent" id="tx_outdent">
							<a href="javascript:;" title="내어쓰기 (Shift+Tab)" class="tx-icon">내어쓰기</a>
						</div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-list">
					<li class="tx-list">
						<div unselectable="on" class="tx-slt-31lbg tx-lineheight" id="tx_lineheight">
							<a href="javascript:;" class="tx-icon" title="줄간격">줄간격</a>
							<a href="javascript:;" class="tx-arrow" title="줄간격">줄간격 선택</a>
						</div>
						<div id="tx_lineheight_menu" class="tx-lineheight-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="tx-slt-31rbg tx-styledlist" id="tx_styledlist">
							<a href="javascript:;" class="tx-icon" title="리스트">리스트</a>
							<a href="javascript:;" class="tx-arrow" title="리스트">리스트 선택</a>
						</div>
						<div id="tx_styledlist_menu" class="tx-styledlist-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-etc">
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-lbg 	tx-emoticon" id="tx_emoticon">
							<a href="javascript:;" class="tx-icon" title="이모티콘">이모티콘</a>
						</div>
						<div id="tx_emoticon_menu" class="tx-emoticon-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-bg 	tx-link" id="tx_link">
							<a href="javascript:;" class="tx-icon" title="링크 (Ctrl+K)">링크</a>
						</div>
						<div id="tx_link_menu" class="tx-link-menu tx-menu"></div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-bg 	tx-specialchar" id="tx_specialchar">
							<a href="javascript:;" class="tx-icon" title="특수문자">특수문자</a>
						</div>
						<div id="tx_specialchar_menu" class="tx-specialchar-menu tx-menu"></div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-bg 	tx-table" id="tx_table">
							<a href="javascript:;" class="tx-icon" title="표만들기">표만들기</a>
						</div>
						<div id="tx_table_menu" class="tx-table-menu tx-menu" unselectable="on">
							<div class="tx-menu-inner">
								<div class="tx-menu-preview"></div>
								<div class="tx-menu-rowcol"></div>
								<div class="tx-menu-deco"></div>
								<div class="tx-menu-enter"></div>
							</div>
						</div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-rbg 	tx-horizontalrule" id="tx_horizontalrule">
							<a href="javascript:;" class="tx-icon" title="구분선">구분선</a>
						</div>
						<div id="tx_horizontalrule_menu" class="tx-horizontalrule-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-lbg 	tx-richtextbox" id="tx_richtextbox">
							<a href="javascript:;" class="tx-icon" title="글상자">글상자</a>
						</div>
						<div id="tx_richtextbox_menu" class="tx-richtextbox-menu tx-menu">
							<div class="tx-menu-header">
								<div class="tx-menu-preview-area">
									<div class="tx-menu-preview"></div>
								</div>
								<div class="tx-menu-switch">
									<div class="tx-menu-simple tx-selected"><a><span>간단 선택</span></a></div>
									<div class="tx-menu-advanced"><a><span>직접 선택</span></a></div>
								</div>
							</div>
							<div class="tx-menu-inner">
							</div>
							<div class="tx-menu-footer">
								<img class="tx-menu-confirm"
									 src="${initParam.root}images/icon/editor/btn_confirm.gif?rv=1.0.1" alt=""/>
								<img class="tx-menu-cancel" hspace="3"
									 src="${initParam.root}images/icon/editor/btn_cancel.gif?rv=1.0.1" alt=""/>
							</div>
						</div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-bg 	tx-quote" id="tx_quote">
							<a href="javascript:;" class="tx-icon" title="인용구 (Ctrl+Q)">인용구</a>
						</div>
						<div id="tx_quote_menu" class="tx-quote-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-bg 	tx-background" id="tx_background">
							<a href="javascript:;" class="tx-icon" title="배경색">배경색</a>
						</div>
						<div id="tx_background_menu" class="tx-menu tx-background-menu tx-colorpallete"
							 unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-rbg 	tx-dictionary" id="tx_dictionary">
							<a href="javascript:;" class="tx-icon" title="사전">사전</a>
						</div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left tx-group-undo">
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-lbg 	tx-undo" id="tx_undo">
							<a href="javascript:;" class="tx-icon" title="실행취소 (Ctrl+Z)">실행취소</a>
						</div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="		 tx-btn-rbg 	tx-redo" id="tx_redo">
							<a href="javascript:;" class="tx-icon" title="다시실행 (Ctrl+Y)">다시실행</a>
						</div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-right">
					<li class="tx-list">
						<div unselectable="on" class="tx-btn-nlrbg tx-advanced" id="tx_advanced">
							<a href="javascript:;" class="tx-icon" title="툴바 더보기">툴바 더보기</a>
						</div>
					</li>
				</ul>
			</div></div>
			<!-- 툴바 - 기본 끝 -->
			<!-- 툴바 - 더보기 시작 -->
			<div id="tx_toolbar_advanced" class="tx-toolbar tx-toolbar-advanced"><div class="tx-toolbar-boundary">
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list">
						<div class="tx-tableedit-title"></div>
					</li>
				</ul>

				<ul class="tx-bar tx-bar-left tx-group-align">
					<li class="tx-list">
						<div unselectable="on" class="tx-btn-lbg tx-mergecells" id="tx_mergecells">
							<a href="javascript:;" class="tx-icon2" title="병합">병합</a>
						</div>
						<div id="tx_mergecells_menu" class="tx-mergecells-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="tx-btn-bg tx-insertcells" id="tx_insertcells">
							<a href="javascript:;" class="tx-icon2" title="삽입">삽입</a>
						</div>
						<div id="tx_insertcells_menu" class="tx-insertcells-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div unselectable="on" class="tx-btn-rbg tx-deletecells" id="tx_deletecells">
							<a href="javascript:;" class="tx-icon2" title="삭제">삭제</a>
						</div>
						<div id="tx_deletecells_menu" class="tx-deletecells-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>

				<ul class="tx-bar tx-bar-left tx-group-align">
					<li class="tx-list">
						<div id="tx_cellslinepreview" unselectable="on" class="tx-slt-70lbg tx-cellslinepreview">
							<a href="javascript:;" title="선 미리보기"></a>
						</div>
						<div id="tx_cellslinepreview_menu" class="tx-cellslinepreview-menu tx-menu"
							 unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div id="tx_cellslinecolor" unselectable="on" class="tx-slt-tbg tx-cellslinecolor">
							<a href="javascript:;" class="tx-icon2" title="선색">선색</a>

							<div class="tx-colorpallete" unselectable="on"></div>
						</div>
						<div id="tx_cellslinecolor_menu" class="tx-cellslinecolor-menu tx-menu tx-colorpallete"
							 unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div id="tx_cellslineheight" unselectable="on" class="tx-btn-bg tx-cellslineheight">
							<a href="javascript:;" class="tx-icon2" title="두께">두께</a>

						</div>
						<div id="tx_cellslineheight_menu" class="tx-cellslineheight-menu tx-menu"
							 unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div id="tx_cellslinestyle" unselectable="on" class="tx-btn-bg tx-cellslinestyle">
							<a href="javascript:;" class="tx-icon2" title="스타일">스타일</a>
						</div>
						<div id="tx_cellslinestyle_menu" class="tx-cellslinestyle-menu tx-menu" unselectable="on"></div>
					</li>
					<li class="tx-list">
						<div id="tx_cellsoutline" unselectable="on" class="tx-btn-rbg tx-cellsoutline">
							<a href="javascript:;" class="tx-icon2" title="테두리">테두리</a>

						</div>
						<div id="tx_cellsoutline_menu" class="tx-cellsoutline-menu tx-menu" unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list">
						<div id="tx_tablebackcolor" unselectable="on" class="tx-btn-lrbg tx-tablebackcolor"
							 style="background-color:#9aa5ea;">
							<a href="javascript:;" class="tx-icon2" title="테이블 배경색">테이블 배경색</a>
						</div>
						<div id="tx_tablebackcolor_menu" class="tx-tablebackcolor-menu tx-menu tx-colorpallete"
							 unselectable="on"></div>
					</li>
				</ul>
				<ul class="tx-bar tx-bar-left">
					<li class="tx-list">
						<div id="tx_tabletemplate" unselectable="on" class="tx-btn-lrbg tx-tabletemplate">
							<a href="javascript:;" class="tx-icon2" title="테이블 서식">테이블 서식</a>
						</div>
						<div id="tx_tabletemplate_menu" class="tx-tabletemplate-menu tx-menu tx-colorpallete"
							 unselectable="on"></div>
					</li>
				</ul>

			</div></div>
			<!-- 툴바 - 더보기 끝 -->
			<!-- 편집영역 시작 -->
				<!-- 에디터 Start -->
	<div id="tx_canvas" class="tx-canvas">
		<div id="tx_loading" class="tx-loading"><div><img src="${initParam.root}images/icon/editor/loading2.png" width="113" height="21" align="absmiddle"/></div></div>
		<div id="tx_canvas_wysiwyg_holder" class="tx-holder" style="display:block;">
			<iframe id="tx_canvas_wysiwyg" name="tx_canvas_wysiwyg" allowtransparency="true" frameborder="0"></iframe>
		</div>
		<div class="tx-source-deco">
			<div id="tx_canvas_source_holder" class="tx-holder">
				<textarea id="tx_canvas_source" rows="30" cols="30"></textarea>
			</div>
		</div>
		<div id="tx_canvas_text_holder" class="tx-holder">
			<textarea id="tx_canvas_text" rows="30" cols="30"></textarea>
		</div>
	</div>
					<!-- 높이조절 Start -->
	<div id="tx_resizer" class="tx-resize-bar">
		<div class="tx-resize-bar-bg"></div>
		<img id="tx_resize_holder" src="${initParam.root}images/icon/editor/skin/01/btn_drag01.gif" width="58" height="12" unselectable="on" alt="" />
	</div>
					<div class="tx-side-bi" id="tx_side_bi">
		<div style="text-align: right;">
			<img hspace="4" height="14" width="78" align="absmiddle" src="${initParam.root}images/icon/editor/editor_bi.png" />
		</div>
	</div>
				<!-- 편집영역 끝 -->
			<!-- 첨부박스 시작 -->
				<!-- 파일첨부박스 Start -->
	<div id="tx_attach_div" class="tx-attach-div">
		<div id="tx_attach_txt" class="tx-attach-txt">파일 첨부</div>
		<div id="tx_attach_box" class="tx-attach-box">
			<div class="tx-attach-box-inner">
				<div id="tx_attach_preview" class="tx-attach-preview"><p></p><img src="${initParam.root}images/icon/editor/pn_preview.gif" width="147" height="108" unselectable="on"/></div>
				<div class="tx-attach-main">
					<div id="tx_upload_progress" class="tx-upload-progress"><div>0%</div><p>파일을 업로드하는 중입니다.</p></div>
					<ul class="tx-attach-top">
						<li id="tx_attach_delete" class="tx-attach-delete"><a>전체삭제</a></li>
						<li id="tx_attach_size" class="tx-attach-size">
							파일: <span id="tx_attach_up_size" class="tx-attach-size-up"></span>/<span id="tx_attach_max_size"></span>
						</li>
						<li id="tx_attach_tools" class="tx-attach-tools">
						</li>
					</ul>
					<ul id="tx_attach_list" class="tx-attach-list"></ul>
				</div>
			</div>
		</div>
	</div>
				<!-- 첨부박스 끝 -->
		</div>
		<!-- 에디터 컨테이너 끝 -->
	</form>

								
								<h3 class="page-header" align="left"><b>첨부 파일</b>  <small> - 꿈에 대한 사진을 올려주세요 !</small></h3>
								<div align="left">
									<input type="file" name="multipartFile">
								</div>
							</div>
							<h3 class="page-header"><b>목표 금액</b>  <small> - 꿈이 진행되는데 필요한 목표 금액을 적어주세요 !  </small></h3>
							&nbsp;
							<div class="input-group">
								<input type="text" class="form-control"
									aria-label="Amount (to the nearest dollar)" name="targetFund" placeholder="" onkeydown="number_chk(event);" style='IME-MODE: disabled'>
								<span class="input-group-addon">￦</span>
							</div>
							&nbsp;
							<!-- 보상정보 추가 -->
							<h2 class="page-header"><b>For Sponsor !</b> <small>- 보상 정보를 등록해주세요 !</small>
								<span class="label label-danger" id="disableBtn">등록안함</span>
								<span class="label label-info" id="enableBtn">등록함</span>
							</h2>
							<div class="col-md-12" id="rewardInputDiv">
								<div class="col-md-3" style='margin: 10px 1px 1px 6px;background: #f1f0f0;padding: 10px 6px 6px 10px;'>
									<textarea class="form-control" rows="5" placeholder="보상 정보" name="rewardInfo"></textarea><br>
									<input type="text" class="form-control" placeholder="금액 기준" name="rewardGuide" onkeydown="number_chk(event);" style='IME-MODE: disabled'><br>
									<input type="text" class="form-control" placeholder="재고" name="stock" onkeydown="number_chk(event);" style='IME-MODE: disabled'>
								</div>
							</div>
							<span class="col-md-12" id="plusBtnDiv">
									<button type="button" class="btn btn-default btn-lg" id="plusBtn">
										<span class="glyphicon glyphicon-plus" aria-hidden="true" style="width:20px;height:20px"></span>
									</button>
								</span>
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
								<button type="button" class="btn btn-lg btn-primary" onclick="inputDetail();">
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
<script type="text/javascript">
	var config = {
		txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
		txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
		txService: 'sample', /* 수정필요없음. */
		txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
		initializedId: "", /* 대부분의 경우에 빈문자열 */
		wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
		form: 'frm'+"", /* 등록하기 위한 Form 이름 */
		txIconPath: "${initParam.root}images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
		txDecoPath: "${initParam.root}images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
		canvas: {
            exitEditor:{
                /*
                desc:'빠져 나오시려면 shift+b를 누르세요.',
                hotKey: {
                    shiftKey:true,
                    keyCode:66
                },
                nextElement: document.getElementsByTagName('button')[0]
                */
            },
			styles: {
				color: "#123456", /* 기본 글자색 */
				fontFamily: "굴림", /* 기본 글자체 */
				fontSize: "10pt", /* 기본 글자크기 */
				backgroundColor: "#fff", /*기본 배경색 */
				lineHeight: "1.5", /*기본 줄간격 */
				padding: "8px" /* 위지윅 영역의 여백 */
			},
			showGuideArea: false
		},
		events: {
			preventUnload: false
		},
		sidebar: {
			attachbox: {
				show: true,
				confirmForDeleteAll: true
			}
		},
		size: {
			contentWidth: 700 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
		}
	};

	EditorJSLoader.ready(function(Editor) {
		var editor = new Editor(config);
	});
	
</script>
	<jsp:include page="../common/footer.jsp" />
	<!--/#footer-->
</body>
</html>
