function appsValidCheck(){
	var app_name = $("input[name=app_name]");
	var api_allow = $("input[name=api_allow]");
	var description = $("input[name=description]");
	
	if(app_name.val() == ""){
		alert("앱 이름을 입력해주세요.");
		app_name.focus();
		return false;
	}
	if(app_name.val().length >= 91){
		alert("앱 이름은 90자 이하로 입력해주세요.");
		app_name.focus();
		return false;
	}
	if(api_allow.val().length >= 71){
		alert("앱 URL은 70자 이하로 입력해주세요.");
		api_allow.focus();
		return false;
	}
	if(description.val().length >= 141){
		alert("앱 설명은 140자 이하로 입력해주세요.");
		description.focus();
		return false;
	}
	if(api_allow.val().length == 71){
		alert("앱 URL은 70자까지 입력됩니다.");
	}
	return true;
}

function modifyApp(){
	
	if(appsValidCheck()){
		$("#modifyForm").submit();
	}
}
function registApp(){
	
	if(appsValidCheck()) {
		$("#registerForm").submit();	
	}
}
