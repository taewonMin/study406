<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
table tr td{
	vertical-align: middle !important;
}

div.container-fluid{
	width:60%;
}
@media(max-width:400px){
	div.container-fluid{
		width:100%;
	}
}
</style>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			<!-- content -->
			<div class="container-fluid">
				<h2 class="mt-4" align="center" style="margin-top: 30px;">정보처리기사 실기</h2>
				<form role="conditionForm" action="main/solve.do" method="post" class="form-group">
					<table class="table table-bordered">
						<tr><th colspan="2" style="text-align: center; background-color: powderblue;">문제 형식</th></tr>		
						<tr class="">
							<td><input class="" type="radio" name="quizNum" id="oneNum" checked="checked" value="1"><label for="oneNum">한문제씩 풀기</label></td>
							<td><input class="" type="radio" name="quizNum" id="multiNum" value="0"><label for="multiNum">한꺼번에 풀기</label></td>
						</tr>
		
						<tr class="">
							<td><input class="" type="radio" name="quizAnswer" id="noAns" value="0"><label for="noAns" >다 풀고 정답보기</label></td>
							<td><input class="" type="radio" name="quizAnswer" id="yesAns" checked="checked" value="1"><label for="yesAns">정답 보면서 풀기</label></td>
						</tr>
					</table>
					
					<table class="table table-bordered">
						<tr><th colspan="5" style="text-align: center; background-color: powderblue;">문제 종류</th></tr>		
								
						<tr class="" align="center">
							<td width="20%" style="padding:10px;"><input type="checkbox" name="quizSubCode" class="" id="sub1" checked="checked" value="P01"><label for="sub1">1과목</label></td>
							<td width="20%" style="padding:10px;"><input type="checkbox" name="quizSubCode" class="" id="sub2" checked="checked" value="P02"><label for="sub2">2과목</label></td>
							<td width="20%" style="padding:10px;"><input type="checkbox" name="quizSubCode" class="" id="sub3" checked="checked" value="P03"><label for="sub3">3과목</label></td>
							<td width="20%" style="padding:10px;"><input type="checkbox" name="quizSubCode" class="" id="sub4" checked="checked" value="P04"><label for="sub4">4과목</label></td>
							<td width="20%" style="padding:10px;"><input type="checkbox" name="quizSubCode" class="" id="sub5" checked="checked" value="P05"><label for="sub5">5과목</label></td>
						</tr>
						
						<tr class="testProb">
							<td colspan="1" align="center">회차 선택</td>
							<td colspan="2" >
								<select class="form-control" name="studyNo" onchange="changeGroup(this);">
									<option disabled="disabled">--스터디 그룹 선택--</option>
									<option value="0" selected>기출</option>
									<option value="1">1기</option>
									<option value="2">2기</option>
								</select>
							</td>
							<td colspan="2">
								<select class="form-control probList" name="testProbGroup">
								</select>
							</td>
						</tr>
					</table>
					<div style="text-align: right;">
						<button type="submit" class="btn btn-primary" onclick="solveProb();">문제 풀기</button>					
					</div>
				</form>
			</div>
			<!-- /content -->
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script>
changeGroup(document.getElementsByTagName("select")[0]);

function solveProb(){
	if($('input[name="quizSubCode"]:checked').length==0){
		alert("과목을 하나 이상 선택하세요.");
		return;
	}
	
	if($('select[name="testProbGroup"]').val()=='default'){
		alert("스터디 그룹을 선택하세요.");
		$('select[name="testProbGroup"]').focus();
		return;
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
				var option = $('<option value="default">회차 선택</option>');
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
