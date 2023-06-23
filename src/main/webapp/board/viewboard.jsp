<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js">
	</script>
	<style>
#tr_btn_modify {
	display: none;
}
</style>
</head>
<body>
<br><br><br>
<br><br><br>
	<form name="frmArticle" method="post" action="${contextPath}">
 		<table  class="table table-striped table-hover" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">커뮤니티 자유게시판</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
					<td>작성자 아이디:${view.comwriter_id}
					<input name="userid" type="hidden" value="${user_id}" /></td>
					</tr>
					<tr>
						<td><input  id="i_title" type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50" value="${view.comtitle}"  disabled></td>
					</tr> 
					<tr>
						<td><textarea id="i_content"class="form-control" placeholder="글 내용" name="content" maxlength="3000" style="height: 350px;" disabled>
						 ${view.comcontent} 
						 </textarea></td>						
					</tr>
					<tr>
					<td> 작성날짜${view.comwriter_date}
					 <input name="articleno" type="hidden" value="${view.comarticleno}"></td>
					</tr>
			</tbody>
			<tr id="tr_btn_modify">
				<td colspan="2" align="center">
				<input type=button value="수정반영하기" onClick="fn_modify_article(frmArticle)">
				<input type=button value="취소" onClick="backToList(frmArticle)"></td>
			</tr>
			
			<tr id="tr_btn">
				<td colspan=2 align=center>
				<c:if test="${user_id==view.comwriter_id}">
					<input type=button value="수정하기" onClick="fn_enable(this.form)"> 
				<!-- 수정하기를 누르면 fn_enable이 실행이됨 this.form은 이페이지의 form문에 적용해라 이런소리 -->
					<input type=button value="삭제하기" onClick="fn_remove_article(${view.comarticleno})">
					</c:if>
					<input type=button value="리스트로 돌아가기" onClick="backToList(this.form)">
				</td>
			</tr>
		</table>
	</form>
	<script>
     function backToList(obj) {
	    obj.action="${contextPath}/list.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){
		//수정하기를 누르면 실행됨 i_title이라는 아이디를가진 태그의 disabled의 기능을 false시켜라 즉 종료시켜라
		//input타입의 i title은 diabled에서 수정불가였다가 false명령어를 주면서 수정가능한상태로만듬
		//그리고 보이지않던 수정반영하기 버튼을 block로 변경하여 보이게만들고
		//trbtn버튼 수정하기 삭제하기 답글 리스트 돌아가기 버튼이 none으로 변경되어 보이지않음
		 document.getElementById("i_title").disabled=false;
		//글번호와 작성자와 작성날짜는 여전히 disabled이기떄문에 변경할수없다. 변경할수있는부분은 타이틀과 내용뿐.
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/bulletinUpdate.do";
		 obj.submit();
		//변경반영하기하면 요버튼이눌리면서 위의 경로로 submit가됨
		//그러면 이 게시글 번호의 값이 변경됨 
	 }
	 
	function fn_remove_article(articleNO){
		//삭제할 번화와 삭제할수있는 sql문 delete문으로 가는 url를 버튼에서 fuction으로 넘겨줌 
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", "${contextPath}/bulletinDelete.do");
	 	 var articleNOInput = document.createElement("input");
	  	 articleNOInput.setAttribute("type","hidden");
	  	 articleNOInput.setAttribute("name","articleno");
	   	 articleNOInput.setAttribute("value", articleNO);
	  	 form.appendChild(articleNOInput);
		//아 위에서 만든 create를 만들어둔거를 닫아주는명령어인거같음
	 	 document.body.appendChild(form);
		//이것도 위에서 만듬 form문을 닫아주는 명령어
		 form.submit();
	 }
 </script>
<%@ include file="../footer.jsp"%>