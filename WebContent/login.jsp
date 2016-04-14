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
<script type="text/javascript" >
	
	function validate() {
		var errorMsg = "";
		var loginName = document.getElementById("username");
		var password = document.getElementById("password");
		if(!loginName.value){
			errorMsg += "用户名不能为空!";
		}
		if(!password.value){
			errorMsg += "密码不能为空!";
		}

		if(errorMsg != ""){
			$("#result").html(errorMsg);
			$("#result").show();
		}
		else{
			$("#result").show();
			$("#result").html("正在登录中...");
			//登录处理
			loginUtil();
		}
	}	
	function loginUtil()
	{
		 $.ajax({  
				data:"name="+$("#username").val()+"&pwd=" + $('#password').val(),  
		        type:"POST",  	        
		        url:"user/login",  
		        dataType: 'json',
		        error:function(data){  
		            alert("出错了！！:"+data.msg);  
		        },  
		        success:function(data){  
		            alert(data.msg);  
		            $("#result").html(data.msg) ;  
		        }  
		        });    
	}

</script> 
<style type="text/css">

#usernameinfo  {color: red}
#passwordinfo  {color: red}
</style>
</head>
<body>
		<span>账号:</span>
		<input type="text" id="username" name="username"	placeholder="用户名" />
			&nbsp<span id="usernameinfo">*</span><br>
		<br> <span>密码:</span>
		<input type="password" id="password"	name="password" placeholder="密码" />
		&nbsp<span  id="passwordinfo">*</span><br><br>
		<input  type="submit"  onclick="validate();"	value="登录" />&nbsp&nbsp
		<a href="user/register" >注册</a>	
		<br><br>
		 <div id="result"></div>
</body>

</html>
