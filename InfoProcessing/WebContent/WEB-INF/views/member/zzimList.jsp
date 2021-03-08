<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
	.btn-green{
		color: #fff;
		background-color: #28a745;
		border-color: #28a745;
	}

	.btn-green.active{
		color: #fff;
		background-color: #19642a;
		border-color: #19642a;
	}

</style>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			
			<!-- content -->
			<div class="container-fluid">
				<div class="header" style="margin-top: 30px;">
					<h3 style="display: inline;">찜목록 - <span id="showType">게시글</span></h3>
					<div style="float: right;">
						<input class="btn btn-green active" type="button" value="게시글" onclick="changeShow(this)">
						<input class="btn btn-green" type="button" value="퀴즈" onclick="changeShow(this)">
					</div>
				</div>
				<hr style="clear: both;">
				
				<div class="list">
					<div class="boardList" style="display: ">
						<c:if test="${not empty boardList }">
							<ul style="padding: 0; margin-top: 10px;">
								<c:forEach items="${boardList }" var="board">
									<li class="list-group-item quizItem list-group-item-action" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/board/detail.do?boardGroup=${board.boardGroup }&boardNo=${board.boardNo }'">
										<span style="font-weight: bold;">${board.boardTitle }</span>
										<div style="display: block; font-size: x-small;">
											<span>${board.memId } </span>
											<span>${board.boardDate }</span>
											<span>조회 ${board.boardCnt }</span>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:if>
						<c:if test="${empty boardList }">
							<p align="center">텅...</p>
						</c:if>	
					</div>


					<div class="quizList" style="display: none">
						<c:if test="${not empty quizList }">
							<ul style="padding: 0; margin-top: 10px;">
								<c:forEach items="${quizList }" var="quiz">
									<li class="list-group-item quizItem list-group-item-action" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/quiz/select.do?quizId=${quiz.quizId }'">
										<span style="font-weight: bold;">${quiz.quizTitle } ${quiz.quizNo}번 문제</span>
										<div style="display: block; font-size: x-small;">
											<span>${quiz.memName } </span>
											<span>${quiz.quizRegdate }</span>
											<span>조회 ${quiz.quizViewcnt }</span>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:if>		
						<c:if test="${empty quizList }">
							<p align="center">텅...</p>
						</c:if>		
					</div>
				</div>
			</div>
			<!-- /content -->
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
function changeShow(obj){
	if($(obj).hasClass("active")) return;
	$(obj).addClass("active");
	$(obj).siblings("input").removeClass("active")
	$("#showType").text(obj.value);
	if(obj.value=="게시글"){
		$("div[class='quizList']").hide();
		$("div[class='boardList']").show();
	}else{
		$("div[class='boardList']").hide();
		$("div[class='quizList']").show();
	}
}
</script>
</body>
</html>
