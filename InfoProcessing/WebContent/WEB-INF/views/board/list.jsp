<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
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
li.quizItem:hover {
	cursor: pointer;
	background-color: #f0f8ff;
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
					<ul class="nav flex-column" id="info_board"></ul>
				</div>
				<a href="#" class="list-group-item list-group-item-action bg-light">+스터디그룹</a>
				<div>
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/quiz/list.do">1기</a></li>
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
			
			<!-- 내용 -->
			<div class="container-fluid" style="padding: 20px;">
				<div class="header">
					<h4 style="display: inline;">정보 게시판</h4>
					<div id="serachBar" style="float: right;">
						<form action="list.do" role="form" class="form-inline">
							<input type="hidden" name="boardGroup" value="P01">
							<div id="keyword" class="card-tools" style="">
								<select class="form-control" name="searchType" id="searchType">
									<option value="tcw" >전 체</option>
									<option value="t">제 목</option>
									<option value="w" >작성자</option>
									<option value="c">내 용</option>
									<option value="tc">제목+내용</option>
									<option value="tag">태그</option>
								</select>					
								<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value=""/>
								<button class="btn btn-primary form-control" type="submit"><i class="fa fa-fw fa-search"></i></button>
							</div>	
						</form>					
					</div>
				</div>
				<hr>
				<div>
					<ul class="list-group" style="clear:both;" id="boardList">
						<%List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList");
							for(BoardVO board : boardList){
								pageContext.setAttribute("board", board);
						%>
						
						
					
						<%}%>
					</ul>
				</div>
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
<!-- main.js -->
<script src="<%= request.getContextPath() %>/res/js/main.js"></script>

</body>

</html>