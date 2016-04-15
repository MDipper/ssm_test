<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://github.com/bajdcc" prefix="cc"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册</title>
<cc:script url="~/js/jquery-1.11.1.js" />
<cc:script url="~/js/jquery.validate.min.js" />
<cc:script url="~/js/messages_zh.js" />
<cc:css url="~/css/screen.css" />
<script type="text/javascript" >
$.validator.setDefaults({
	submitHandler: function() {
		$.post(
				// 接收数据的页面
				'reg',
				// 传给后台的数据，多个参数用&连接或者使用json格式数据：{a:'value1',b:'value2'}
				{
					username: $("#username").val(),
					password: $("#password").val()
				},
				function(data) {
					if (data.code == '200') {
						alert("msg: "+data.msg+"\n"+"即将跳转。");
					} else if (data.code == '400') {
						alert(data.msg);
					}
				},
				// 默认返回字符串，设置值等于json则返回json数据
				'json'
		).error(function(){
			alert("注册失败，请稍后再试。");
		});
	}
});

$().ready(function() {
	// validate the comment form when it is submitted
	$("#signupForm").validate({
		rules: {
		      username: {
		        required: true,
		        minlength: 2,
		        remote: {
				    url: "check_user",     //后台处理程序
				    type: "get",                //数据发送方式
				    dataType: "json",           //接受数据格式   
				    data: {                     //要传递的数据
				        username: function() {
				            return $("#username").val();
				        },
					    password: function() {
				            return $("#password").val();
				        }
				    }
				}
		      },
		      password: {
		        required: true,
		        minlength: 6
		      },
		      confirm_password: {
		        required: true,
		        minlength: 6,
		        equalTo: "#password"
		      }		      
		    },
		    messages: {
		      username: {
		        required: "请输入用户名",
		        minlength: "用户名至少由两个字符组成"
		      },
		      password: {
		        required: "请输入密码",
		        minlength: "密码长度不能小于 6 个字母"
		      },
		      confirm_password: {
		        required: "请输入密码",
		        minlength: "密码长度不能小于 6 个字母",
		        equalTo: "两次密码输入不一致"
		      }
		    }		
	});
});
</script> 
<style type="text/css">
	#signupForm {
		width: 300px;
	}
	#signupForm label.error {
		margin-left: 10px;
		width: auto;
		display: inline;
	}
</style>
</head>
<body>
	<form class="cmxform" id="signupForm" method="post" action="user/register">
		<fieldset>
			<legend>请输入你的用户名和密码</legend>
			<p>
				<label for="cusername">用户名</label>
				<input id="username" name="username" type="text">
			</p>
			<p>
				<label for="cpassword">密码</label>
				<input id="password" name="password" type="password">
			</p>
			<p>
				<label for="cconfirm_password">确认密码</label>
				<input id="confirm_password" name="confirm_password" type="password">
			</p>
			<p>
				<input class="reset" type="reset" value="重置">
				<input class="submit" type="submit" value="注册">
			</p>
		</fieldset>
	</form>
</body>

</html>
