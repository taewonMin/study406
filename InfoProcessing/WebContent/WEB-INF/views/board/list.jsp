<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
	li.quizItem:hover{
		cursor: pointer;
	    background-color: #f0f8ff;
	}
</style>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			
			<!-- 내용 -->
			<div class="container-fluid" style="padding: 20px;">
				<div class="header">
					<h4 style="display: inline;">정보 게시판 - ${subjectName }</h4>
					<button class="btn btn-warning" style="float: right;" onclick="location.href = 'insert.do?boardGroup=${param.boardGroup}'">글등록</button>
				</div>
				<hr>
				<div>
					<ul class="list-group" style="clear:both;" id="boardList">
					<c:forEach var="board" items="${boardList }">
						<li class="list-group-item quizItem" onclick="location.href='detail.do?boardNo=${board.boardNo}';">
							<span style="font-weight: bold;">${board.boardTitle}</span>
							<div style="display: block; font-size: x-small;">
								<span>${board.memId}</span>
								<span><fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></span>
								<span>조회수${board.boardCnt}</span>
								<!-- <span style="float: right">...</span> -->
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>


</script>
</body>
</html>
