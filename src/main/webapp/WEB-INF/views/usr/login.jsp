<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>mskim backend-service login</title>
  <!-- Bootstrap core CSS-->
  <link href="/bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">로그인</div>
      <div class="card-body">
        <form role="form" method="post" id="loginForm">
          <div class="form-group">
            <label for="exampleInputEmail1">아이디</label>
            <input class="form-control" name="id" id="id" aria-describedby="emailHelp" placeholder="Enter yourID">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">비밀번호</label>
            <input class="form-control" name="password" id="password" type="password" placeholder="Password">
          </div>
          <div class="modal-footer">
          	<input type="hidden" name="currUrl" value="${currUrl}">
            <button type="button" style="width: 48%" class="btn btn-primary" onclick="fn_login()">로그인</button>
            <button type="button" style="width: 48%" class="btn btn-secondary" type="button" data-dismiss="modal" onclick="javascript:history.back()">취소</button>
          </div>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="/usr/register">회원가입</a>
          <a class="d-block small" href="/usr/findPassword">비밀번호 찾기</a>
          <a class="d-block small" href="/docs">메인으로 이동</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="/bootstrap/jquery/jquery.min.js"></script>
  <script src="/bootstrap/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="/bootstrap/jquery-easing/jquery.easing.min.js"></script>
  <script>
  	function fn_login(){
  		var id = $("#id").val();
  		var password = $("#password").val();

  		/* if(id == ""){
  			alert("아이디를 입력해주세요.");
  			return false;
  		}else if(password == ""){
  			alert("비밀번호를 입력해주세요.");
  			return false;
  		} */
  		$("#loginForm").submit();
  		
  	}
  </script>
</body>

</body>
</html>