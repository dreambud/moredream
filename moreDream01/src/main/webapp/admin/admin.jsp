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
<b>관리자 페이지 입니다.</b><p>
<a href="${initParam.root }member.do?command=getMemberList">회원관리</a><br>
<a href="${initParam.root }dream.do?command=getAllListDreamForAdmin">꿈관리</a><br>
<a href="${initParam.root }index.jsp">홈으로</a><br>
</body>
</html>