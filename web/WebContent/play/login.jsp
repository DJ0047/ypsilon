<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>WELCOME TO MY PL@YGROUND</title>
<link rel="stylesheet" href="../css/bootstrap.css">
</head>
<script type="https://ajax.googleapis.com/ajax"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script>
	function loginCheck() {
		var obj = document.login;
		if (!obj.id.value && !obj.pw.value) {
			alert('아이디와 비밀번호를 입력하세요.');
			obj.id.focus();
			return false;
		} else if (!obj.id.value) {
			alert('아이디를 입력하세요.');
			obj.id.focus();
			return false;
		} else if (!obj.pw.value) {
			alert('비밀번호를 입력하세요.');
			obj.pw.focus();
			return false;
		}
		obj.submit();
	}
</script>
<body>
	<form action="loginProcess.jsp" method="post" name="login">
		<div align="center">
			<br> <br> <br> <br> <br> <br> <input
				type="text" name="id"> <input type="password" name="pw">
			<button type="button" class="btn btn-danger" onclick="loginCheck()">LogIn</button>
		</div>
	</form>
</body>
</html>