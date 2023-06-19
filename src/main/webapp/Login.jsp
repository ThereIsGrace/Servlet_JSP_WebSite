<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='contextPath' value="${pageContext.request.contextPath}" />
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>	 
		<% 
			String error_message = request.getParameter("error_message");
			String id = request.getParameter("M_id");
			String pwd = request.getParameter("M_pwd");
		 %>
					
	</head>
	<link href="../assets/css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="../assets/css/bootstrap.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script>
	function idInfo(){
		window.alert('아이디가 틀립니다. 다시 입력해 주세요');
	}
	function pwdInfo() {
		window.alert('비밀번호가 틀립니다. 다시 입력해 주세요')
	}
	function showId(){
		$('#idsection').append("아이디: ${M_id}");
	}
	function showPwd(){
		$('#pwdsection').append("비밀번호: ${M_pwd}");
	}
	
	</script>
	<body width="100px" height="800px">
	<c:choose>
		<c:when test="${!empty error_message}">
			<c:if test="${error_message == 'id_error'}">
				<script>
				idInfo();
				</script>
			</c:if>
			<c:if test="${error_message == 'pwd_error'}">
				<script>
				pwdInfo();
				</script>
			</c:if>
		</c:when>
	</c:choose>
		<form action="login.do" method="post" name="frm"  margin=100px>
			<table align="center" width="400px" border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" placeholder="ID" name="user_id" autofocus /></td>
					<td rowspan="2"><input type="submit" value="로그인"  /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" placeholder="Password" name="user_password" /></td>
				</tr>
				<tr>
					<td>
		                <select id="user_level" name="user">
		                    <option value="학생용" >학생용</option>
		                    <option value="강사용" >강사용</option>
		                    
		                </select>
		            </td>
					<td colspan="2">
		                <input type="button" value="회원가입" />
		                <input type="button" value="id찾기" onclick="location.href='searchId.jsp'" />
		                <input type="button" value="비밀번호 찾기" onclick="location.href='searchPwd.jsp?M_id=${M_id}'"  />
		            </td>
				</tr>
			</table>
			<c:choose>
				<c:when test="${!empty M_id}">
					<div id="idsection" align="center">
						<script>
							showId();
						</script>
					</div>
				</c:when>
				<c:otherwise>
					<div>아이디가 존재하지 않습니다.</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${!empty M_pwd}">
					<div id="pwdsection" align="center">
						<script>
							showPwd();
						</script>
					</div>
				</c:when>
				<c:otherwise>
					<div>비밀번호가 존재하지 않습니다.</div>
				</c:otherwise>
			</c:choose>
		</form>
	</body>
</html>