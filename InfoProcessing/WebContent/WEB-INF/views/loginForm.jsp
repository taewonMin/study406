<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>

.myform{
	width: 50%;
}
@media(max-width:400px) {
		.myform {
			width: 85%;
		}
	
     }

</style>
<body style="background-color: #f0f8ff;">
<div style="text-align: center; margin-top:150px;">
	<h4 align="center" style="margin-bottom: 10px; text-shadow: 1px 1px 1px gray">406호의 모험</h4>
	
	<form action="login.do" method="post">
		<div  class="myform" style="background-color: white; display: inline-block; padding:20px; border-radius: 15px;">
			<div style="text-align: left;">
				<label for="memId"><strong>ID:</strong></label>
				<input class="form-control" type="text" name="memId" id="memId"value=""><br>
				<label for="password"><strong>Password:</strong></label>
				<input class="form-control" type="password" name="memPass" id="password" value=""><br>
			</div>
			<button class="btn btn-info" type="submit" style="width:100%;">Login</button>
		</div>
	</form>
</div>
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