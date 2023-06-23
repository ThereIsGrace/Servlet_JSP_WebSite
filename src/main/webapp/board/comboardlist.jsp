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
</style>
<body>
<br><br><br><br><br><br>
<div id="boardlist" >
	<jsp:include page="list.jsp"></jsp:include>
</div>
 <c:if test="${user_id!=null}">
	<div style="float:right;">
	<a href="/board/comwrite.jsp">
		<button class="w-btn w-btn" style=" background-color: #77af9c;
    color: #d7fff1;" type="button">
        글쓰기
    </button>
	</a>
	</div>
 </c:if> 
  
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	
	
<!-- 	
	$(function(){
		
		$('.paging').click(function(){
		$.ajax({
			url:"/bulletinwrite.do", // servlet
			type: "post",
			datatype:"json",
			data:JSON.stringify(submitObj),
			success:function(data){

		    var  result = new Array;
		    result = data.resultList;
		    var searchVO = data.searchVO;
		    var realEnd = searchVO.realEnd;
		    var startData = searchVO.startData;
		    var startButtonData = startData - 1;
		    var endData = searchVO.endData;
		    var endButtonData = endData + 1;
		    var pageIndex = searchVO.pageIndex;
		    var resultCnt = data.resultCnt;
		    var totalPageCnt = data.totalPageCnt;
		    var recordCountPerPage = searchVO.recordCountPerPage;
		    
		    
		    var ii = (resultCnt - (pageIndex - 1) * recordCountPerPage);
		    
		    var content = '';
		    var content2 = '';
		    
		    $.each(result, function(key, value) {
		        
		        content +=    '<tr class="memList">';
		        content +=    '<td class="t_c">' + ii + '</td>';
		        content +=    '<td class="t_c">' + result.comwriter_id + '</td>';
		        content +=    '<td class="t_c">' + result.comtitle + '</td>';
		        content +=    '<td class="t_c">' + result.comwriter_date  +'</td>';
		        content +=    '</tr>';
		         ii--;
		      });

		    
		    $(".listData").html(content);    
		    
		    content2 = '<input type="hidden" id="pageIndex" name="pageIndex" value="1">';
		    content2 +=    '<ol class="pagination" id="pagination">';
		    
		    if(searchVO.prev){
		        content2 +=    '<li class="prev_end"><a href="javascript:void(0);" onclick="fn_go_page(1); return false;" ></a></li>';    
		        content2 +=    '<li class="prev"><a href="javascript:void(0);"  onclick="fn_go_page(' + startButtonData + '); return false;" ></a></li>';    
		    }
		    
		    for (var num=startData; num<=endData; num++) {
		         if (num == pageIndex) {
		             content2 +=    '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '"  class="num on">' + num + '</a></li>';
		         } else {
		             content2 +=    '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '" class="num">' + num + '</a></li>';
		         }
		    }
		    
		    if(searchVO.next){
		        content2 +=    '<li class="next"><a href="javascript:void(0);"  onclick="fn_go_page(' + endButtonData + '); return false;" ></a></li>';    
		        content2 +=    '<li class="next_end"><a href="javascript:void(0);" onclick="fn_go_page(' + searchVO.realEnd +'); return false;"></a></li>';    
		    }
		    
		    content2 +=    '</ol>';
		    content2 +=    '</div>';
		 
		    $(".pagination").html(content2);
		    
		 }) 
		 .fail(function(e) {  
		     alert("검색에 실패하였습니다.");
		 }) 
		 .always(function() { 
		     
		 }); 
		}
		
	})
		
	}); -->


	
	
	</script>
	
	<%@ include file="../footer.jsp"%>