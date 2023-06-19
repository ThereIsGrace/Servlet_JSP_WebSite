<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/bootstrap.css">
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"> -->

<title>Insert title here</title>
		<% 
			String id = request.getParameter("M_id");
			
		 %>
<script type="text/javascript"></script>
</head>
<body><br><br><br><br><br><br>
	<form action="findPwd" method="post" name="search">
		<table align="center" border=1>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${id}" autofocus /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" /></td>
			</tr>
			<tr>
				<td>
					<select id="user_level" name="user">
				       <option value="학생용" >학생용</option>
				       <option value="강사용" >강사용</option>
				    </select>
			    </td>
				<td colspan="2" align="center">
				<input type="submit" value="찾기" />
				<input type="reset" value="취소" onClick="location.href='Login.jsp'"/>
				</td>
			</tr>
		</table>
	</form>
<%@ include file="./footer.jsp"%>