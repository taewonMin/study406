<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			
			<!-- 내용 -->
			<div class="container-fluid" style="padding: 20px;">
				<div class="header">
					<h4 style="display: inline;">글등록</h4>
					<input type="button" class="btn btn-danger" onclick="history.back();" style="float: right;" value="취소">
					<input type="button" class="btn btn-primary" onclick="insert_go();" style="float: right;" value="등록">
				</div>
				<hr>
				<div class="content">
					<form action="insert.do" class="form" method="post" id="boardForm">
						<input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력해 주세요">
						<input type="hidden" name="memId" value="lalaru">
						<input type="hidden" name="boardGroup" value="${param.boardGroup}">
						<textarea rows="20" cols="" name="boardContent" class="form-control" placeholder="내용을 입력하세요"></textarea>
					</form>
					<input type="button" class="btn btn-danger" onclick="history.back();" style="float: right;" value="취소">
					<input type="button" class="btn btn-primary" onclick="insert_go();" style="float: right;" value="등록">
				</div>				
			</div>
			<!-- /내용 -->
			
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
function insert_go(){
	var form = $('#boardForm');
	form.submit();
}
</script>

</body>
</html>