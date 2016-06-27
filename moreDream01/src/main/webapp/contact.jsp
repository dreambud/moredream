<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
         #moreDreamFooterLogo {
      	margin-top: 30px;
      }
</style>
</head>
<body style="background-color: #292C2F">
<jsp:include page="./common/header.jsp"/>

<div id="moreDreamLogo" class="col-sm-12" align="center">

      <img src="${initParam.root}images/contact/moreDreamLogo.png"
         class="img-responsive">
         <br><br>
</div>

<div class="col-sm-12" align="center">
<span class="col-sm-2">
<img src="${initParam.root}images/contact/sw.png" class="img-responsive" height="250" width="250">
<br>
<font size="4" color="white">이승우<br>lazfasia@nate.com</font><br>
</span>
<span class="col-sm-2">
<img src="${initParam.root}images/contact/jy.png" class="img-responsive" height="250" width="250">
<br>
<font size="4" color="white">한준영<br>zerosxz@naver.com</font><br>
</span>
<span class="col-sm-2">
<img src="${initParam.root}images/contact/bm.png" class="img-responsive" height="250" width="250">
<br>
<font size="4" color="white">김보민<br>kbm0072@naver.com</font><br>
</span>
<span class="col-sm-2">
<img src="${initParam.root}images/contact/ks.png" class="img-responsive" height="250" width="250">
<br>
<font size="4" color="white">안균석<br>ting_sp@naver.com</font><br>
</span>
<span class="col-sm-2">
<img src="${initParam.root}images/contact/hr.png" class="img-responsive" height="250" width="250">
<br>
<font size="4" color="white">이하림<br>dbtmxlsk211@gmail.com</font><br>
</span>
<span class="col-sm-2">
<img src="${initParam.root}images/contact/hc.png" class="img-responsive" height="250" width="250">
<br>
<font size="4" color="white">박한천<br>hanchon1@gmail.com</font><br>
</span>

</div>

<div class="col-sm-12" id="moreDreamFooterLogo" align="center" style="margin-right: 10px">
<br><br>
<img src="${initParam.root}images/contact/contact_foot_bg.png" width="1650" class="img-responsive">
</div>
</body>
<jsp:include page="./common/footer.jsp"/>
</html>