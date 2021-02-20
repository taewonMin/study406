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

<!-- jQeury 3.5.1 -->
<script src="<%= request.getContextPath() %>/res/template/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap 4.5.3 -->
<script src="<%= request.getContextPath() %>/res/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

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