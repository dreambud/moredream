<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	alert("${param.email} 님 회원가입 OK!! 이제 가입하신 아이디로 로그인하세요");
	location.replace("${initParam.root }/member/login.jsp");
</script>
</body>
</html>