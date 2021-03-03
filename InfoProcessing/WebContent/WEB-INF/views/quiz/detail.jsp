<%@page import="kr.or.ddit.quiz.vo.QuizVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			
			<!-- content -->
			<div class="container-fluid" style="padding: 20px;">
				<div class="header">
					<h4>${quizList.get(0).quizTitle}</h4>
					<span id="writer">작성자 : ${quizList.get(0).memId}</span>
				</div>
				<hr>
				<div class="prob-body">
				
					<c:forEach var="num" begin="0" end="${quizList.size()-1 }">
						<c:set var="quiz" value="${quizList.get(num) }" />
						<div class="row" style="margin-bottom:10px">
							<div class="col-sm-12" id="quizInfo_${quiz.quizId }" style="color:blue;">
								<h6 style="font-weight:bold;display:inline-block">${quiz.subParentName }</h6>
								<h6 style="font-size:0.8em;display:inline-block">/ ${quiz.subName }</h6>
								<c:if test="${quiz.zzim != 0 }">
									<span class="badge badge-warning">찜</span>
								</c:if>
							</div>
						</div>
						<strong style="font-size: 1.2em;">${num+1 }.</strong>
						<div style="font-weight:bold;">${quiz.quizProb }</div>
						<a href="javascript:void(0);" class="answer_${quiz.quizNo }" style="color:crimson;text-decoration:none;" onclick="openAnswer(this);">정답보기</a>
						<c:if test="${quiz.zzim==0 }">
							<a href="javascript:void(0);" zzim="true" style="color:crimson;text-decoration: none;float:right;" onclick="zzim(${quiz.quizId},this,'div#quizInfo_${quiz.quizId }');">찜하기</a>
						</c:if>
						<c:if test="${quiz.zzim!=0 }">
							<a href="javascript:void(0);" zzim="false" style="color:crimson;text-decoration: none;float:right;" onclick="zzim(${quiz.quizId},this,'div#quizInfo_${quiz.quizId }');">찜취소</a>
						</c:if>
						<div class="answer_${quiz.quizNo }" style="font-weight:bold;display:none;margin-top:20px;">${quiz.quizAnswer }</div>
						<div class="input-group" style="margin-bottom:20px;">
						
							<c:if test="${quiz.quizTag.length() > 0 }">
								<c:forEach items="${quiz.quizTag.split(\",\") }" var="tag">
									<span style='margin:10px 10px 0 0;font-weight:bold;color:#6495ed;'>#${tag }</span>
								</c:forEach>
							</c:if>
							
						</div>
						<hr>
					</c:forEach>						
				</div>
				<button class="btn btn-primary" type="button" onclick="history.go(-1);">목록</button>
				<button class="btn btn-danger myBtn" type="button" onclick="remove_go();" style="float:right;display:none;">삭제</button>
				<button class="btn btn-primary myBtn" type="button" onclick="location.href='modify.do?studyNo=${param.studyNo }&quizGroup=${param.quizGroup}';" style="float:right;margin-right:10px;display:none;">수정</button>
			</div>
			<!-- /content -->
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
var memId = '${sessionScope.loginUser.memId}';

if(memId=='${quizList.get(0).memId}'){
	$('button.myBtn').css('display','block');
}

function openAnswer(obj){
	if($(obj).text()=="정답보기"){
		$('div.'+$(obj).attr("class")).css("display","block");
		$(obj).text("감추기");
	}else{
		$('div.'+$(obj).attr("class")).css("display","none");
		$(obj).text("정답보기");
	}
}

function remove_go(){
	var remove = confirm("삭제하시겠습니까?");
	if(remove){
		location.href='remove.do?studyNo=${param.studyNo}&quizGroup=${param.quizGroup}';
	}
}
</script>
</body>
</html>
