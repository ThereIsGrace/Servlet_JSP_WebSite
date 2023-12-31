<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sleidall" value="${allid}" />
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
</head>

<meta charset="UTF-8">
<style>
</style>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() { //주소록 API
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
	function isSame() { //비밀번호 재확인
		var pw = document.getElementById('pw').value;
	    if (pw.length< 7) {
	    	document.getElementById('pid').innerHTML='8자리 이상 입력해 주세요.';
	        document.getElementById('pid').style.color='red';
	    }else{
	    	document.getElementById('pid').innerHTML='올바른 비밀번호입니다';
	        document.getElementById('pid').style.color='blue';
	    	if(document.getElementById('pw').value!=''&&document.getElementById('pwCheck').value !='') {
		    	if( document.getElementById('pw').value == document.getElementById('pwCheck').value ) {
		    		document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
		            document.getElementById('same').style.color='blue';
		            document.getElementById('pwun').value = true;
		        }
		        else {
		            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
		            document.getElementById('same').style.color='red';
		            document.getElementById('pwun').value = false;
		        }
		    }
	    }
	}
</script>
<script>
function idsle(){ //아이디 중복 확인
    var result = document.getElementById("inputid").value; // result 변수에 아이디 필드 값을 가져옴
    if(result.length> 7 ){
  	console.log(result); // 콘솔에 아이디 띄워서 값이 들어오는지 확인
    var serverid = "${idall}"; // 서버에 저장되어 있는 아이디 값들
   console.log(serverid);
        // 중복 체크
        var idArray = serverid.split(","); // idall 문자열을 쉼표(,)를 기준으로 분리하여 배열로 저장
        for(var j = 0; j < idArray.length; j++) {
        	idArray[j] = idArray[j].trim();
        	console.log(idArray[j]); 	
        	
            if(result === idArray[j]) {
                document.getElementById('sleid').innerHTML = '중복된 아이디가 존재합니다.';
                document.getElementById('sleid').style.color = 'red';
                document.getElementById('idun').value = false;
                break; // 중복이 확인되었으므로 반복문을 종료합니다.
            }else{
                document.getElementById('sleid').innerHTML = '사용 가능한 아이디입니다.';
                document.getElementById('sleid').style.color = 'blue';
                document.getElementById('idun').value = true;
            }
        }
    }else{
    	
    	document.getElementById('sleid').innerHTML = '8자리 이상 입력해주세요';
    	document.getElementById('sleid').style.color = 'red';
    }
}

</script>
<script>
	function unable() {
		if(document.getElementById('idun').value&&document.getElementById('pwun').value){
			document.getElementById('join').disabled = false;
		}else{
			document.getElementById('join').disabled = true;
		}
	}
</script>
<title>회원 가입창</title>
<body>
	<div style="height: 90px;"></div>
		<main style='background-color: #e9ecef; height: 850px;'>
	<form method="post" action="${contextPath}/UsersHandler.do">
	<div style="height: 20px;"></div>
		<h1 style="text-align: center">회원 가입</h1>
		<table class="shadow p-3 mb-5 bg-body-tertiary rounded" align="center" style= 'background-color:#f8f9fa; color: green; width: 450px; border-radius: 8px;'>
			<tr>
				<td width="200" ><p align="right" style="margin-top: 15px;">가입유형</td>
				<td width="400"><input type="radio" name="men" value="tutor"><label>멘토</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="men" value="mentee"><label>멘티</label></td>
			</tr>
			<tr>
				<td width="200"><p align="right" style="margin-top: 15px;">아이디</td>
				<td width="400"><input type="text" name="id" id="inputid"
					placeholder="8자 이상 입력" onchange="idsle(),unable()" class = "wrapper-box" > 
					<span id="sleid"></span>
					<span value = '123' id = "idun"></span>
			</tr>

			<tr>
				<td width="200"><p align="right" style="margin-top: 15px;">비밀번호</td>
				<td><input type="password" name="pw"
					placeholder="8자 이상 입력" id="pw" onchange="isSame()" /> <span
					id="pid"></span></td>
			</tr>

			<tr>
				<td width="200"><p align="right" style="margin-top: 15px;">비밀번호 확인</td>
				<td><input type="password" name="pw_chek"
					placeholder="8자 이상 입력" id="pwCheck" onchange="isSame(),unable()" />&nbsp;&nbsp;
					<span id="same"></span>
					<span value='123' id = "pwun"></span>	
					</td>
			</tr>

			<tr>
				<td width="200"><p align="right" style="margin-top: 1px;">이름</td>
				<td width="400"><p>
						<input type="text" name="name" placeholder="성명"></td>
			</tr>
			<tr>
				<td width="200"><p align="right" style="margin-top: 1px;">성별</td>
				<td width="400"><p>
						<input type="radio" name="gender" value="남자"><label>남자</label>
						<input type="radio" name="gender" value="여자"><label>여자</label></td>
			</tr>
			<tr>
				<td width="200"><p align="right" style="margin-top: 1px;">생년월일</td>
				<td width="400"><p>
						<input type="date" name="age" placeholder="000218"></td>
			</tr>
			<tr>
				<td width="200"><p align="right" style="margin-top: 1px;">전화번호</td>
				<td width="400"><p>
						<input type="text" name="phone" placeholder="010-1234-5678"></td>
			</tr>
			<tr>
				<td width="200"><p align="right" style="margin-top: 1px;">대학교</td>
				<td width="400"><p>
						<input type="text" name="uni" placeholder="OO대"></td>
			</tr>
			<tr>
				<td width="200"><p align="right" style="margin-top: 15px;">주소</td>
				<td width="400"><p>
						<input type="text" id="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()"
							value="우편번호 찾기"><br> <input type="text" name="ad"
							id="sample6_address" placeholder="주소"><br> <input
							type="text" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목"></td>
			</tr>
			<tr>
				<td width="200"><p align="right" style="margin-top: 1px;">과목</td>
				<td width="400"><p>
						<input type="radio" name="subject" value="국어"><label>국어</label>
						<input type="radio" name="subject" value="영어"><label>영어</label>
						<input type="radio" name="subject" value="수학"><label>수학</label></td>
			</tr>
			<tr>
				<td width="200"><p>&nbsp;</p></td>
				<td width="400"><input type="submit" id= "join" value="가입하기" disabled> 
				<input type="reset" value="다시입력"></td>
			</tr>
		</table>
	</form>
	</main>
</body>
<%@ include file="../footer.jsp"%>
</html>