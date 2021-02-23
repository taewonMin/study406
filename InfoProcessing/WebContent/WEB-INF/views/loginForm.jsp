<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="login.do" method="post">
	<h1>로그인 폼</h1>
	아이디:<input type="text" name="memId" value="lalaru"><br>
	비밀번호:<input type="password" name="memPass" value="123"><br>
	<button type="submit">로그인</button>
</form>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script type="text/javascript">
	var message = "<%= session.getAttribute("msg")==null ? "" : session.getAttribute("msg")%>";
	if(message!=""){
		alert(message);
	}
	
	$('input[name="memId"]').focus();
</script>
</body>
</html>
<% session.removeAttribute("msg"); %>