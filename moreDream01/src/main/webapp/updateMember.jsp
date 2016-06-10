<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<b>회원정보 관리</b>
<a href="member.do?command=deleteMember">탈퇴</a>
<form name="updateMember" action="member.do" method="post">
<input type="hidden" name="command" value="updateMember">
<input type="hidden" name="memberId" value="${sessionScope.mvo.memberId}">
ID (email) :: <input type="text" name="email" value="${sessionScope.mvo.email}"><br><br>
PASS :: <input type="password" name="password" value="${sessionScope.mvo.password}"><br><br>
ADDR :: <input type="text" name="address" value="${sessionScope.mvo.address}"><br><br>
NAME :: <input type="text" name="name" value="${sessionScope.mvo.name}"><br><br>
전화번호 :: <input type="text" name="phoneNumber" value="${sessionScope.mvo.phoneNumber}"><br><br>
<button type="submit">회원정보수정</button>
</form>

</body>
</html>