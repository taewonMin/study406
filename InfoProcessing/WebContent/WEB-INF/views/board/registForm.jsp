<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>정보 게시판</title>
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
						<h3 class="card-title p-1">글등록</h3>
						<div class ="card-tools">
							<button type="button" class="btn btn-primary" id="registBtn" onclick="submit_go();">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn" onclick="CloseWindow();">취 소</button>
						</div>
					</div><!--end card-header  -->
					<div class="card-body pad">
						<form role="form" action="<%=request.getContextPath()%>/notice/regist.do" method="post" name="registForm" enctype="multipart/form-data">
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title"
									name='title' class="form-control" placeholder="제목을 쓰세요">
							</div>							
							<div class="form-group">
								<label for="writer">작성자</label> 
								<input type="text" id="writer" name="writer" readonly="readonly" class="form-control" value="${sessionScope.loginUser.id}">
							</div>
							
							<div class="form-group">
								<label for="writer">시작일</label> 
								<input type="date" id="startdate" name="startdate" class="form-control" value="">
							</div>
							
							<div class="form-group">
								<label for="writer">종료일</label> 
								<input type="date" id="enddate" name="enddate" class="form-control" value="">
							</div>
							
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="textarea" name="content" id="content" rows="20"
									placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
							</div>
							<div class="form-group">								
							<div class="card card-outline card-success">
								<div class="card-header">
									<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>
									&nbsp;&nbsp;<button class="btn btn-xs btn-primary" 
									type="button" id="addFileBtn" onclick="addBtnClick_go();">Add File</button>
								</div>									
								<div class="card-footer fileInput">
								</div>
							</div>
							</div>
							<button type="submit" id="registDoBtn" style="display: none"></button>
						</form>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">
						
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
<!-- Summernote -->
<script src="/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>

<!-- jquery cookie -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js" ></script>
<!-- common -->
<script src="/resources/js/common.js" ></script>
<script>

summernote_start($('#content'));
$("#startdate").val(getToday());

function submit_go(){
	var form = document.registForm;	
	
	if(form.title.value==""){
		form.title.focus();
		alert("제목은 필수입니다.");
		return;
	}
	if(form.content.value==""){
		form.content.focus();
		alert("내용을 입력해 주세요");
		return;
	}
	if(form.startdate.value && form.enddate.value){
		if(form.startdate.value > form.enddate.value){
			form.startdate.focus();
			alert("공지 일정이 잘못되었습니다.");
			return;
		}
	}else if(!form.startdate.value){
		alert("공지 시작일을 입력 해 주세요.");
		return;
	}
	
	var files = $('input[name="uploadFile"]');
	
	for(var file of files){
		if(file.value==""){
			alert("파일을 선택하세요.");
			file.focus();
			file.click();
			return;
		}
	}	
	$("#registDoBtn").trigger("click");
}

</script>

<!-- 파일 업로드 -->
<script>
var fileIndex = 0;

function addBtnClick_go(){
	if($('input[name="uploadFile"]').length >=5){
		alert("파일추가는 5개까지만 가능합니다.");
		return;
	}
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline"); 
	var div=$('<div>').addClass("inputRow");
	div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red btn"+fileIndex+"' onclick='deleteFile_go("+fileIndex+");' type='button'>X</button");
	div.appendTo('.fileInput');
	fileIndex++;
}

function deleteFile_go(number){
	$('div.inputRow button.btn'+number).parent('div.inputRow').remove();
}

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