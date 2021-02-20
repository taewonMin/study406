<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  
  <title>Notice | Regist</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/bootstrap/dist/css/adminlte.min.css">
  <!-- include summernote css/js -->
  <link rel="stylesheet" href="/resources/bootstrap/plugins/summernote/summernote.min.css" rel="stylesheet">
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
            <h1 class="m-0 text-dark">공지사항</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">목 록</a></li>
              <li class="breadcrumb-item active">공지사항</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width:960px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">글수정</h3>
						<div class ="card-tools">
							<button type="button" class="btn btn-warning" id="modifyBtn">수 정</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-danger" id="cancelBtn" onclick="history.go(-1);">취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">
						<form role="form" method="post" action="/notice/modify.do" name="modifyForm" enctype="multipart/form-data">
							<input type="hidden" name="nno" id="nno">
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title" name='title' class="form-control" placeholder="제목을 쓰세요">
							</div>							
							<div class="form-group">
								<label for="writer">작성자</label> 
								<input type="text" id="writer" name="writer" class="form-control" value="" readonly="readonly">
							</div>
							
							<div class="form-group">
								<label for="startdate">시작일</label> 
								<input type="date" id="startdate" name="startdate" class="form-control" value="">
							</div>
							
							<div class="form-group">
								<label for="enddate">종료일</label> 
								<input type="date" id="enddate" name="enddate" class="form-control" value="">
							</div>
							
							
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="textarea" name="content" id="content" rows="20"
									placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
							</div>
							<div class="form-group">
								<div class="card card-warning">
								<div class="card-header" style="padding-top:0;padding-bottom:0;">
									<i class="nav-icon fas fa-book"></i>&nbsp;<span style="font-weight:bold;">Attaches</span>
								</div>
								<div class="card-body attachList" style="padding:5px;">
									<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
										<!-- attach list -->
									</ul>
								</div>
								</div>
							</div>
							<div class="form-group">
								<div class="card card-outline card-success">
									<div class="card-header">
										<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>
										&nbsp;&nbsp;<button class="btn btn-xs btn-primary" 
										type="button" id="addFileBtn">Add File</button>
									</div>									
									<div class="card-footer fileInput">
									</div>
								</div>
							</div>
							<button type="submit" style="display: none;" id="modifyDoBtn"></button>
						</form>
					</div><!--end card-body  -->
					<div class="card-footer" >
						
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<!-- jQuery -->
<script src="/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- summernote Editor -->
<script src="/resources/bootstrap/plugins/summernote/summernote.min.js"></script>
<!-- jquery cookie -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js" ></script>
<!-- common -->
<script src="/resources/js/common.js?v=3" ></script>

<script>
var nno = getParameterValueFromUrl('nno');

$(document).ready(function(){
	setNotice();
});

function setNotice(){
	var notice = ${notice};
	$('#title').val(notice.title);
	$('#nno').val(notice.nno);
	$('#writer').val(notice.writer);
	$('#viewcnt').val(notice.viewcnt);
	$('#regDate').val(prettifyDate(notice.regdate));
	$('#startdate').val(prettifyDate(notice.startdate));
	if(notice.enddate){$('#enddate').val(prettifyDate(notice.enddate));}
	$('#content').html(notice.content);
	
	summernote_start($('#content'));
	printData(notice.attachList,$('div.attachList > ul'),$('#attach-div-template'),'.attach-item');
};

$('#modifyBtn').on('click',function(e){
	
	if($("input[name='title']").val()==""){
		alert("제목은 필수입니다.");
		$("input[name='title']").focus();
		return;
	}
	
	if($("input[name='content']").val()==""){
		$("input[name='content']").focus();
		alert("내용을 입력해 주세요");
		return;
	}
	if($("input[name='startdate']").val() && $("input[name='enddate']").val()){
		if($("input[name='startdate']").val() > $("input[name='enddate']").val()){
			$("input[name='startdate']").focus();
			alert("공지 일정이 잘못되었습니다.");
			return;
		}
	}else if(!$("input[name='startdate']").val()){
		alert("공지 시작일을 입력 해 주세요.");
		return;
	}
	
	var files = $('input[name="uploadFile"]');
	for(var file of files){
		if(file.value==""){
			alert("파일을 선택하세요.");
			file.focus();
			return false;
		}
	}	
	
	$("#modifyDoBtn").trigger("click");
});

</script>



<script  type="text/x-handlebars-template"  id="attach-div-template">
{{#each .}}
<li class="attach-item">																			
	<div class="mailbox-attachment-info float-left ">
		<a class="mailbox-attachment-name row" name="attachedFile" attach-fileName="{{fileName }}" attach-no="{{nano }}"
			 href="/notice/attach/getFile.html?nno={{nno }}&nano={{nano }}"  >													
			<span><i class="fas fa-paperclip"></i>{{fileName }}&nbsp;&nbsp;</span>
			<button type="button" style="border:0;outline:0;" class="badge badge-danger">X</button>
		</a>																			
	</div>
</li>	
{{/each}}										 
</script>
<script>
$('div.attachList').on('click','a[name="attachedFile"] > button',function(event){	
	
	var parent = $(this).parent('a[name="attachedFile"]');
	alert(parent.attr("attach-fileName")+"파일을 삭제합니다.");
	
	var nano=parent.attr("attach-no");
	
	$(this).parents('li.attach-item').remove();
	
	var input=$('<input>').attr({"type":"hidden",
	     "name":"deleteFile",
	     "value":nano
		 }); 
	$('form[role="form"]').prepend(input);
	
	return false;
});

$('#addFileBtn').on('click',function(event){
	
	var attachedFile=$('a[name="attachedFile"]').length; //기존 첨부파일
	var inputFile=$('input[name="uploadFile"]').length;	 //추가된 첨부파일
	var attachCount=attachedFile+inputFile;
	
	if(attachCount >=5){
		alert("파일추가는 5개까지만 가능합니다.");
		return;
	}
	
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline"); 

	var div=$('<div>').addClass("inputRow");
	div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");
	div.appendTo('.fileInput');
});

$('div.fileInput').on('click','div.inputRow > button',function(event){  		
	$(this).parent('div.inputRow').remove();	
});

$('.fileInput').on('change','input[type="file"]',function(event){
	if(this.files[0].size>1024*1024*40){
	alert("파일 용량이 40MB를 초과하였습니다.");
	this.value="";
	$(this).focus();
	return false;
} 
});  
</script>
</body>
</html>