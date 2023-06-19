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
<link href="${contextPath}/assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/assets/css/bootstrap.css">
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="${contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
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
<br><br><br><br><br><br>
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;  width: 70%; margin:auto">
		<tr>
			<td style="background-color: #eeeeee; text-align: center;">글번호</td>
			<td style="background-color: #eeeeee; text-align: center;">작성자</td>
			<td style="background-color: #eeeeee; text-align: center;">제목</td>
			<td style="background-color: #eeeeee; text-align: center;">작성일</td>
		</tr>
		<c:choose>
			<c:when test="${empty cdList}">
				<tr height="10">
					<td colspan="4">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${!empty cdList}">
				<c:forEach var="article" items="${cdList}"
					varStatus="articleNum">
					<tr align="center">
						<td >${articleNum.count}</td>
						<td >${article.comwriter_id}</td>
						<td ><span
							style="padding-right: 30px;"></span>
									<a class="cls1"
										href="${contextPath}/board/viewArticle.do?articleNO=${article.comarticleno}">${article.comtitle}</a>
						<td width="10%"><fmt:formatDate value="${article.comwriter_date}" />
						</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<div >
<%-- 		<c:if test="${totArticles!=null }">
			<c:choose>
				<c:when test="${totArticles>100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<c:if test="${section>1&&page==1 }">
							<a class='no-uline'
								href="${contextPath}/board/listArticles.do?section=${section-1}&pageNum=${(section-1)*10+1}">&nbsp;pre</a>
						</c:if>
						<c:if test="${page==10}">
							<a class='no-uline'
								href="${contextPath}/board/listArticles.do?section=${section+1}&pageNum=${section*10+1}">&nbsp;next</a>
						</c:if>
					</c:forEach>
				</c:when>
				<c:when test="${totArticles==100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<a class="no-uline" href="#">${page}</a>
					</c:forEach>
				</c:when>
				<c:when test="${totArticles<100 }">
					<c:forEach var="page" begin="1" end="${totArticles/10+1}" step="1">
						<c:choose>
							<c:when test="${page==pageNum}">
								<a class="sel-page"
									href="${contextPath}/board/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
							</c:when>
							<c:otherwise>
								<a class="no-uline"
									href="${contextPath}/board/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
			</c:choose>
		</c:if> --%>
	<!-- /div>  -->
 <c:if test="${usrid!=null}">
	<div style="float:right;">
	<a href="${contextPath}/board/articleForm.do">
		<button class="w-btn w-btn" style=" background-color: #77af9c;
    color: #d7fff1;" type="button">
        글쓰기
    </button>
	</a>
	</div>
 </c:if> 
  <script src="../vendor/jquery/jquery.min.js"></script>
	
	<%@ include file="../footer.jsp"%>