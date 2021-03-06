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
					<form action="insert.do" class="form" method="post" id="boardForm" onsubmit="setTag('#targetTag')">
						<input type="text" class="form-control" id="boardTitle" name="boardTitle" required="required" placeholder="제목을 입력해 주세요" style="margin-bottom: 10px;">
						<input type="hidden" name="memId" value="${loginUser.memId }">
						<select name="boardGroup" required="required" class="form-control" style="margin-bottom: 10px;">
							<option disabled="disabled" selected="selected">말머리</option>
							<option value="P01">소프트웨어 설계</option>
							<option value="P02">소프트웨어 개발</option>
							<option value="P03">데이터베이스 구축</option>
							<option value="P04">프로그래밍 언어 활용</option>
							<option value="P05">정보시스템 구축 관리</option>
						</select>
						<input type="hidden" name="boardTag" value="" id="targetTag">
						<textarea id="content" class="textarea" rows="20" cols="" name="boardContent" class="form-control" placeholder="내용을 입력하세요"></textarea>
						<div class="input-group" style="margin-bottom:20px; margin-top: 10px;">
							<input class="form-control" type="text" id="boardTag" onKeypress="checkEnter('boardTag','div.tagList');" placeholder="태그를 추가하세요"/>
							<button class="btn btn-success" type="button" onclick="addTag('boardTag','div.tagList');">태그 추가</button>
						</div>						
						<div class="tagList"></div>
					</form>
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
window.onload = function(){
	summernote_start($('#content'));
}

</script>

</body>
</html>