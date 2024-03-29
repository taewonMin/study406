<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
	li.list-group-item.toggle{
		cursor: pointer;
		width: 50%; 
		border: 0;
	}

	li.list-group-item.type-on{
		color: red;
		font-weight: bold;
		border-bottom: 2px red solid;
	}
	
	li.quizItem:hover{
		cursor: pointer;
	    background-color: #f0f8ff;
	}
</style>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			
			<!-- content -->
			<div class="container-fluid">
				<form action="searchList.do" role="form" name="myForm" class="form" style="margin-top: 10px;" method="get">
					<input type="hidden" name="kind" value="${search.kind }" id="kind">
					<input type="hidden" name="searchType" value="${search.searchType }" id="searchType">
					<div id="keyword" class="card-tools" style="">
						<input  class="form-control" type="text" name="keyword" required="required" placeholder="검색어를 입력하세요." value="${search.keyword }" style="margin-bottom: 10px;"/>
						<button class="btn btn-light form-control" type="submit"><i class="fa fa-fw fa-search"></i></button>
					</div>	
				</form>
				<hr>
				<div id="searchResult">
					<ul class="list-group list-group-horizontal" style="text-align: center;">
					  <li class="list-group-item  ${search.kind eq '게시글' ? 'type-on' : ''} toggle" onclick="switchActive(this)" id="kindBoard">게시글</li>
					  <li class="list-group-item ${search.kind eq '문제' ? 'type-on' : ''} toggle" onclick="switchActive(this)" id="kindQuiz">문제</li>
					</ul>
					<div id="searchList">
						<div class="serach-header" style="margin-top: 10px; display: ${search.kind eq '게시글' ? 'block' : 'none'};"  id="boardSelect">
							<span id="boardCnt">${fn:length(boardList) } 건</span>
							<div style="float: right;">
							
								<select class="form-control-sm" onchange="javascript:$('#searchType').val(this.value);" style="border: 0">
									<option value="all">전체</option>
									<option value="board_title" ${search.kind eq '게시글' and search.searchType eq 'board_title' ? 'selected' : '' }>제 목</option>
									<option value="mem_name" ${search.kind eq '게시글' and search.searchType eq 'mem_name' ? 'selected' : '' }>작성자</option>
									<option value="board_content" ${search.kind eq '게시글' and search.searchType eq 'board_content' ? 'selected' : '' }>내 용</option>
									<option value="board_tag" ${search.kind eq '게시글' and search.searchType eq 'board_tag' ? 'selected' : '' }>태그</option>
								</select>
								
							</div>
						</div>
						<div class="serach-header" style="margin-top: 10px; display: ${search.kind eq '문제' ? 'block' : 'none'};" id="quizSelect">
							<span id="quizCnt">${fn:length(quizList) } 건</span>
							<div style="float: right;" >
								<select class="form-control-sm" onchange="javascript:$('#searchType').val(this.value);" style="border: 0">
									<option value="quiz_prob">내 용</option>
									<option value="quiz_answer" ${search.kind eq '문제' and search.searchType eq 'quiz_answer' ? 'selected' : '' }>해 설</option>
									<option value="mem_name" ${search.kind eq '문제' and search.searchType eq 'mem_name' ? 'selected' : '' }>작성자</option>
									<option value="quiz_tag" ${search.kind eq '문제' and search.searchType eq 'quiz_tag' ? 'selected' : '' }>태 그</option>
								</select>
							</div>
						</div>
						<div id="list" style="clear: both;">
							<c:if test="${not empty quizList }">
								<ul style="padding: 0; margin-top: 10px;">
									<c:forEach items="${quizList }" var="quiz">
										<li class="list-group-item quizItem" onclick="location.href='<%=request.getContextPath()%>/quiz/select.do?quizId=${quiz.quizId }'">
											<span style="font-weight: bold;">${quiz.quizTitle }</span>
											<div style="display: block; font-size: x-small;">
												<span>${quiz.memName } </span>
												<span>${quiz.quizRegdate}"</span>
												<span>조회 ${quiz.quizViewcnt }</span>
											</div>
										</li>
									</c:forEach>
								</ul>
							</c:if>
							<c:if test="${not empty boardList }">
								<ul style="padding: 0; margin-top: 10px;">
									<c:forEach items="${boardList }" var="board">
										<li class="list-group-item quizItem" onclick="location.href='<%=request.getContextPath()%>/board/detail.do?boardGroup=${board.boardGroup }&boardNo=${board.boardNo }'">
											<span style="font-weight: bold;">${board.boardTitle }</span>
											<div style="display: block; font-size: x-small;">
												<span>${board.memName } </span>
												<span><fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd"/></span>
												<span>조회 ${board.boardCnt }</span>
											</div>
										</li>
									</c:forEach>
								</ul>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<!-- /content -->
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
function switchActive(obj){
	if($(obj).attr("class").indexOf("type-on") > 0) return;
	$(obj).siblings("li").removeClass("type-on");
	$(obj).addClass("type-on");
	$("#kind").val($(obj).text());
	showSelect();
}

function showSelect(){
	if($("input[name=kind]").val() =="게시글"){
		$("#quizSelect").hide();
		$("#boardSelect").show().trigger("click");
		$('#searchType').val("all");
	}else{
		$("#boardSelect").hide();
		$("#quizSelect").show();
		$('#searchType').val("quiz_prob");
	}
}
</script>
</body>
</html>
