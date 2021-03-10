<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		</div>
		<!-- /#sidebar-wrapper -->
		
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>

			<!-- 내용 -->
			<div class="container-fluid" style="padding: 20px;">
				<div class="header">
					<h4 style="display: inline;">글등록</h4>
					<input type="button" class="btn btn-danger" onclick="history.back();" style="float: right;" value="취소">
					<input type="button" class="btn btn-primary" onclick="modify_go();" style="float: right;" value="등록">
				</div>
				<hr>
				<div class="content">
					<form action="modify.do" class="form" method="post" id="boardForm" onsubmit="setTag('#targetTag')">
						<input type="text" class="form-control" id="boardTitle" name="boardTitle" style="margin-bottom: 10px;" required="required" placeholder="제목을 입력해 주세요" value="${board.boardTitle }">
						<input type="hidden" name="memId" value="${loginUser.memId }">
						<input type="hidden" name="memName" value="${loginUser.memName }">
						<input type="hidden" name="boardNo" value="${board.boardNo }">
						<input type="hidden" name="boardTag" value="" id="targetTag">
						<select name="boardGroup" required="required" class="form-control" style="margin-bottom: 10px;">
							<option value="P00" ${board.boardGroup eq 'P00' ? 'selected' : '' }>잡담</option>
							<option value="P01" ${board.boardGroup eq 'P01' ? 'selected' : '' }>소프트웨어 설계</option>
							<option value="P02" ${board.boardGroup eq 'P02' ? 'selected' : '' }>소프트웨어 개발</option>
							<option value="P03" ${board.boardGroup eq 'P03' ? 'selected' : '' }>데이터베이스 구축</option>
							<option value="P04" ${board.boardGroup eq 'P04' ? 'selected' : '' }>프로그래밍 언어 활용</option>
							<option value="P05" ${board.boardGroup eq 'P05' ? 'selected' : '' }>정보시스템 구축 관리</option>
						</select>						<textarea id="content" class="textarea" rows="20" cols="" name="boardContent" class="form-control" placeholder="내용을 입력하세요">${board.boardContent }</textarea>
						<div class="input-group" style="margin-bottom:20px; margin-top: 10px;">
							<input class="form-control" type="text" id="boardTag" onKeypress="checkEnter('boardTag','div.tagList');" placeholder="태그를 추가하세요"/>
							<button class="btn btn-success" type="button" onclick="addTag('boardTag','div.tagList');">태그 추가</button>
						</div>						
						<div class="tagList">
						<c:if test="${board.boardTag.length() > 0 }">
							<c:forEach items="${board.boardTag.split(\",\") }" var="tag">
								<span style='cursor:pointer; margin:10px 10px 0 0;font-weight:bold;color:#6495ed;'>#${tag }</span>
							</c:forEach>
						</c:if>						
						</div>
						<input type="submit" style="display: none" id="subBtn">
					</form>
				</div>				
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
function modify_go(){
	$("#subBtn").trigger("click");
}
window.onload = function(){
	summernote_start($('#content'));
}
</script>
</body>
</html>