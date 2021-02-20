<%@page import="kr.or.ddit.quiz.vo.QuizVO"%>
<%@page import="java.util.List"%>
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
			
			<% List<QuizVO> quizList = (List<QuizVO>) request.getAttribute("quizList"); %>
			<!-- 내용 -->
			<div class="container-fluid" style="padding: 20px;">
				<div class="header">
					<h4 style="display: inline;"><%=quizList.get(0).getQuizTitle() %></h4>
					<span id="writer"><%=quizList.get(0).getMemId() %></span>
				</div>
				<hr>
				<div class="prob-body">
					<!-- handlebars -->
					<% for(QuizVO quiz : quizList){
						pageContext.setAttribute("quiz", quiz);
					%>
						<div class="row" style="margin-bottom:10px">
							<div class="col-sm-1" style="text-align: center;margin-top: 5px;">
								<h5 style="display:inline-block">${quiz.quizNo}번</h5>
							</div>
							<div class="col-sm-3">
								<input class="form-control" style="background-color: white;" readonly="readonly" value="${quiz.subParentName }">
							</div>
							<div class="col-sm-3">
								<input class="form-control" style="background-color: white;" readonly="readonly" value="${quiz.subName}">
							</div>
						</div>
						<textarea class="form-control" name="quizProb" style="width:100%; min-height:100px; margin-bottom:10px; background-color: white;" readonly="readonly">${quiz.quizProb }</textarea>
						<a href="javascript:void(0);" class="answer_${quiz.quizNo }" style="text-decoration: none;" onclick="openAnswer(this);">정답보기</a>
						<textarea class="form-control answer_${quiz.quizNo }" style="width:100%; min-height:100px; margin:10px 0; background-color: white; display: none;" readonly="readonly">${quiz.quizAnswer }</textarea>
						<div class="input-group" style="width:30%; margin-bottom:20px;">
						<% 
							String[] tagList = quiz.getQuizTag().split(",");
							for(String tag : tagList){
								pageContext.setAttribute("tag", tag);
						%>
							<span style='margin:10px 10px 0 0;font-weight:bold;color:#6495ed;'>#${tag }</span>
						<%
							}
						%>
						</div>
					<%
					}
					%>
				</div>
				<button class="btn btn-danger myBtn" type="button" onclick="remove_go();" style="float:right;display:none;">삭제</button>
				<button class="btn btn-primary myBtn" type="button" onclick="location.href='modify.do?quizGroup=${param.quizGroup}';" style="float:right;margin-right:10px;display:none;">수정</button>
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

<!-- Menu Toggle Script -->
<script>
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });
</script>

<script type="text/javascript">
var memId = '${sessionScope.loginUser.memId}';

if(memId==$('span#writer').text()){
	$('button.myBtn').css('display','block');
}

function openAnswer(obj){
	if($(obj).text()=="정답보기"){
		$('textarea.'+$(obj).attr("class")).css("display","block");
		$(obj).text("감추기");
	}else{
		$('textarea.'+$(obj).attr("class")).css("display","none");
		$(obj).text("정답보기");
	}
}

function remove_go(){
	var remove = confirm("삭제하시겠습니까?");
	if(remove){
		location.href='remove.do?quizGroup=${param.quizGroup}';
	}
}
</script>

</body>

</html>
