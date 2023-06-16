<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='contextPath' value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<!-- link href="../assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/bootstrap.css">
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"> 
<!-- 합쳐지고 최소화된 최신 CSS -->

<style>
a{
text-decoration:none;
}
</style>
<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="../assets/vendor/jquery/jquery.min.js"></script>
<body>
<br>
<br>
<br>
<br>
<br>
<c:choose>
	<c:when test="${!empty tutorsList}">
		<c:forEach var="tutor" items="${tutorsList}">
			<div class="form-floating" style="width: 1000px; margin: 0 auto;">
  				<select class="form-select" id="floatingSelect" aria-label="Floating label select example">
    				<option value="${tutor.t_name}">${tutor.subject}+" "+${tutor.t_name}</option>
  				</select>
  				<label for="floatingSelect">수강평을 작성할 선생님을 골라주세요.</label>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="no-review" style="width: 400px; margin:0 auto;">
			<span style="font-size:20px; width: 600px; text-align:center;">수강평을 작성할 선생님이 없어요!<br> 
			&nbsp&nbsp&nbsp과외를 시작하러 가보세요</span>
		</div>
	</c:otherwise>
</c:choose>
	<div class="container-get">
		<div class="form-floating" style="width:800px; margin: 0 auto;">
		  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" name="content"></textarea>
		  <label for="floatingTextarea">한줄 수강평</label>
		</div>
	</div>
	
	<div class="btn-group" style="width: 200px; margin-left: 500px;">
	  <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	    별점
	  </button>
	  <ul class="dropdown-menu">
	    <li class="dropdown-item">0</li>
	    <li>1</li>
	    <li>2</li>
	    <li>3</li>
	    <li>4</li>
	    <li>5</li>
	  </ul>
	</div>
</body>
</html>
	<%@ include file="../footer.jsp"%>
