<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='contextPath' value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

	function paging(pageindex)
	{
		
	
		var $loadTarget = $('#boardlist');



		var data = 'paginno=' + pageindex;
	
		$loadTarget.load('/list.do',data,function(){
			
		});
	}
</script>
<c:set var="cdList" value="${cd.cdlist}" />
<c:set var="totno" value="${cd.totno}" />
<c:set var="guswo" value="${cd.guswo}" />
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
						<td width="10%" >${((guswo-1)*10)+articleNum.count}</td>
						<td width="10%">${article.comwriter_id}</td>
						<td width="40%"><span
							style="padding-right: 30px;"></span>
									<a class="cls1"
										href="${contextPath}/viewread.do?articleno=${article.comarticleno}">${article.comtitle}</a>
						<td width="10%"><fmt:formatDate value="${article.comwriter_date}" />
						</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<div style="width:70% ; text-align: center; margin:auto" >
	  <ul class="pagination" style="justify-content: center;">
 	  <c:choose >
	   	<c:when test="${totno!=0}">
	   	<c:forEach var="tnumber" begin="1" end="${totno}" step="1">
	   		<c:choose>
	   		 	<c:when test="${tnumber==guswo }">
		   			<span class="paging page-link" >
			   			<li class="page-item active" aria-current="page">
			    			<input type="button" class="page-link" onclick='paging(${tnumber})' value='${tnumber}' />
			   			</li>
		   	 		</span>
	   			</c:when>
	   			<c:when test="${totno!=guswo}">
				    <li class="page-item">
			 		   <input type="button" class="page-link" onclick='paging(${tnumber})' value="${tnumber}" />
				    </li>
	   	 	  </c:when>
			</c:choose>
		</c:forEach>
		</c:when>
		<c:when test="${totno==0}">
		  <li class="page-item">
	   	 <a class="page-link" onclick='paging(1)'>1</a>
	    </li>
		</c:when>
		</c:choose>
	  </ul>
	</div>
	
	

