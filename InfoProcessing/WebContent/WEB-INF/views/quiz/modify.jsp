<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>정보처리기사 실기</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>

<!-- Bootstrap core CSS -->
<link href="<%= request.getContextPath() %>/res/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%= request.getContextPath() %>/res/template/css/simple-sidebar.css" rel="stylesheet">
<style type="text/css">
.fa-home:before {
    content: "\f015";
    font-size: x-large;
    color:black;
    text-shadow:1px 1px 2px #000000;
}
	input[type=radio], input[type=checkbox] {
	margin-right: 5px;
}
</style>


</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading">로그인<span  class="glyphicon glyphicon-log-in" style="cursor: pointer;"></span></div>
			<div class="sidebar-heading" style="display: none;">로그아웃<span  class="glyphicon glyphicon-log-in" style="cursor: pointer;"></span></div>
			<div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action bg-light">이용안내</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">+정보게시판</a>
				<div>
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link" href="#">1과목</a></li>
						<li class="nav-item"><a class="nav-link" href="#">2과목</a></li>
						<li class="nav-item"><a class="nav-link" href="#">3과목</a></li>
					</ul>
				</div>
				<a href="#" class="list-group-item list-group-item-action bg-light">+스터디그룹</a>
				<div>
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/quiz/list.do">1기</a></li>
						<li class="nav-item"><a class="nav-link" href="#">2기</a></li>
					</ul>
				</div>
				<a href="#" class="list-group-item list-group-item-action bg-light">익명게시판</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">마이페이지</a>
			</div>
			
		</div>
		<!-- /#sidebar-wrapper -->
		
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<nav class="navbar navbar-light bg-light border-bottom sticky-top">
				<button class="btn btn-secondary" id="menu-toggle">메뉴</button>
				
				<h4 style="text-align: center; margin: 0px; cursor: pointer;" onclick="location.href='/'">406호의 모험</h4>
				<div class="dropdown">
					<button class="dropdown-toggle btn" data-toggle="dropdown" aria-expanded="false">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Home</a>
						<a class="dropdown-item" href="#">달력</a>
						<a class="dropdown-item" href="#">etc</a>
					</div>
				</div>
				
			</nav>
			
			<!-- 내용 -->
			<div class="container-fluid" style="padding: 20px;">
				<div class="header">
					<h4 style="display: inline;">문제 수정</h4>
					<span style="float:right; margin-right:5%;">최대 문제 수 : 15<br>현재 문제 수 : <span class="quizCnt">${quizList.size() }</span></span>
					<div class="row" style="margin-top:20px;">
					  	<div class="col-sm-1" style="text-align: center;margin-top: 5px;font-size: 1.2em;">제목</div>
					  	<div class="col-sm-9">
							<input type="text" class="form-control" id="title" value="${quizList.get(0).quizTitle }">
					  	</div>
					</div>
					<div class="row" style="margin-top:20px;">
					  	<div class="col-sm-1" style="text-align: center;margin-top: 5px;font-size: 1.2em;">작성자</div>
					  	<div class="col-sm-2">
							<input type="text" class="form-control" style="background-color: white;" id="writer" readonly="readonly" value="${quizList.get(0).memId }">
					  	</div>
					</div>
				</div>
				<hr>
				<div class="prob-body">
					<!-- handlebars -->
				</div>
				<button class="btn btn-primary" type="button" onclick="addQuiz();">문제 추가하기</button>
				<button class="btn btn-danger removeBtn" type="button" style="display:none;" onclick="removeQuiz();">문제 삭제</button>
				<button class="btn btn-danger" type="button" onclick="history.go(-1);" style="float:right;">취소</button>
				<button class="btn btn-primary" type="button" onclick="insertQuiz();" style="float:right;margin-right:10px;">수정</button>
				<button class="btn btn-primary" type="button" onclick="javascript:alert('저장버튼클릭');" style="float:right;margin-right:10px;">저장</button>
			</div>
			
		</div>
		<!-- /#page-content-wrapper -->
	</div>
<!-- /#wrapper -->


<!-- jQeury 3.5.1 -->
<script src="<%= request.getContextPath() %>/res/template/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap 4.5.3 -->
<script src="<%= request.getContextPath() %>/res/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js" ></script>

<script  type="text/x-handlebars-template"  id="quiz-template">
<div id="quiz_{{quizNo}}">
	<div class="row" style="margin-bottom:10px">
		<div class="col-sm-1" style="text-align: center;margin-top: 5px;">
			<h5 style="display:inline-block">{{quizNo}}번</h5>
		</div>
		<div class="col-sm-3">
			<select class="form-control" id="subject_{{quizNo}}" name="parentCode" onChange="subjectChange(this);">
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
	<textarea class="form-control" name="quizProb" style="width:100%; min-height:100px; margin-bottom:10px;" placeholder="문제 내용을 입력하세요."></textarea>
	<textarea class="form-control" name="quizAnswer" style="width:100%; min-height:100px; margin-bottom:10px;" placeholder="정답을 입력하세요."></textarea>
	<div class="row" style="margin-bottom:10px;">
		<div class="col-sm-12 tagList_{{quizNo}}">
		</div>
	</div>
	<div class="input-group" style="width:30%; margin-bottom:20px;">
		<input class="form-control" type="text" id="tag_{{quizNo}}" name="tag" onKeypress="checkEnter('{{quizNo}}');" placeholder="태그를 추가하세요"/>
		<button class="btn btn-primary" type="button" onclick="addTag('{{quizNo}}');">태그 추가</button>
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

<!-- Menu Toggle Script -->
<script>
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });
</script>

<script type="text/javascript">

var quiz = {quizNo: 1};
function addQuiz(){
	if(quiz.quizNo > 15){
		alert("문제는 최대 15개까지만 등록할 수 있습니다.");
		return;
	}
	printData(quiz, $('.prob-body'), $('#quiz-template'));
	$('span.quizCnt').text(quiz.quizNo);
	
	$('button.removeBtn').css("display","inline-block");
	
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

function printData(data, target, templateObject, removeClass){
	
	var template = Handlebars.compile(templateObject.html());
	
	var html = template(data);
	
	if(removeClass){
		$(removeClass).remove();
	}
	target.append(html);
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
		var tagList = $('span[name="tag_'+(i+1)+'"]');
		
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
		var quizTag = "";
		if(tagList.length > 0){
			for(var j=0; j<tagList.length; j++){
				quizTag += tagList.eq(j).text().substr(1);
				if(j < tagList.length-1){
					quizTag += ",";
				}
			}
		}
		quizObj = {quizNo:i+1
					,quizTitle:quizTitle.val()
					,quizProb:quizProb.val()
					,quizAnswer:quizAnswer.val()
					,subNo:pSubCode.val()+subCode.val()
					,memId:'lalaru'
					,quizTag:quizTag
					}
		quizList.push(quizObj);
	}
	
	$.ajax({
		url:'<%= request.getContextPath() %>/quiz/insert.do',
		type:'post',
		traditional:true,
		data:{quizList:JSON.stringify(quizList)},
		success:function(data){
			alert('문제가 등록되었습니다.');
			location.href="<%= request.getContextPath() %>/quiz/list.do";
		},
		error:function(xhr){
			alert('서버 에러 발생');
		}
	});
}

function subjectChange(obj){
	var tagId = $(obj).attr("id");
	$.get('<%=request.getContextPath()%>/subject/list.do',{subParentCode:obj.value},function(subList){
		if(subList.length > 0){
			$('.'+tagId).css("display","block");
			printData(subList,$('.'+tagId),$('#subject-template'),'.'+tagId+' select');
		}else{
			$('.'+tagId).css("display","none");
			$('.'+tagId+' select').remove();
		}
	});
}

function addTag(id){
	var input = $('input#tag_'+id);
	if(input.val().trim() != ""){
		var keywordTag = "<span name='tag_"+id+"' style='margin-right:10px;font-weight:bold;color:#6495ed;'>#"+input.val().replaceAll(" ", "")+"</span>";
		$('.tagList_'+id).append(keywordTag);
		input.val("");
	}
}

function checkEnter(id){
	if(event.keyCode == 13){
		addTag(id);
	}
}
	
</script>

</body>

</html>
