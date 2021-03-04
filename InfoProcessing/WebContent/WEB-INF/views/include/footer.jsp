<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
var contextPath = "<%=request.getContextPath()%>"; 
function summernote_start(content){
	content.summernote({
		placeholder:'여기에 내용을 적으세요.',
		height:500,
		disableResizeEditor: true,
		useProtocol:false,
		toolbar: []
	});
	
}
</script>
<!-- jQeury 3.5.1 -->
<script src="<%= request.getContextPath() %>/res/template/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap 4.5.3 -->
<script src="<%= request.getContextPath() %>/res/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Common Script -->
<script src="<%= request.getContextPath() %>/res/js/main.js?v=2"></script>
<!-- Summernote -->
<script src="<%= request.getContextPath() %>/res/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>
