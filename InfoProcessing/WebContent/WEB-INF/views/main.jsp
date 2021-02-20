<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<ul class="nav flex-column" id="info_board"> </ul>
				</div>
				<a href="#" class="list-group-item list-group-item-action bg-light">+스터디그룹</a>
				<div>
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link" href="<%= request.getContextPath() %>/quiz/list.do">1기</a></li>
						<li class="nav-item"><a class="nav-link" href="#">2기</a></li>
					</ul>
				</div>
				<a href="#" class="list-group-item list-group-item-action bg-light">익명게시판</a>
				<a href="myPage.html" class="list-group-item list-group-item-action bg-light">마이페이지</a>
			</div>
			
		</div>
		<!-- /#sidebar-wrapper -->
		
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<nav class="navbar navbar-light bg-light border-bottom sticky-top">
				<button class="btn btn-secondary" id="menu-toggle">메뉴</button>
				
				
				<h4 style="text-align: center; margin: 0px; cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/main.do';">406호의 모험</h4>

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
			
			<div class="container-fluid">
				<h1 class="mt-4" align="center">정보처리기사 실기</h1>
				
				<form action="" class="form-group">
					<table class="table table-bordered">
						<tr><th colspan="2" style="text-align: center; background-color: powderblue;">문제 형식</th></tr>		
								
						
						<tr class="">
							<td><input class="" type="radio" name="quizNum" id="oneNum"><label for="oneNum">한문제씩 풀기</label></td>
							<td><input class="" type="radio" name="quizNum" id="multiNum"><label for="multiNum">한꺼번에 풀기</label></td>
						</tr>
		
						<tr class="">
							<td><input class="" type="radio" name="quizAnswer" id="noAns"><label for="noAns" >다 풀고 정답보기</label></td>
							<td><input class="" type="radio" name="quizAnswer" id="yesAns"><label for="yesAns">정답 보면서 풀기</label></td>
						</tr>
					</table>
					
					<table class="table table-bordered">
						<tr><th colspan="5" style="text-align: center; background-color: powderblue;">문제 종류</th></tr>		
								
						<tr class="">
							<td colspan="5">
								<input type="radio" name="quizType" class="" id="prevType" checked="checked"><label style="width: 50%" for="prevType">기출문제</label>
								<input type="radio" name="quizType" class="" id="exeType"><label for="exeType">연습문제</label>
							</td>
						</tr>

						<tr class="" align="center">
							<td><input type="checkbox" name="quizSub" class="" id="sub1" checked="checked"><label for="sub1">1과목</label></td>
							<td><input type="checkbox" name="quizSub" class="" id="sub2" checked="checked"><label for="sub2">2과목</label></td>
							<td><input type="checkbox" name="quizSub" class="" id="sub3" checked="checked"><label for="sub3">3과목</label></td>
							<td><input type="checkbox" name="quizSub" class="" id="sub4" checked="checked"><label for="sub4">4과목</label></td>
							<td><input type="checkbox" name="quizSub" class="" id="sub5" checked="checked"><label for="sub5">5과목</label></td>
						</tr>
						
						<tr class="">
							<td colspan="2" align="center">회차 선택</td>
							<td colspan="3">
								<select class="input-group">
									<option>2020년 실기 1회</option>
									<option>2020년 실기 2회</option>
									<option>2020년 실기 3회</option>
								</select>
							</td>
						</tr>
					</table>
					<div style="text-align: right;">
						<button type="button" class="btn btn-primary">문제 풀기</button>					
					</div>
									
				</form>
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
<script src="<%= request.getContextPath() %>/res/js/main.js"></script>
<script>
$("#menu-toggle").click(function(e) {
	e.preventDefault();
	$("#wrapper").toggleClass("toggled");
});
</script>

</body>

</html>
