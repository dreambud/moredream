<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>More Dream</title>
</head>
<body>
<script>
	alert("결제가 완료되었습니다.");
	if('${bonus}'=='1'){
		alert("축하드립니다~!\n이벤트로 결제하신 금액의 두 배 금액으로 후원 되었습니다.");
	}
		location.href="${initParam.root}dream.do?command=myMoreDream&&memberId=${sessionScope.mvo.memberId}";
</script> 
</body>
</html>