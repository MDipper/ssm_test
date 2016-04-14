<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册</title>
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="./js/jquery.validate.min.js"></script>
<script type="text/javascript" src="./js/messages_zh.js"></script>
<link rel="stylesheet" href="./css/screen.css">
<script type="text/javascript" >
$.validator.setDefaults({
	submitHandler: function() {
		alert("submitted!");
	}
});

$().ready(function() {
	// validate the comment form when it is submitted
	$("#signupForm").validate();
});
</script> 
<style type="text/css">
	#signupForm {
		width: 670px;
	}
	#signupForm label.error {
		margin-left: 10px;
		width: auto;
		display: inline;
	}
</style>
</head>
<body>
	<form class="cmxform" id="signupForm" method="post" action="user/add">
		<fieldset>
			<legend>请输入你的用户名和密码</legend>
			<p>
				<label for="cusername">用户名 (必填, 至少2个字符)</label>
				<input id="cusername" name="username" minlength="2" type="text" required>
			</p>
			<p>
				<label for="cpassword">密码 (必填, 至少6个字符)</label>
				<input id="cpassword" type="password" minlength="2" name="password" required>
			</p>
				<input class="submit" type="submit" value="注册">
			</p>
		</fieldset>
	</form>
</body>

</html>
