<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList");
%>
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
					<h4 style="display: inline;">정보 게시판</h4>
					<div id="serachBar" style="float: right;">
						<form action="list.do" role="form" class="form-inline">
							<input type="hidden" name="boardGroup" value="P01">
							<div id="keyword" class="card-tools" style="">
								<select class="form-control" name="searchType" id="searchType">
									<option value="tcw" >전 체</option>
									<option value="t">제 목</option>
									<option value="w" >작성자</option>
									<option value="c">내 용</option>
									<option value="tc">제목+내용</option>
									<option value="tag">태그</option>
								</select>					
								<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value=""/>
								<button class="btn btn-primary form-control" type="submit"><i class="fa fa-fw fa-search"></i></button>
							</div>	
						</form>					
					</div>
					<button class="btn btn-warning" style="float: right;" onclick="location.href = 'insert.do?boardGroup=${param.boardGroup}'">글등록</button>
				</div>
				<hr>
				<div>
					<ul class="list-group" style="clear:both;" id="boardList">
						<%
							for(BoardVO board : boardList){
								pageContext.setAttribute("board", board);
						%>
						<li class="list-group-item quizItem" onclick="location.href='detail.do?boardNo=${board.boardNo}';">
							<span style="font-weight: bold;">${board.boardTitle}</span>
							<div style="display: block; font-size: x-small;">
								<span>${board.memId}</span>
								<span>${board.boardDate}</span>
								<span>조회수${board.boardCnt}</span>
								<span style="float: right">...</span>
							</div>
						</li>
					
						<%}%>
					</ul>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>

</html>
