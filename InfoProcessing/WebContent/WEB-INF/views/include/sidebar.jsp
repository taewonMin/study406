<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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