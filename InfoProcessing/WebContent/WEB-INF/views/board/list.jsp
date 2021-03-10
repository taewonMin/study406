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
	select[name=boardGroup]{
		border: 1px solid #ced4da;
		border-radius: .25rem;
		color: #495057;
		transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		margin-bottom: 10px;
		float: right;
     }
	@media(max-width:400px) {
		#addBtn{
		    padding: .25rem .5rem;
		    font-size: .875rem;
		    line-height: 1.5;
		    border-radius: .2rem;
		}
		#headTitle{
			font-size: 1.25rem;
		}
		select[name=boardGroup]{
			width : 80px;
		}
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
					<h4 id="headTitle" style="display: inline;"><strong>정보 게시판 </strong></h4>
					<button id="addBtn" class="btn btn-warning" style="float: right;" onclick="location.href = 'insert.do?boardGroup=${param.boardGroup}'">글등록</button>
				</div>
				<hr style="clear: both;">
				<div>
					<select name="boardGroup" required="required" style="margin-bottom: 10px; float: right;" onchange="showList(this)">
						<option value="">전체</option>
						<option value="P00">잡담</option>
						<option value="P01">소프트웨어 설계</option>
						<option value="P02">소프트웨어 개발</option>
						<option value="P03">데이터베이스 구축</option>
						<option value="P04">프로그래밍 언어 활용</option>
						<option value="P05">정보시스템 구축 관리</option>
					</select>	
				</div>
				<div>
					<table class="table table-hover table-bordered" style="clear:both;" id="boardList">
					<c:forEach var="board" items="${boardList }">
						<tr class="${board.boardGroup }" style="cursor: pointer;" onclick="location.href='detail.do?boardNo=${board.boardNo}';">
							<td>
							<span style="font-weight: bold;"><span class="badge badge-dark">${board.boardGroupName } </span> ${board.boardTitle}</span>
							<div style="display: block; font-size: x-small;">
								<span>${board.memName}</span>
								<span><fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></span>
								<span>조회수${board.boardCnt}</span>
								<!-- <span style="float: right">...</span> -->
							</div>
							</td>
						</tr>
					</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>

function showList(obj){
	$("tr").hide();
	
	if(obj.value){
		$("tr[class="+obj.value+"]").show();
	}else{
		$("tr").show();
	}
}

</script>
</body>
</html>
