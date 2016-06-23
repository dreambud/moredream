<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert('${sessionScope.mvo.name} 님 회원정보가 수정 완료 되었습니다.');
	location.replace("${initParam.root }member/updateMember.jsp");
</script>

</body>
</html>