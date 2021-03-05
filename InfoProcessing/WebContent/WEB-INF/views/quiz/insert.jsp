<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
@media(max-width:400px) {
	div.uitlBtn{
		margin-top: 20px;
	}
	div.uitlBtn button#insertBtn{
		float: left !important;
	}
}
</style>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			
			<!-- content -->
			<div class="container-fluid" style="padding: 20px;">
				<div class="header">
					<h4 style="display: inline;">문제 등록</h4>
					<span style="float:right; margin-right:5%;">최대 문제 수 : 20<br>현재 문제 수 : <span class="quizCnt">0</span></span>
					<div style="margin-top:20px;">
				  		<label for="title" style="margin-top: 5px;"><strong>제목:</strong></label>
						<input type="text" class="form-control" id="title" value="${title }회 모의고사" readonly="readonly">
					</div>
					<div style="margin-top:20px;">
					  	<label for="writer" style="margin-top: 5px;"><strong>작성자:</strong></label>
						<input type="text" class="form-control" id="writer" readonly="readonly" value="${sessionScope.loginUser.memName }">
					</div>
				</div>
				<hr>
				<div class="prob-body">
					<!-- handlebars -->
				</div>
				<div class="row">
					<div class="col-sm-6">
						<button class="btn btn-primary" type="button" onclick="addQuiz();">문제 추가하기</button>
						<button class="btn btn-danger removeBtn" type="button" style="display:none;" onclick="removeQuiz();">문제 삭제</button>
					</div>
					<div class="col-sm-6 uitlBtn">
						<button class="btn btn-danger" type="button" onclick="history.go(-1);" style="float: right;">취소</button>
						<button class="btn btn-primary" type="button" id="insertBtn" onclick="insertQuiz();" style="float: right; margin-right:10px;">등록</button>
					</div>
				</div>
			</div>
			<!-- /content -->
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js" ></script>

<script  type="text/x-handlebars-template"  id="quiz-template">
<div id="quiz_{{quizNo}}">
	<div class="row" style="margin-bottom:10px">
		<div class="col-sm-1" style="text-align: center;margin-top: 5px;">
			<h5 style="display:inline-block">{{quizNo}}번</h5>
		</div>
		<div class="col-sm-3">
			<select class="form-control" style="margin-bottom:5px" id="subject_{{quizNo}}" name="parentCode" onChange="subjectChange(this,'${param.studyNo}');">
				<option value="default">--과목 선택--</option>
				<option value="P01">[1과목] 소프트웨어 설계</option>
				<option value="P02">[2과목] 소프트웨어 개발</option>
				<option value="P03">[3과목] 데이터베이스 구축</option>
				<option value="P04">[4과목] 프로그래밍 언어 활용</option>
				<option value="P05">[5과목] 정보시스템 구축 관리</option>
			</select>
		</div>
		<div class="col-sm-3 subject_{{quizNo}}" style="display:none;">
		</div>
	</div>
	<textarea class="quizProb" name="quizProb" style="margin-bottom:20px;"></textarea>
	<textarea class="quizAnswer" name="quizAnswer"></textarea>
	<div class="row" style="margin-bottom:10px;">
		<div class="col-sm-12 tagList_{{quizNo}}" style="margin-top:10px;">
		</div>
	</div>
	<div class="input-group" style="margin-bottom:20px;">
		<input class="form-control" type="text" id="tag_{{quizNo}}" name="tag" onKeypress="checkEnter('tag_{{quizNo}}','div.tagList_{{quizNo}}');" placeholder="태그를 추가하세요"/>
		<button class="btn btn-primary" type="button" onclick="addTag('tag_{{quizNo}}','div.tagList_{{quizNo}}');">태그 추가</button>
	</div>
</div>
</script>

<script  type="text/x-handlebars-template"  id="subject-template">
<select class="form-control" name="subCode">
	{{#each .}}
	<option value="{{subCode}}">{{subName}}</option>
	{{/each}}
</select>
</script>

<script>
var quiz = {quizNo: 1};
function addQuiz(){
	if(quiz.quizNo > 20){
		alert("문제는 최대 20개까지만 등록할 수 있습니다.");
		return;
	}
	printData(quiz, $('.prob-body'), $('#quiz-template'));
	$('span.quizCnt').text(quiz.quizNo);
	
	$('button.removeBtn').css("display","inline-block");
	
	$('textarea.quizProb').eq(quiz.quizNo-1).summernote({
		height:100,
		placeholder:'문제를 입력하세요.',
		toolbar: []
	});
	
	$('textarea.quizAnswer').eq(quiz.quizNo-1).summernote({
		height:100,
		placeholder:'정답을 입력하세요.',
		toolbar: []
	});
	
	quiz.quizNo += 1;
}

function removeQuiz(){
	quiz.quizNo -= 1;
	$('div#quiz_'+quiz.quizNo).remove();
	
	$('span.quizCnt').text(quiz.quizNo-1);
	
	if(quiz.quizNo==1){
		$('button.removeBtn').css("display","none");
	}
}

function insertQuiz(){
	var quizTitle = $('#title');
	if(quizTitle.val().trim() == ""){
		alert("제목을 입력하세요.");
		quizTitle.focus();
		return;
	}
	if($('span.quizCnt').text() == "0"){
		alert("문제를 하나 이상 등록하세요.");
		addQuiz();
		return;
	}
	var quizList = new Array();
	for(var i=0; i<quiz.quizNo-1; i++){
		var quizProb = $('textarea[name="quizProb"]').eq(i);
		var quizAnswer = $('textarea[name="quizAnswer"]').eq(i);
		var pSubCode = $('#subject_'+(i+1));
		var subCode = $('select[name="subCode"]').eq(i);
		var quizTag = getTagToString('tag_'+(i+1));
		
		if(quizProb.val().trim() == ""){
			alert("문제의 내용을 입력하세요.");
			quizProb.focus();
			return;
		}
		if(quizAnswer.val().trim() == ""){
			alert("문제의 답을 입력하세요.");
			quizAnswer.focus();
			return;
		}
		if(!pSubCode.val() || pSubCode.val()=="default"){
			alert('과목을 선택하세요.');
			pSubCode.focus();
			return;
		}
		quizObj = {quizNo:i+1
					,quizTitle:quizTitle.val()
					,quizProb:quizProb.val()
					,quizAnswer:quizAnswer.val()
					,subNo:pSubCode.val()+subCode.val()
					,memId:'${loginUser.memId}'
					,quizTag:quizTag
					}
		quizList.push(quizObj);
	}
	
	$.ajax({
		url:'<%= request.getContextPath() %>/quiz/insert.do?studyNo=${param.studyNo}',
		type:'post',
		traditional:true,
		data:{quizList:JSON.stringify(quizList)},
		success:function(data){
			alert('문제가 등록되었습니다.');
			location.href="<%= request.getContextPath() %>/quiz/list.do?studyNo=${param.studyNo}";
		},
		error:function(xhr){
			alert('서버 에러 발생');
		}
	});
}

</script>
</body>
</html>
