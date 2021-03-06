<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<nav class="navbar navbar-light bg-light border-bottom sticky-top">
	<button class="btn btn-secondary" id="menu-toggle">메뉴</button>
	<h4 style="text-align: center; margin: 0px; cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/main.do';">406호의 모험</h4>
	<div class="dropdown">
<!-- 		<button class="dropdown-toggle btn" data-toggle="dropdown" aria-expanded="false">
			<span class="navbar-toggler-icon"></span>
		</button> -->
<!-- 		<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
			<a class="dropdown-item" href="#">Home</a>
			<a class="dropdown-item" href="#">달력</a>
			<a class="dropdown-item" href="#">etc</a>
		</div> -->
		<button class="btn btn-primary form-control" type="button" style="float: right;" onclick="javascript:location.href='<%=request.getContextPath()%>/common/searchForm.do'"><i class="fa fa-fw fa-search"></i></button>
	</div>
</nav>
<i class="fa fa-arrow-left" onclick="history.go(-1)"></i>