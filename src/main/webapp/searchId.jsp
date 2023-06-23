<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link href="./assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/bootstrap.css">
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"> -->
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
</head>
<main style='background-color: #e9ecef; height: 800px;'>
	<form action="findId" method="post" name="search">
		<div style='height: 250px;'></div>
		<div style='height: 30px;'></div>
			<h1 align="center" class="logo me-auto" ><a href="index.jsp" style='color: green'>강좌人</a></h1>
		<div style='height: 30px;'></div>
		<table align="center"  class="shadow p-3 mb-5 bg-body-tertiary rounded" align="center" style= 'background-color:#f8f9fa; color: green; width: 350px; border-radius: 8px;'>
			<tr>
				<td height=80px align="center">이름</td>
				<td><input type="text" name="name" autofocus /></td>
			</tr>
			<tr>
				<td height=80px align="center">전화번호</td>
				<td><input type="text" name="phone" /></td>
			</tr>
			<tr>
				<td align="center" height=60px>
					<select id="user_level" name="user">
				       <option value="학생용" >학생용</option>
				       <option value="강사용" >강사용</option>
				    </select>
			    </td>
				<td colspan="2">
				<input type="submit" value="찾기" class="btn btn-outline-success" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="취소" class="btn btn-outline-success" onClick="location.href='Login.jsp'"/>
				</td>
			</tr>
		</table>
	</form>
	</main>
	<%@ include file="./footer.jsp"%>
