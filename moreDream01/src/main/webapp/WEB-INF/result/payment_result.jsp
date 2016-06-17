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
	alert("결제가 완료되었습니다.")
	 location.href="dream.do?command=myMoreDream&&memberId=${sessionScope.mvo.memberId}";
	};
	</script> 


</head>
<body>

</body>
</html>