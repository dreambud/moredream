<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = 

function next(){
	 if(confirm("결제가 성공하였습니다 ! 다른 꿈을 보고싶으시면 yes  내 꿈 목록으로 보시려면 no 를 눌러주세요 "))
	 {
	alert('네를 누르셨습니다');
	location.href="./dream.do?command=getAllListDream";
	 }
	 else
	 {
	 alert('아니오를 누르셨습니다');
	 location.href="dream.do?command=myMoreDream&&memberId=${sessionScope.mvo.memberId}";
	 }
	};
	</script> 


</head>
<body>

</body>
</html>