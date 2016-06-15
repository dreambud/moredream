<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
function number_chk(ev){      //숫자만 입력가능하게 제어하는 함수
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
	
	$(document).ready(function() {
		$('#payment').click(function() {
			var input_money = document.frm.money.value;
			var rewardGuide = document.frm.rewardId.value;
			var v = rewardGuide.split("_");
			if(input_money<v[1]){
				alert("선택 하신 보상기준 보다 많은 금액을 입력하세요.");
			}else{
				document.frm.submit();
			}
		});//click
	});//ready 
</script>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.mvo!=null}">
			<form action="dream.do" name="frm" id="frm" method="post">
			<c:forEach items="${rewardList}" var="rl" varStatus="count">
				<table>
					<tr>
					<th><input type="radio" name="rewardId" value="${rl.rewardId}_${rl.rewardGuide}"> 선택</th>
					</tr>
					<tr>
						<th>보상 내용</th>
						<td>${rl.rewardInfo}</td>
					</tr>
					<tr>					
						<th>보상 기준</th>
						<td>${rl.rewardGuide}</td>
					</tr>
					<tr>
						<th>재고 수량</th>
						<td>${rl.stock}</td>
					</tr>
				</table>
				<br>
			</c:forEach>
			    <input name="money" type="text" onkeydown="number_chk(event);" style="IME-MODE: disabled"> 원
				<input type="hidden" name="command" value="payment"> 
				<input type="button" id="payment" value="결제하기">
			</form>
		</c:when>
		<c:otherwise>
			<b>잘못된 접근 입니다.</b>
		</c:otherwise>
	</c:choose>
</body>
</html>