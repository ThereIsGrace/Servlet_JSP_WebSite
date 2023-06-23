<%@page import="project.VO.MenTeeVO"%>
<%@page import="project.DAO.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='contextPath' value="${pageContext.request.contextPath}" />
<%@ include file="./header.jsp"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>	 
		<% 
			String error_message = request.getParameter("error_message");
			String M_id = request.getParameter("M_id");
			String M_pwd = request.getParameter("M_pwd");
		 	String T_id = request.getParameter("T_id");
			String T_pwd = request.getParameter("T_pwd");
			
		 %>
					
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	function idInfo(){
		window.alert('아이디가 틀립니다. 다시 입력해 주세요');
	}
	function pwdInfo() {
		window.alert('비밀번호가 틀립니다. 다시 입력해 주세요')
	}
	function showM_Id(){
		$('#idsection').append("찾은 아이디: ${M_id}");
	}
	function showM_Pwd(){
		$('#pwdsection').append("찾은 비밀번호: ${M_pwd}");
	}
	function showT_Id(){
		$('#idsection').append("찾은 아이디: ${T_id}");
	}
	function showT_Pwd(){
		$('#pwdsection').append("찾은 비밀번호: ${T_pwd}");
	} 
	
	</script>
	<body>
	<div style="height: 90px;"></div>
		<main style='background-color: #e9ecef; height: 800px;'>
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
			<form action="login.do" method="post" name="frm">
				
				<div style='height: 30px;'></div>
					<h1 align="center" class="logo me-auto" ><a href="index.jsp" style='color: green'>강좌人</a></h1>
				<div style='height: 30px;'></div>
				<table class="shadow p-3 mb-5 bg-body-tertiary rounded" align="center" style= 'background-color:#f8f9fa; color: green; width: 450px; border-radius: 8px;'>
					<tr>
						<td align="center" width="100px" height="60px" color="green">아이디</td>
						<td><input type="text" placeholder="ID" name="user_id" autofocus width="120px" /></td>
						<td rowspan="2"><input type="submit" value="로그인" class="btn btn-outline-success" width="100%" height="100%" /></td>
					</tr>
					<tr>
						<td align="center" height=80px>비밀번호</td>
						<td><input type="password" placeholder="Password" name="user_password" /></td>
					</tr>
					<tr>
						<td height=60px align=center>
			                <select id="user_level" name="user">
			                    <option value="학생용" >학생용</option>
			                    <option value="강사용" >강사용</option>
			                    
			                </select>
			            </td>
						<td colspan="2" style='margin: 0,auto'>
			                <input type="button" value="회원가입" class="btn btn-outline-success" onclick="location.href='${contextPath }/IdHandler.do'" />
			                <input type="button" value="id찾기" onclick="location.href='searchId.jsp'" class="btn btn-outline-success" />
			                <input type="button" value="비밀번호 찾기" onclick="location.href='searchPwd.jsp?user_id=${user_id}'" class="btn btn-outline-success" />
			            </td>
					</tr>
					<tr height=200px></tr>
					<tr height=100px>
						<td colspan=3 align="center">
							<c:choose>
								<c:when test="${!empty M_id}">
									<div id="idsection" align="center">
										<script>
											showM_Id();
										</script>
									</div>
								</c:when>
								<c:when test="${!empty T_id}">
									<div id="idsection" align="center">
										<script>
											showT_Id();
										</script>
									</div>
								</c:when>
								<c:otherwise>
									<div>아이디가 존재하지 않습니다.</div>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr height=100px>
						<td colspan=3 align="center">
							<c:choose>
								<c:when test="${!empty M_pwd}">
									<div id="pwdsection">
										<script>
											showM_Pwd();
										</script>
									</div>
								</c:when>
								<c:when test="${!empty T_pwd}">
									<div id="pwdsection" align="center">
										<script>
											showT_Pwd();
										</script>
									</div>
								</c:when>
								<c:otherwise>
									<div>비밀번호가 존재하지 않습니다.</div>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
			</table>
			<div style='height: 100px;'></div>		
		</form>
		</main>
	</body>
<%@ include file="./footer.jsp"%>
		
	
		
