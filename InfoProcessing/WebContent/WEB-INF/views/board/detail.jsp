<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  
  <title>Notice | home</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/bootstrap/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">



  <!-- Content Wrapper. Contains page content -->
  <div style="width:100%;">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Notice Detail</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">상세보기</a></li>
              <li class="breadcrumb-item active">공지사항</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
    	<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title">상세보기</h3>
						<div class="card-tools">
							<button type="button" id="modifyBtn" class="btn btn-warning" onclick="modify_go();">MODIFY</button>						
						    <button type="button" id="removeBtn" class="btn btn-danger" onclick="remove_go();">REMOVE</button>					    
						    <button type="button" id="listBtn" class="btn btn-primary" onclick="CloseWindow();">CLOSE</button>
						</div>
					</div>
					<div class="card-body">
						<div class="form-group col-sm-12">
							<label for="title">제 목</label>
							<input type="text" class="form-control" id="title" value="" readonly />							
						</div>
						<div class="row">	
							<div class="form-group col-sm-4" >
								<label for="writer">작성자</label>
								<input type="text" class="form-control" id="writer" value="" readonly />
							</div>		
							
							<div class="form-group col-sm-4" >
								<label for="regDate">작성일</label>
								<input type="text" class="form-control" id="regDate" value="" readonly />
							
							</div>
							<div class="form-group col-sm-4" >
								<label for="viewcnt">조회수</label>
								<input type="text" class="form-control" id="viewcnt" value="" readonly />
							</div>
						</div>		
						<div class="form-group col-sm-12">
							<label for="content">내 용</label>
							<div id="content"></div>	
						</div>						
					</div>
					
					<!-- 첨부파일 -->
					<div class="card-footer" style="padding:0;">
						<div class="card card-warning">
							<div class="card-header" style="padding-top:0;padding-bottom:0;">
								<i class="nav-icon fas fa-book"></i>&nbsp;<span style="font-weight:bold;">Attaches</span>
							</div>
								<div class="card-body"><div class="row attachList">
								</div> 
							</div>
						</div>
					</div>
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


<!-- jQuery -->
<script src="/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- Summernote -->
<script src="/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>

<!-- jquery cookie -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js" ></script>
<!-- common -->
<script src="/resources/js/common.js" ></script>

<script  type="text/x-handlebars-template"  id="attach-div-template">
{{#each .}}
	<div class="col-md-4 col-sm-4 col-xs-12 attach"  style="cursor:pointer;"
		 onclick="location.href='/notice/attach/getFile.do?nno={{nno }}&nano={{nano }}';">
		<div class="info-box">	
		 	<span class="info-box-icon bg-yellow">
				<i class="fa fa-copy"></i>
			</span>
			<div class="info-box-content">
				<span class ="info-box-text">{{prettifyDate regDate }}</span>
				<span class ="info-box-number">{{fileName }}</span>
			</div>
		</div>
	</div>	
{{/each}}										 
</script>

<script>
var nno = getParameterValueFromUrl('nno');
var queryParams = getParameterValueFromUrl();

setNoticeDetail();

function setNoticeDetail(){
	var notice = ${dataMap};
	$('#title').val(notice.title);
	$('#writer').val(notice.writer);
	$('#viewcnt').val(notice.viewcnt);
	$('#regDate').val(prettifyDate(notice.regDate));
	$('#content').html(notice.content);
	printData(notice.attachList,$('div.attachList'),$('#attach-div-template'),'.attach');
};


function modify_go(){
	location.href="<%=request.getContextPath()%>/notice/modifyForm.do?nno="+nno;	
}
function remove_go(){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="<%=request.getContextPath()%>/notice/remove.do?nno="+nno;
	}
}

</script>
</body>
</html>