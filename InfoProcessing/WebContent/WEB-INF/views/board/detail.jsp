<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			
			<div class="container-fluid" style="padding: 20px;">
				<div class="header">
					<h4 style="display: inline;">${board.boardTitle }</h4>
					<div style="float: right;">
						<a href="javascript:location.href ='modify.do?boardNo=${board.boardNo }'" class="btn btn-success">수정</a>
						<a href="javascript:location.href ='remove.do?boardNo=${board.boardNo }'" class="btn btn-danger">삭제</a>
					</div>
				</div>
				<hr style="clear: both;">
				<div>
					<div style="float: right;">
						<span>작성자 : ${board.memId }</span>
						<span>조회수 : ${board.boardCnt }</span>
					</div>
					<div style="clear: both;">${board.boardContent} </div>
					<hr>
					<c:if test="${board.boardTag.length() > 0 }">
						<c:forEach items="${board.boardTag.split(\",\") }" var="tag">
							<span style='margin:10px 10px 0 0;font-weight:bold;color:#6495ed;'>#${tag }</span>
						</c:forEach>
					</c:if>					
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>