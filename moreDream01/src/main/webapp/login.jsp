<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center><h2>Login Form...</h2></center><p>
<form action="member.do" method="post">
<input type="hidden" name="command" value="login">
ID(email) : <input type="text" name="email"><br><br>
PASS : <input type="password" name="password"><br><br>
<input type="submit" value="로그인">
</form><hr>

</body>
</html>