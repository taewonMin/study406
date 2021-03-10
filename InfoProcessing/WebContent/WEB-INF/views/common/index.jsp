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
			<div class="container-fluid" align="center">
				<p>정처기 실기 시험을 필기 CBT처럼 풀기 위해 만들어진 사이트 입니다</p>
				<p>스터디 문제를 통해 다양한 문제도 같이 풀 수 있으면 좋겠네요!</p>
				<p>자주 봐야하거나 기억하고 싶은 개념이 있다면 게시판에 올리고 찜해서 찜목록을 통해서 자주 봐주세요!</p>
				<p>상단의 406호의 모험을 누르면 메인화면으로 이동합니다(문제풀기)</p>
				<p>불편 사항이 있다면 언제든 말씀주세요!</p>
				<p>(사진파일은 능력이 안돼서 구현하지 못했습니다 ㅜ_ㅜ)</p>
			</div>
			<!-- /content -->
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
</script>
</body>
</html>
