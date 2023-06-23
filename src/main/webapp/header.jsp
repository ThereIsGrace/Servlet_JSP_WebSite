<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
%>
 <c:set var="user_id" value='<%=(String)session.getAttribute("user_id")%>' />
<c:set var='contextPath' value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${contextPath}/assets/css/style.css" rel="stylesheet">
<link href="${contextPath}/assets/vendor/vendpor/boxicons/boxicons.min.css" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta charset="UTF-8">
<title>강좌인</title>
</head>
<body>
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top" width="100%"; higith="300px">
    <div class="container d-flex align-items-center">
      <h1 class="logo me-auto"><a href="${contextPath}/index.jsp">강좌人</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="active" href="${contextPath}/index.jsp">홈</a></li>
          <li><a href="/">About</a></li>
          <li><a href="${contextPath}/tutor.do">강사찾기</a></li>
          <li><a href="${contextPath}/Calendar.jsp">캘린더</a></li>
          <li><a href="${contextPath }/list.do">커뮤니티</a></li>
          <li><a href="${contextPath }/ReviewReadHandler.do">리뷰</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
      
      <input type="hidden" value="${user_id}">
      <c:choose>
      <c:when test="${user_id==null}">
      	<a href="/Login.jsp" style="float:right;" class="get-started-btn">로그인</a>
	 </c:when> 
	   <c:otherwise>
	   <form  action="${contextPath}/lo.do" method="post">
	   	<input type="submit" style="float:right;" class="get-started-btn" value="로그아웃" name="logout">
	  	</form>
	   <!-- <input type="button" style="float:right;" class="get-started-btn" onclick="logout();" value="로그아웃"> -->
	 </c:otherwise>
	 </c:choose> 
	
	 <!--  <script>
		  function logout() {

			  console.log("1");
			  sessionStorage.removeItem("user_id");
			  ${user_id = null};
			  console.log("2");
		}
	  </script> -->
    </div>
  </header><!-- End Header -->
  
  </body>
  </html>
  