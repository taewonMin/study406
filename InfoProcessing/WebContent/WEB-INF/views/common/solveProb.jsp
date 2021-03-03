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
				<div class="problem">
					<div class="header">
						<h4 style="display: inline;">${quizList.get(0).quizTitle}</h4>
					</div>
					<hr>
					<div class="prob-body">
					
						<c:forEach var="num" begin="0" end="${quizList.size()-1 }">
							<c:set var="quiz" value="${quizList.get(num) }" />
							<div class="quizItem" style="display:none;">
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
								<div style="font-weight:bold;margin-bottom:40px;">${quiz.quizProb }</div>
								<c:if test="${quizAnswer==1 }">
									<a href="javascript:void(0);" class="answer_${quiz.quizNo }" style="color:crimson;text-decoration: none;" onclick="openAnswer(this);">정답보기</a>
								</c:if>
								<c:if test="${quiz.zzim==0 }">
									<a href="javascript:void(0);" zzim="true" style="color:crimson;text-decoration: none;float:right;" onclick="zzim(${quiz.quizId},this,'div#quizInfo_${quiz.quizId }');">찜하기</a><br><br>
								</c:if>
								<c:if test="${quiz.zzim!=0 }">
									<a href="javascript:void(0);" zzim="false" style="color:crimson;text-decoration: none;float:right;" onclick="zzim(${quiz.quizId},this,'div#quizInfo_${quiz.quizId }');">찜취소</a><br><br>
								</c:if>
								<div class="answer_${quiz.quizNo }" style="font-weight:bold;display:none;margin-bottom:40px;color:#6495ed;">${quiz.quizAnswer }</div>
							</div>
						<c:if test="${quizNum==0 }">
							<hr>
						</c:if>
						</c:forEach>
						<c:if test="${quizNum==1 }">
							<button class="btn btn-primary" style="display:none;font-family: cursive;" id="prevBtn" type="button" onclick="prev_go();">&lt;</button>
							<button class="btn btn-primary" style="float:right;font-family: cursive;" id="nextBtn" type="button" onclick="next_go();">&gt;</button>
						</c:if>
						<c:if test="${quizAnswer==0 }">
							<div class="row" style="clear:both;">
								<button class="btn btn-primary" style="margin:0 auto;" id="answerBtn" type="button" onclick="showAnswer();">정답 확인</button>
							</div>
						</c:if>
					</div>
				</div>
				
				<c:if test="${quizAnswer==0 }">
				<div class="answer" style="display:none;">
					<div class="header">
						<h4 style="display: inline;">${quizList.get(0).quizTitle} 정답</h4>
					</div>
					<hr>
					<div class="prob-body">
					
						<c:forEach var="num" begin="0" end="${quizList.size()-1 }">
							<c:set var="quiz" value="${quizList.get(num) }" />
							<div style="margin-bottom:20px;">
								<div class="row" style="margin-bottom:10px">
									<div class="col-sm-2" style="margin-top:5px;">
										<h6 style="font-weight:bold;display:inline-block">${quiz.subParentName }</h6>
										<h6 style="font-size:0.8em;display:inline-block">/ ${quiz.subName }</h6>
										<c:if test="${quiz.zzim != 0 }">
											<span class="badge badge-warning">찜</span>
										</c:if>
									</div>
								</div>
								<strong style="font-size: 1.2em;">${num+1 }.</strong>
								<div style="font-weight:bold;">${quiz.quizProb }</div>
								<div style="font-weight:bold;margin-top:20px;color:#6495ed;">${quiz.quizAnswer }</div>
							</div>
						</c:forEach>
					</div>
				</div>
				</c:if>
			</div>
			<!-- /content -->
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script>
if(${quizNum}==1){	// 한문제씩 풀기
	$('div.quizItem').eq(0).css('display','block');
	if(${quizList.size()} == 1){
		$('button#nextBtn').css('display','none');
	}else{
		$('button#answerBtn').css('display','none');
	}
}else{
	for(var i=0; i<${quizList.size()}; i++){
		$('div.quizItem').eq(i).css('display','block');
	}
}

function prev_go(){
	var quizItem = $('div.quizItem');
	for(var i=0; i<quizItem.length; i++){
		if(quizItem.eq(i).css('display')=='block'){
			quizItem.eq(i).css('display','none');
			quizItem.eq(i-1).css('display','block');
			if(i==1){
				$('button#prevBtn').css('display','none');
			}
			$('button#nextBtn').css('display','inline');
			$('button#answerBtn').css('display','none');
			break;
		}
	}
}

function next_go(){
	var quizItem = $('div.quizItem');
	for(var i=0; i<quizItem.length; i++){
		if(quizItem.eq(i).css('display')=='block'){
			quizItem.eq(i).css('display','none');
			quizItem.eq(i+1).css('display','block');
			if(i==quizItem.length-2){
				$('button#nextBtn').css('display','none');
				$('button#answerBtn').css('display','block');
			}
			$('button#prevBtn').css('display','inline');
			break;
		}
	}
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

function showAnswer(){
	$('div.problem').css('display','none');
	$('div.answer').css('display','block');
}
</script>
</body>
</html>
