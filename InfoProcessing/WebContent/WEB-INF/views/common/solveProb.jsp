<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			
			<!-- content -->
			<div class="container-fluid" style="padding: 20px;">
				<div class="header">
					<h4 style="display: inline;">${quizList.get(0).quizTitle}</h4>
					<span id="writer">${quizList.get(0).memId}</span>
				</div>
				<hr>
				<div class="prob-body">
					<!-- handlebars -->
					
					<c:forEach items="${quizList }" var="quiz">
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
						
							<c:if test="${quiz.quizTag.length() > 0 }">
								<c:forEach items="${quiz.quizTag.split(\",\") }" var="tag">
									<span style='margin:10px 10px 0 0;font-weight:bold;color:#6495ed;'>#${tag }</span>
								</c:forEach>
							</c:if>
							
						</div>
					</c:forEach>						
				</div>
				<button class="btn btn-primary" type="button" onclick="history.go(-1);">목록</button>
				<button class="btn btn-danger myBtn" type="button" onclick="remove_go();" style="float:right;display:none;">삭제</button>
				<button class="btn btn-primary myBtn" type="button" onclick="location.href='modify.do?studyNo=${param.studyNo }&quizGroup=${param.quizGroup}';" style="float:right;margin-right:10px;display:none;">수정</button>
			</div>
			<!-- /content -->
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
</script>
</body>
</html>
