<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
	<div class="d-flex" id="wrapper">
		<%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
		<div id="page-content-wrapper">
			<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			
			<!-- content -->
			<div class="container-fluid">
				<h1 class="mt-4" align="center">정보처리기사 실기</h1>
				<form action="" class="form-group">
					<table class="table table-bordered">
						<tr><th colspan="2" style="text-align: center; background-color: powderblue;">문제 형식</th></tr>		
						<tr class="">
							<td><input class="" type="radio" name="quizNum" id="oneNum"><label for="oneNum">한문제씩 풀기</label></td>
							<td><input class="" type="radio" name="quizNum" id="multiNum"><label for="multiNum">한꺼번에 풀기</label></td>
						</tr>
		
						<tr class="">
							<td><input class="" type="radio" name="quizAnswer" id="noAns"><label for="noAns" >다 풀고 정답보기</label></td>
							<td><input class="" type="radio" name="quizAnswer" id="yesAns"><label for="yesAns">정답 보면서 풀기</label></td>
						</tr>
					</table>
					
					<table class="table table-bordered">
						<tr><th colspan="5" style="text-align: center; background-color: powderblue;">문제 종류</th></tr>		
								
						<tr class="">
							<td colspan="5">
								<input type="radio" name="quizType" class="" id="prevType" checked="checked"><label style="width: 50%" for="prevType">기출문제</label>
								<input type="radio" name="quizType" class="" id="exeType"><label for="exeType">연습문제</label>
							</td>
						</tr>

						<tr class="" align="center">
							<td><input type="checkbox" name="quizSub" class="" id="sub1" checked="checked"><label for="sub1">1과목</label></td>
							<td><input type="checkbox" name="quizSub" class="" id="sub2" checked="checked"><label for="sub2">2과목</label></td>
							<td><input type="checkbox" name="quizSub" class="" id="sub3" checked="checked"><label for="sub3">3과목</label></td>
							<td><input type="checkbox" name="quizSub" class="" id="sub4" checked="checked"><label for="sub4">4과목</label></td>
							<td><input type="checkbox" name="quizSub" class="" id="sub5" checked="checked"><label for="sub5">5과목</label></td>
						</tr>
						
						<tr class="">
							<td colspan="2" align="center">회차 선택</td>
							<td colspan="3">
								<select class="input-group">
									<option>2020년 실기 1회</option>
									<option>2020년 실기 2회</option>
									<option>2020년 실기 3회</option>
								</select>
							</td>
						</tr>
					</table>
					<div style="text-align: right;">
						<button type="button" class="btn btn-primary">문제 풀기</button>					
					</div>
				</form>
			</div>
			<!-- /content -->
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
</script>
</body>
</html>
