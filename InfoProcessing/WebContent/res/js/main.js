setBoardMenu();
function setBoardMenu(){
	var resHTML = '<li class="nav-item"><a class="nav-link" href="'+contextPath+'/board/list.do?boardGroup=P01">1. 소프트웨어 설계</a></li>';
	resHTML += '<li class="nav-item"><a class="nav-link" href="'+contextPath+'/board/list.do?boardGroup=P02">2. 소프트웨어 개발</a></li>';
	resHTML += '<li class="nav-item"><a class="nav-link" href="'+contextPath+'/board/list.do?boardGroup=P03">3. 데이터베이스 구축</a></li>';
	resHTML += '<li class="nav-item"><a class="nav-link" href="'+contextPath+'/board/list.do?boardGroup=P04">4. 프로그래밍 언어 활용</a></li>';
	resHTML += '<li class="nav-item"><a class="nav-link" href="'+contextPath+'/board/list.do?boardGroup=P05">5. 정보시스템 구축 관리</a></li>';
	$("#info_board").append(resHTML);
}
$("#menu-toggle").click(function(e) {
	e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});

// 태그 추가 (input 태그 id, 태그를 추가할 target)
function addTag(inputId, target){
	var input = $('#'+inputId);
	if(input.val().trim() != ""){
		var tag = "<span name='"+inputId+"' style='cursor:pointer;margin-right:10px;font-weight:bold;color:#6495ed;' onclick='removeTag(this);'>#"+input.val().replaceAll(" ", "")+"</span>";
		$(target).append(tag);
		input.val("");
	}
}

// 태그 클릭시 삭제
function removeTag(obj){
	var check = confirm("태그를 삭제하시겠습니까?");
	if(check){
		$(obj).remove();
	}
}

//태그를 문자열로 변환 (tag의 name값)
function getTagToString(tagName){
	var tagList = $('span[name="'+tagName+'"]');
	
	var quizTag = "";
	if(tagList.length > 0){
		for(var j=0; j<tagList.length; j++){
			quizTag += tagList.eq(j).text().substr(1);
			if(j < tagList.length-1){
				quizTag += ",";
			}
		}
	}
	
	return quizTag;
}

function setTag(targetId){
	$(targetId).val(getTagToString('boardTag'));
}

// 태그 입력시 enter로 받기
function checkEnter(inputId, target){
	if(event.keyCode == 13){
		addTag(inputId, target);
	}
}

//quizId : quizId(int)
//obj : this -> zzim 속성이 부여된 tag
//target : 찜 뱃지를 append할 부모 tag
function zzim(quizId,obj,target){
	var zzimChk = $(obj).attr("zzim");
	var chk;
	if(zzimChk=="true"){
		chk = confirm('찜 하시겠습니까?');
	}else{
		chk = confirm('찜을 취소하시겠습니까?');
	}
	if(!chk){
		return;
	}
	$.ajax({
		url:contextPath+'/main/zzim.do',
		type:'post',
		data:{quizId:quizId,zzimChk:zzimChk},
		success:function(data){
			if(zzimChk=="true"){
				$(target).append('<span class="badge badge-warning">찜</span>');
				$(obj).attr("zzim","false");
				$(obj).css({"background-color":"white","color":"#ff9807","border":"1px solid #ffc107"});
				$(obj).text("찜취소");
			}else{
				$(target+' .badge').remove();
				$(obj).attr("zzim","true");
				$(obj).css({"background-color":"#ffc107","color":"black"}); 
				$(obj).text("찜하기");
			}
		},
		error:function(error){
			alert('서버 에러');
		}
	});
}

function zzim_board(boardNo,obj,target){
	var zzimChk = $(obj).attr("zzim");
	var chk;
	if(zzimChk=="true"){
		chk = confirm('찜 하시겠습니까?');
	}else{
		chk = confirm('찜을 취소하시겠습니까?');
	}
	if(!chk){
		return;
	}
	
	$.ajax({
		url:contextPath+'/member/zzimBoard.do',
		type:'post',
		data:{boardNo:boardNo,zzimChk:zzimChk},
		success:function(data){
			if(zzimChk=="true"){
				$(target).append('<span class="badge badge-warning">찜</span>');
				$(obj).attr("zzim","false");
				$(obj).text("찜취소");
			}else{
				$(target+' .badge').remove();
				$(obj).attr("zzim","true");
				$(obj).text("찜하기");
			}
		},
		error:function(error){
			alert('서버 에러');
		}
	});
}

// 세부 과목 변경 메서드
function subjectChange(obj){
	var tagId = $(obj).attr("id");
	$.get('<%=request.getContextPath()%>/subject/list.do?studyNo=${param.studyNo}',{subParentCode:obj.value},function(subList){
		if(subList.length > 0){
			$('.'+tagId).css("display","block");
			printData(subList,$('.'+tagId),$('#subject-template'),'.'+tagId+' select');
		}else{
			$('.'+tagId).css("display","none");
			$('.'+tagId+' select').remove();
		}
	});
}

// handlebars
function printData(data, target, templateObject, removeClass){
	
	var template = Handlebars.compile(templateObject.html());
	
	var html = template(data);
	
	if(removeClass){
		$(removeClass).remove();
	}
	target.append(html);
}