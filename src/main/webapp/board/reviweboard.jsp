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
<title>Insert title here</title>
</head>
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
  table {
  	margin: auto;
    width: 60%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>
<body>
<br><br><br><br><br><br>
	<table >
		<tr>
			<td style="width:8%" >글번호</td>
			<td style="width:8%" >작성자</td>
			<td style="width:20%; text-align: center;">내용</td>
			<td style="width:10%">리뷰점수</td>
			<td style="width:8%">선생님</td>
			<td style="width:8%">과목</td>
			<td style="width:10%" >리뷰날짜</td>
		</tr>
		<c:choose>
			<c:when test="${empty review}">
				<tr >
					<td colspan="7">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${!empty review}">
				<c:forEach var="re" items="${review}"
					varStatus="articleNum">
					<tr >
						<td style="width:8%">${articleNum.count}</td>
						<td style="width:8%">${re.writer_id}</td>
						<td style="width:20%;text-align: center; ">${re.content}</td>
						<td style="width:10%" >5/${re.grade}</td>
						<td style="width:8%">${re.t_name}</td>
						<td style="width:8%">${re.subject} </td>
						<td width="10%">${re.writer_date} </td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<div >
  <script src="../vendor/jquery/jquery.min.js"></script>
	<%@ include file="../footer.jsp"%>