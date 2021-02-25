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
									<div class="col-sm-2" id="quizInfo_${quiz.quizId }" style="margin-top:5px;">
										<h6 style="font-weight:bold;display:inline-block">${quiz.subParentName }</h6>
										<h6 style="font-size:0.8em;display:inline-block">/ ${quiz.subName }</h6>
										<c:if test="${quiz.zzim != 0 }">
											<span class="badge badge-warning">찜</span>
										</c:if>
									</div>
								</div>
								<strong style="margin-right:5px;">${num+1 }.</strong>
								<strong>${quiz.quizProb }</strong><br><br>
								<c:if test="${quizAnswer==1 }">
									<a href="javascript:void(0);" class="answer_${quiz.quizNo }" style="color:crimson;text-decoration: none;" onclick="openAnswer(this);">정답보기</a>
								</c:if>
								<c:if test="${quiz.zzim==0 }">
									<a href="javascript:void(0);" id="zzimBtn_${quiz.quizId }" zzimChk="true" style="color:crimson;text-decoration: none;float:right;" onclick="zzim(${quiz.quizId},this);">찜하기</a><br><br>
								</c:if>
								<c:if test="${quiz.zzim!=0 }">
									<a href="javascript:void(0);" id="zzimBtn_${quiz.quizId }" zzimChk="false" style="color:crimson;text-decoration: none;float:right;" onclick="zzim(${quiz.quizId},this);">찜취소</a><br><br>
								</c:if>
								<strong class="answer_${quiz.quizNo }" style="margin-bottom:20px;display: none;color:#6495ed;">${quiz.quizAnswer }</strong>
							</div>
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
								<strong style="margin-right:5px;">${num+1 }.</strong>
								<strong>${quiz.quizProb }</strong><br><br>
								<strong style="color:#6495ed;">${quiz.quizAnswer }</strong>
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
		$('strong.'+$(obj).attr("class")).css("display","block");
		$(obj).text("감추기");
	}else{
		$('strong.'+$(obj).attr("class")).css("display","none");
		$(obj).text("정답보기");
	}
}

function showAnswer(){
	$('div.problem').css('display','none');
	$('div.answer').css('display','block');
}

function zzim(quizId,obj){
	var zzimChk = $(obj).attr("zzimChk");
	var chk;
	if(zzimChk=="true"){
		chk = confirm('찜 하시겠습니까?');
	}else{
		chk = confirm('찜을 취소하시겠습니까?');
	}
	
	if(!chk){
		return;
	}
	
	$.ajax({
		url:'zzim.do',
		type:'post',
		data:{quizId:quizId,zzimChk:zzimChk},
		success:function(data){
			if(zzimChk=="true"){
				$('div#quizInfo_'+quizId).append('<span class="badge badge-warning">찜</span>');
				$(obj).attr("zzimChk","false");
				$('a#zzimBtn_'+quizId).text("찜취소");
			}else{
				$('div#quizInfo_'+quizId+' .badge').remove();
				$(obj).attr("zzimChk","true");
				$('a#zzimBtn_'+quizId).text("찜하기");
			}
		},
		error:function(error){
			alert('서버 에러');
		}
	});
}
</script>
</body>
</html>
