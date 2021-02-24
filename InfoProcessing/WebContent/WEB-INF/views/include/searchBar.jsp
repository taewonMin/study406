<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<form action="list.do" role="form" class="form-inline">
	<input type="hidden" name="boardGroup" value="${param.boardGroup }">
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