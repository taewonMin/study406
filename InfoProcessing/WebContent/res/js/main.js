setBoardMenu();

function getContextPath(){
	return "/InfoProcessing";
}

function setBoardMenu(){
	var resHTML = '<li class="nav-item"><a class="nav-link" href="'+getContextPath()+'/board/list.do?boardGroup=P01">1과목</a></li>';
	resHTML += '<li class="nav-item"><a class="nav-link" href="'+getContextPath()+'/board/list.do?boardGroup=P02">2과목</a></li>';
	resHTML += '<li class="nav-item"><a class="nav-link" href="'+getContextPath()+'/board/list.do?boardGroup=P03">3과목</a></li>';
	resHTML += '<li class="nav-item"><a class="nav-link" href="'+getContextPath()+'/board/list.do?boardGroup=P04">4과목</a></li>';
	resHTML += '<li class="nav-item"><a class="nav-link" href="'+getContextPath()+'/board/list.do?boardGroup=P05">5과목</a></li>';
	
	$("#info_board").append(resHTML);
}

$("#menu-toggle").click(function(e) {
	e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});