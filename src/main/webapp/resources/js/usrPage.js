function findPasswordFormCommit() {
	var id = $("input[name=memberId]");
	
	if (id.val() == "") {
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	}
	
	if (id.val().length >= 10) {
		alert("아이디는 10자 이하로 입력해주세요.");
		id.val("");
		id.focus();
		return false;
	}
	$("#findPasswordForm").submit();
}

function loginFormCommit() {
	var id = $("input[name=id]");
	var password = $("input[name=password]");

	if (id.val() == "") {
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	}
	
	if (id.val().length >= 10) {
		alert("아이디는 10자 이하로 입력해주세요.");
		password.val("");
		id.val("");
		id.focus();
		return false;
	}
	
	if (password.val() == "") {
		alert("비밀번호를 입력해주세요.");
		password.focus();
		return false;
	}
	
	$("#loginForm").submit();
}

function questionFormCommit() {
	var id = $("input[name=id]");
	var answer = $("input[name=answer]");

	if (answer.val() == "") {
		alert("질문에 대한 답을 입력해주세요.");
		answer.focus();
		return false;
	}

	$("#questionForm").submit();
}

function validCheckId(){
	var id = $("input[name=id]");
	var inputID = id.val();
	var checkFlag = $("input[name=duplicationIdCheck");
	$.ajax({
		type: "post",
        data : {
        	memberId : inputID
        },
        url : "/usr/validCheck/id",
        success : function(data) {
        	if(data){
        		$("#id").css("background-color","#FFD8D8");
        		checkFlag.val("duplication");
        	}else{
        		$("#id").css("background-color","#CEFBC9");
        		checkFlag.val("notDuplication");
        	}
        }
	});
	
}

function confirmPasswordd() {
	var password = $("input[name=password]");
	var confirmPassword = $("input[name=confirmPassword]");
	var checkFlag = $("input[name=confirmPwdCheck");
	
	if(! password.val() == ""){
		if (password.val() == confirmPassword.val()) {
			confirmPassword.css("background-color", "#CEFBC9");
			checkFlag.val("same");
		} else {
			confirmPassword.css("background-color", "#FFD8D8");
			checkFlag.val("notSame");
		}
	}	
}

function registerUsrFormCommit(){
	var id = $("input[name=id]");
	var password = $("input[name=password]");
	var confirmPassword = $("input[name=confirmPassword]");
	var question = $("input[name=question]");
	var answer = $("input[name=answer]");
	var name = $("input[name=name]");
	var idCheck = $("input[name=duplicationIdCheck");
	var passwordCheck = $("input[name=confirmPwdCheck");
	
	if(idCheck.val() == "duplication"){
		alert("아이디가 중복됩니다.");
		id.focus();
		return false;
	}
	
	if(passwordCheck.val() == "notSame"){
		alert("비밀번호가 일치하지 않습니다.");
		password.val("");
		confirmPassword.val("");
		password.focus();
		return false;
	}	
	if(password.val() == ""){
		alert("비밀번호를 입력해주세요.");
		password.focus();
		return false;
	}	
	if(confirmPassword.val() == ""){
		alert("비밀번호를 다시 한번 입력해주세요.");
		confirmPassword.focus();
		return false;
	}
	if(question.val() == ""){
		alert("비밀번호를 찾을 때 사용하기 위한 힌트 입력해주세요.");
		question.focus();
		return false;
	}
	if(answer.val() == ""){
		alert("힌트에 대한 답을 입력해주세요.");
		answer.focus();
		return false;
	}
	if(name.val() == ""){
		alert("이름을 입력해주세요.");
		name.focus();
		return false;
	}
	if(id.val() == ""){
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	}
	if (id.val().length >= 10) {
		alert("아이디는 10자 이하로 입력해주세요.");
		id.val("");
		id.focus();
		return false;
	}
	if (password.val().length >= 10) {
		alert("비밀번호는 10자 이하로 입력해주세요.");
		password.val("");
		password.focus();
		return false;
	}
	if (question.val().length >= 10) {
		alert("힌트는 50자 이하로 입력해주세요.");
		question.val("");
		question.focus();
		return false;
	}
	if (answer.val().length >= 10) {
		alert("힌트에 대한 답은 50자 이하로 입력해주세요.");
		answer.val("");
		answer.focus();
		return false;
	}
	
	$("#registerUsrForm").submit();
}

function confirmPasswordMod() {
	var password = $("input[name=password]");
	var confirmPassword = $("input[name=confirmPassword]");
	var checkFlag = $("input[name=confirmPwdCheck");
	
	if(! password.val() == ""){
		if (password.val() == confirmPassword.val()) {
			confirmPassword.css("background-color", "#CEFBC9");
			checkFlag.val("same");
		} else {
			confirmPassword.css("background-color", "#FFD8D8");
			checkFlag.val("notSame");
		}
	}	
}

function modifyUsrFormCommit(){
	var password = $("input[name=password]");
	var confirmPassword = $("input[name=confirmPassword]");
	var passwordCheck = $("input[name=confirmPwdCheck");
	var question = $("input[name=question]");
	var answer = $("input[name=answer]");
	var name = $("input[name=name]");
	
	
	if(!password.val() == "" ){
		if( confirmPassword.val() == ""){
			alert("비밀번호를 다시 한번 입력해주세요.");
			confirmPassword.focus();
			return false;
		}
		if(passwordCheck.val() == "notSame"){
			alert("비밀번호가 일치하지 않습니다.");
			password.val("");
			confirmPassword.val("");
			password.focus();
			return false;
		}
	}
	if(question.val() == ""){
		alert("비밀번호를 찾을 때 사용하기 위한 힌트 입력해주세요.");
		question.focus();
		return false;
	}
	if(answer.val() == ""){
		alert("힌트에 대한 답을 입력해주세요.");
		answer.focus();
		return false;
	}
	if(name.val() == ""){
		alert("이름을 입력해주세요.");
		name.focus();
		return false;
	}
	$("#modifyUsrForm").submit();
}
