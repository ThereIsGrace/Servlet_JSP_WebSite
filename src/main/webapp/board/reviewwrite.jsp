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
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale"="1">
<link rel="stylesheet" href="../assets/css/bootstrap2.css">
<link rel="stylesheet" href="../assets/css/custom.css">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script> -->
<title>JSP 게시판 웹 사이트</title>

</script>
				<script>
				  $(function() {
				    $("#submit_button")
				      .click(function() { alert("Hello"); });
				  });
				</script>
</head>
<body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>




		

<div class="container">
			<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">과외선생님 수강평</th>						
					</tr>
				</thead>
 	<c:choose>
		<c:when test="${ !empty teacherList }">
			<c:forEach var="tutor" items="${tutorList}">	 
				<div class="btn-group">
				  <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
				    선생님 선택
				  </button>
				  <ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="#">${tutor.subject}/${tutor.name}</a></li>
				  </ul>
				</div>
 			</c:forEach>
		</c:when>
		<c:when test="${ empty teacherList }">
			<div class="no-review">
				<p><span>죄송하지만 과외선생님을 찾을 수 없으므로 리뷰를 작성하실 수 없습니다.</span></p>
			</div>
		</c:when>		
	</c:choose> 
			<div class="input-group mb-3">
  				<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">별점선택</button>
  					<ul class="dropdown-menu">
    					<li><a class="dropdown-item" href="#" name=1>1</a></li>
    					<li><a class="dropdown-item" href="#" name=2>2</a></li>
    					<li><a class="dropdown-item" href="#" name=3>3</a></li>
    					<li><a class="dropdown-item" href="#" name=4>4</a></li>
    					<li><a class="dropdown-item" href="#" name=5>5</a></li>
  					</ul>
				</div>
			</div>

				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="article" maxlength="50"></td>
					</tr> 
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="3000" style="height: 350px"></textarea></td>						
					</tr>
				</tbody>
			</table>
			<input class="btn btn-success" id="submit_button" type="submit" value="제출">
			<input class="btn btn-success" type="reset" value="취소">
			</form>						
		</div>
	</div>
	 
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


</body>
</html>
	<%@ include file="../footer.jsp"%>
