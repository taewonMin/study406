<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<form action="modify.do" class="form" method="post" id="boardForm">
						<input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력해 주세요" value="${board.boardTitle }">
						<input type="hidden" name="memId" value="lalaru">
						<input type="hidden" name="boardNo" value="${board.boardNo }">
						<input type="hidden" name="boardGroup" value="${param.boardGroup}">
						<textarea rows="20" cols="" name="boardContent" class="form-control" placeholder="내용을 입력하세요">${board.boardContent }</textarea>
					</form>
					<input type="button" class="btn btn-danger" onclick="history.back();" style="float: right;" value="취소">
					<input type="button" class="btn btn-primary" onclick="modify_go();" style="float: right;" value="등록">
				</div>				
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
function modify_go(){
	var form = $('#boardForm');
	form.submit();
}
</script>
</body>
</html>