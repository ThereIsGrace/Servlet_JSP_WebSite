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
<link href="../assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/bootstrap.css">
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<style>
a{
text-decoration:none;
}
.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
</style>
<body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div class="container">
	<div class="row">
		<form name="frmLogin" method="post" action="${contextPath}/bulletinwrite.do">
			<table class="table table-striped table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">커뮤니티 자유게시판</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" name="userId"></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>
					</tr> 
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="3000" style="height: 350px"></textarea></td>						
					</tr>
				</tbody>
			</table>
			<input class="btn btn-success" type="submit" value="제출">
			<input class="btn btn-success" type="reset" value="취소">
			</form>						
		</div>
	</div>
	 
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="../vendor/jquery/jquery.min.js"></script>
</body>
</html>
	<%@ include file="../footer.jsp"%>