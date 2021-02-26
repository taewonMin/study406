<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<form action="searchList.do" role="form" name="myForm"class="form" style="margin-top: 10px;" method="get">
					<input type="hidden" name="kind" value="게시글" id="kind">
					<input type="hidden" name="searchType" value="all" id="searchType">
					<div id="keyword" class="card-tools" style="">
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="" style="margin-bottom: 10px;"/>
						<button class="btn btn-light form-control" type="submit"><i class="fa fa-fw fa-search"></i></button>
					</div>	
				</form>
				<hr>
				<div id="searchResult">
					<ul class="list-group list-group-horizontal" style="text-align: center;">
					  <li class="list-group-item type-on toggle" onclick="switchActive(this)">게시글</li>
					  <li class="list-group-item toggle" onclick="switchActive(this)">문제</li>
					</ul>
					<div id="searchList">
						<div class="serach-header" style="margin-top: 10px; displaly: none;"  id="boardSelect">
							<span id="boardCnt"></span>
							<div style="float: right;">
								<select class="form-control-sm" onchange="javascript:$('#searchType').val(this.value);" style="border: 0">
									<option value="all">전체</option>
									<option value="board_title">제 목</option>
									<option value="mem_id" >작성자</option>
									<option value="board_content">내 용</option>
									<option value="board_tag">태그</option>
								</select>
							</div>
						</div>
						<div class="serach-header" style="margin-top: 10px;display: none;" id="quizSelect">
							<span id="quizCnt"></span>
							<div style="float: right;" >
								<select class="form-control-sm" onchange="javascript:$('#searchType').val(this.value);" style="border: 0">
									<option value="quiz_prob">문 제</option>
									<option value="quiz_answer">해 설</option>
									<option value="mem_id" >작성자</option>
									<option value="quiz_tag">태 그</option>
								</select>
							</div>
						</div>
						<div id="list">
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
