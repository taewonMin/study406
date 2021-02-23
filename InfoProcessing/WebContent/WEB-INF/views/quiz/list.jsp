<%@page import="kr.or.ddit.quiz.vo.QuizVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			
			<!-- content -->
			<div class="container-fluid">
			
				<div class="container-fluid" style="padding: 20px;">
					<div class="header">
						<h4 style="display: inline;">스터디룸 - 1기</h4>
						<button class="btn btn-primary" type="button" onclick="location.href='<%= request.getContextPath()%>/quiz/insert.do';" style="float: right;">문제등록</button>
					</div>
					
					<hr>
					<br>
					 
					<div>
						<ul class="list-group" style="clear:both;">
						<%
							List<QuizVO> quizList = (List<QuizVO>)request.getAttribute("quizList");
							for(QuizVO quiz : quizList){
								pageContext.setAttribute("quiz", quiz);
						%>
							<li class="list-group-item quizItem" onclick="location.href='<%=request.getContextPath()%>/quiz/detail.do?quizGroup=${quiz.quizGroup}';">
								<span style="font-weight: bold;">${quiz.quizTitle}</span>
								<div style="display: block; font-size: x-small;">
									<span>${quiz.memId}</span>
									<span>${quiz.quizRegdate}</span>
									<span>조회 ${quiz.quizViewcnt}</span>
									<span style="float: right">...</span>
								</div>
							</li>
						<%		
							}
						%>
						</ul>
					</div>
				</div>
			
			</div>
			<!-- /content -->
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
</script>
</body>
</html>
