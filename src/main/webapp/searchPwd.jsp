<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<% 
			String id = request.getParameter("M_id");
			
		 %>
<script type="text/javascript"></script>
</head>
<body>
<form action="findPwd" method="post" name="search">
	<table align="center" border=1>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" value="${id}" /></td>
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
			<td colspan="2" align="center">
			<input type="submit" value="찾기" />
			<input type="reset" value="취소" onClick="location.href='Login.jsp'"/>
			</td>
		</tr>
	</table>
</form>

</body>
</html>