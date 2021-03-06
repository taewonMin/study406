<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="bg-light border-right" id="sidebar-wrapper">
	<div class="sidebar-heading" onclick="location.href='<%=request.getContextPath()%>/common/logout.do';" style="cursor: pointer;">로그아웃<span  class="glyphicon glyphicon-log-in" ></span></div>
	<div class="list-group list-group-flush">
		<a href="<%=request.getContextPath()%>/common/index.do" class="list-group-item list-group-item-action bg-light">이용안내</a>
		<a href="<%=request.getContextPath() %>/board/list.do" class="list-group-item list-group-item-action bg-light">정보게시판</a>
		<div>
			<ul class="nav flex-column" id="info_board"> </ul>
		</div>
		<a href="javascript:location.href='<%=request.getContextPath() %>/member/zzimList.do?memId=${sessionScope.loginUser.memId }'" class="list-group-item list-group-item-action bg-light">찜목록</a>
		<a href="javascript:$('#toggleTarget').slideToggle()" class="list-group-item list-group-item-action bg-light">스터디그룹</a>
		<ul class="nav flex-column" id="toggleTarget" style="display: none;">
			<li class="list-group-item-action bg-light" style=""><a class="nav-link" href="<%= request.getContextPath() %>/quiz/list.do?studyNo=1">1기</a></li>
		</ul>
		<h5 style="margin:15px;">${loginUser.memId }</h5>
	</div>
</div>