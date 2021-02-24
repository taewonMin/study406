<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
	li.list-group-item{
		cursor: pointer;
		width: 50%; 
		border: 0;
	}

	li.list-group-item.type-on{
		color: red;
		font-weight: bold;
		border-bottom: 2px red solid;
	}
</style>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			
			<!-- content -->
			<div class="container-fluid">
				<form action="list.do" role="form" class="form" style="margin-top: 10px;">
					<input type="hidden" name="boardGroup" value="${param.boardGroup }">
					<input type="hidden" name="searchType" value="게시글" id="myType">
					<div id="keyword" class="card-tools" style="">
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="" style="margin-bottom: 10px;"/>
						<button class="btn btn-light form-control" type="submit"><i class="fa fa-fw fa-search"></i></button>
					</div>	
				</form>
				<hr>
				<div id="searchResult">
					<ul class="list-group list-group-horizontal" style="text-align: center;">
					  <li class="list-group-item type-on" onclick="setActive(this)">게시글</li>
					  <li class="list-group-item" onclick="setActive(this)">문제</li>
					</ul>
					<div id="searchList">
						<div class="serach-header" style="margin-top: 10px;">
							<span>0 건</span>
							<div style="float: right;">
								<select class="form-control-sm" name="searchType" id="searchType">
									<option value="t">제 목</option>
									<option value="w" >작성자</option>
									<option value="c">내 용</option>
									<option value="tag">태그</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /content -->
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
var submitAction = function(e) {
	e.preventDefault();
    e.stopPropagation();
};
$('form[role="form"]').bind('submit', submitAction);

function setActive(obj){
	if($(obj).attr("class").indexOf("type-on") > 0) return;
	$(obj).siblings("li").removeClass("type-on");
	$(obj).addClass("type-on");
	$("#myType").val($(obj).text());
}

</script>
</body>
</html>
