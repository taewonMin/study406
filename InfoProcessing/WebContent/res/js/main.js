setBoardMenu();
function setBoardMenu(){
	var resHTML = '<li class="nav-item"><a class="nav-link" href="'+contextPath+'/board/list.do?boardGroup=P01">1과목</a></li>';
	resHTML += '<li class="nav-item"><a class="nav-link" href="'+contextPath+'/board/list.do?boardGroup=P02">2과목</a></li>';
	resHTML += '<li class="nav-item"><a class="nav-link" href="'+contextPath+'/board/list.do?boardGroup=P03">3과목</a></li>';
	resHTML += '<li class="nav-item"><a class="nav-link" href="'+contextPath+'/board/list.do?boardGroup=P04">4과목</a></li>';
	resHTML += '<li class="nav-item"><a class="nav-link" href="'+contextPath+'/board/list.do?boardGroup=P05">5과목</a></li>';
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
		var tag = "<span name='"+inputId+"' style='margin-right:10px;font-weight:bold;color:#6495ed;' onclick='removeTag(this);'>#"+input.val().replaceAll(" ", "")+"</span>";
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

// 태그 입력시 enter로 받기
function checkEnter(inputId, target){
	if(event.keyCode == 13){
		addTag(inputId, target);
	}
}