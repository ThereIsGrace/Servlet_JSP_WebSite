<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='contextPath' value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Quill Editor</title>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet" />
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<style>
* {
	margin: 0 auto;
	padding: 0;
	list-style: none;
	/* font-family: "#"; */
}

.real-container {
	width: 1000px;
	margin: 0 auto;
	height: 400px;
}

.ql-container {
	width: 100%;
	height: 500px;
}

.ql-toolbar {
	width: 100%;
	height: 40px;
}

.nav-bar li:nth-child(1) {
	margin-left: 300px;
}

.nav-bar li {
	float: left;
	margin: 30px;
}

a {
	text-decoration: none;
}

.boxsing {
	margin-top: 30px;
	margin-left: 450px;
	width: 1000px;
	height: 600px;
	border: 1px solid black;
}


.boxsing .option .radios{
	float: left;
}
</style>
</head>
<body>
	<!-- Include stylesheet -->
	<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
		rel="stylesheet">
	<header style="float: left; width: 100%;">
		<div class="top">
			<div class="nav-bar">
				<ul>
					<li><a href="#">최신글</a></li>
					<li><a href="#">인기글</a></li>
					<li><a href="#">신고하기</a></li>
					<li><a href="#">괴수인증</a></li>
				</ul>
			</div>
		</div>
	</header>

	<div class="contents">
		<form name="community" action="a" method="post">
			<div class="notice">
				<div class="input-group" style="width: 1000px; margin-bottom: 30px;">
					<span class="input-group-text">제목</span>
					<textarea class="form-control" aria-label="With textarea"
						name="title" cols="60" rows="1"></textarea>
				</div>
				<div class="box"
					style="width: 200px; height: 500px; font-size: 10pt; background-color: #EAEAEA; padding: 10px; float: right; margin-right: 100px;">
					<span>근로자는 근로조건의 향상을 위하여 자주적인 단결권·단체교섭권 및 단체행동권을 가진다. 대한민국의
						영토는 한반도와 그 부속도서로 한다. 언론·출판은 타인의 명예나 권리 또는 공중도덕이나 사회윤리를 침해하여서는
						아니된다. 언론·출판이 타인의 명예나 권리를 침해한 때에는 피해자는 이에 대한 피해의 배상을 청구할 수 있다. 대통령의
						국법상 행위는 문서로써 하며, 이 문서에는 국무총리와 관계 국무위원이 부서한다. 군사에 관한 것도 또한 같다. 정당의
						목적이나 활동이 민주적 기본질서에 위배될 때에는 정부는 헌법재판소에 그 해산을 제소할 수 있고, 정당은 헌법재판소의
						심판에 의하여 해산된다.</span>
				</div>
			</div>

			<div class="real-container">
				<div id="editor">
					<p>자유롭게 입력해주세요</p>
					<p>
						글자 수는 <strong>3000자를</strong> 넘으실 수 없습니다.
					</p>
					<p>
						<br>
					</p>
				</div>
			</div>
		</form>
		
		<div class="set-info">
			<div class="s-title">추가정보</div>
			<div class="table-is">
				<table class="boxsing" style="align: center;">
					<tr>
						<th>질문유형</th>
						<td>
							<div class="option">
								<div class="text">일반질문</div>
								<div class="radios">
									<input type="radio" name="qustnCtgry" id="qustnCtgry_15"
										data-text="공부방법" value="15"> <label
										for="qustnCtgry_15" class=""> 공부방법 </label>
								</div>

								<div class="radios">
									<input type="radio" name="qustnCtgry" id="qustnCtgry_16"
										data-text="고민거리" value="16"> <label
										for="qustnCtgry_16" class=""> 고민거리 </label>
								</div>

								<div class="radios">
									<input type="radio" name="qustnCtgry" id="qustnCtgry_17"
										data-text="강의/교재" value="17"> <label
										for="qustnCtgry_17" class=""> 강의/교재 </label>
								</div>
							</div>
							<br>
							<div class="option">
								<div class="text">학습질문</div>

								<div class="radios">
									<input type="radio" name="qustnCtgry" id="qustnCtgry_1"
										data-text="국어" value="1"> <label for="qustnCtgry_1"
										class=""> 국어 </label>
								</div>

								<div class="radios">
									<input type="radio" name="qustnCtgry" id="qustnCtgry_2"
										data-text="영어" value="2"> <label for="qustnCtgry_2"
										class=""> 영어 </label>
								</div>

								<div class="radios">
									<input type="radio" name="qustnCtgry" id="qustnCtgry_13"
										data-text="한국사" value="13"> <label for="qustnCtgry_13"
										class=""> 한국사 </label>
								</div>

								<div class="radios">
									<input type="radio" name="qustnCtgry" id="qustnCtgry_4"
										data-text="컴퓨터일반" value="4"> <label for="qustnCtgry_4"
										class=""> 컴퓨터일반 </label>
								</div>


								<div class="radios">
									<input type="radio" name="qustnCtgry" id="qustnCtgry_5"
										data-text="기타과목" value="5"> <label for="qustnCtgry_5"
										class=""> 기타과목 </label>
								</div>

								<div class="radios">
									<input type="radio" name="qustnCtgry" id="qustnCtgry_20"
										data-text="자유질문" value="20"> <label
										for="qustnCtgry_20" class=""> 자유질문 </label>
								</div>

								<div class="radios">
									<input type="radio" name="qustnCtgry" id="qustnCtgry_21"
										data-text="공부일기 인증" value="21"> <label
										for="qustnCtgry_21" class=""> 공부일기 인증 </label>
								</div>

							</div> <span class="desc" id="spQustnCtgry"> </span>
						</td>
					</tr>
					<tr>
						<th>공지</th>
						<td>
							<div class="option">
								<div class="btn-group option-btn" data-toggle="buttons">
									<label id="rdUsePT_N" class="btn active"
										onclick="fnViewUsePT();"> <input type="radio"
										name="rdUsePT" value="N" checked> 공지사항
									</label> <label id="rdUsePT_Y" class="btn " onclick="fnViewUsePT();"
										data-target="#option-grede"> <input type="radio"
										name="rdUsePT" value="Y"> 일반글
									</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>공개설정</th>
						<td>
							<div class="checks">
								<input type="checkbox" name="openYN" id="openYN" value="N">
								<label for="openYN">익명으로 질문</label>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>



	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<script>
		var quill = new Quill('#editor', {
			theme : 'snow'
		});
	</script>
</body>
</html>