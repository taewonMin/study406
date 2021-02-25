<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
table tr td {
	width: 20%;
}
</style>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			
			<!-- content -->
			<div class="container-fluid">
				<h1 class="mt-4" align="center">정보처리기사 실기</h1>
				<form role="conditionForm" action="main/solve.do" method="post" class="form-group">
					<table class="table table-bordered">
						<tr><th colspan="2" style="text-align: center; background-color: powderblue;">문제 형식</th></tr>		
						<tr class="">
							<td><input class="" type="radio" name="quizNum" id="oneNum" value="1"><label for="oneNum">한문제씩 풀기</label></td>
							<td><input class="" type="radio" name="quizNum" id="multiNum" checked="checked" value="0"><label for="multiNum">한꺼번에 풀기</label></td>
						</tr>
		
						<tr class="">
							<td><input class="" type="radio" name="quizAnswer" id="noAns"><label for="noAns" >다 풀고 정답보기</label></td>
							<td><input class="" type="radio" name="quizAnswer" id="yesAns" checked="checked"><label for="yesAns">정답 보면서 풀기</label></td>
						</tr>
					</table>
					
					<table class="table table-bordered">
						<tr><th colspan="5" style="text-align: center; background-color: powderblue;">문제 종류</th></tr>		
								
						<tr class="">
							<td colspan="5">
								<input type="radio" name="quizType" class="" id="prevType" checked="checked" onclick="changeQuizType(this);" value="0"><label style="width: 50%" for="prevType">기출문제</label>
								<input type="radio" name="quizType" class="" id="exeType" onclick="changeQuizType(this);" value="1"><label for="exeType">연습문제</label>
							</td>
						</tr>

						<tr class="" align="center">
							<td><input type="checkbox" name="quizSubCode" class="" id="sub1" checked="checked" value="P01"><label for="sub1">1과목</label></td>
							<td><input type="checkbox" name="quizSubCode" class="" id="sub2" checked="checked" value="P02"><label for="sub2">2과목</label></td>
							<td><input type="checkbox" name="quizSubCode" class="" id="sub3" checked="checked" value="P03"><label for="sub3">3과목</label></td>
							<td><input type="checkbox" name="quizSubCode" class="" id="sub4" checked="checked" value="P04"><label for="sub4">4과목</label></td>
							<td><input type="checkbox" name="quizSubCode" class="" id="sub5" checked="checked" value="P05"><label for="sub5">5과목</label></td>
						</tr>
						
						<tr class="preProb">
							<td colspan="2" align="center">회차 선택</td>
							<td colspan="3">
								<select class="form-control" name="preProbGroup" >
									<option value="1">2020년 실기 1회</option>
									<option value="2">2020년 실기 2회</option>
									<option value="3">2020년 실기 3회</option>
								</select>
							</td>
						</tr>
						<tr class="testProb" style="display:none;">
							<td colspan="1" align="center">회차 선택</td>
							<td colspan="2" >
								<select class="form-control" name="studyNo" onchange="changeGroup(this);">
									<option value="default">--스터디 그룹 선택--</option>
									<option value="1">1기</option>
									<option value="2">2기</option>
								</select>
							</td>
							<td colspan="2">
								<select class="form-control probList" name="testProbGroup">
									<option value="default">--스터디 그룹 선택--</option>
								</select>
							</td>
						</tr>
					</table>
					<div style="text-align: right;">
						<button type="button" class="btn btn-primary" onclick="solveProb();">문제 풀기</button>					
					</div>
				</form>
			</div>
			<!-- /content -->
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script>
function solveProb(){
	// 기출문제
	if($('input[name="quizType"]:checked').val()==0){
		alert('기출문제 데이터 없음');
		return;
	}
	
	if($('input[name="quizSubCode"]:checked').length==0){
		alert("과목을 하나 이상 선택하세요.");
		return;
	}
	if($('input[name="quizType"]:checked').val()==1){
		if($('select[name="studyNo"]').val()=='default'){
			alert("스터디 그룹을 선택하세요.");
			$('select[name="studyNo"]').focus();
			return;
		}
		if($('select[name="testProbGroup"]').val()=='default'){
			alert("스터디 그룹을 선택하세요.");
			$('select[name="testProbGroup"]').focus();
			return;
		}
	}
	
	var form = $('form[role="conditionForm"]');
	form.submit();
}

function changeQuizType(obj){
	var type = obj.value;
	if(type == 1){
		$('tr.preProb').css('display','none');
		$('tr.testProb').css('display','contents');
	}else{
		$('tr.preProb').css('display','contents');
		$('tr.testProb').css('display','none');
	}
}

function changeGroup(obj){
	
	$('select.probList option').remove();
	
	if(obj.value == 'default'){
		var option = $('<option value="default">--스터디 그룹 선택--</option>');
		$('select.probList').append(option);
		return;
	}
	
	$.ajax({
		url:'<%=request.getContextPath()%>/main/getProb.do',
		type:'post',
		data:{studyNo:obj.value},
		success:function(quizList){
			
			if(quizList.length > 0){
				for(var i=0; i<quizList.length; i++){
					var option = $('<option value="'+quizList[i].quizGroup+'">'+quizList[i].quizTitle+'</option>');
					$('select.probList').append(option);
				}
			}else{
				var option = $('<option value="default">--스터디 그룹 선택--</option>');
				$('select.probList').append(option);
			}
		},
		error:function(error){
			alert("서버 에러 발생");
		}
	});
}
</script>
</body>
</html>
