<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>应届毕业生论坛登录</title>
<link href="${ctx}/resource/mine/one/login/css/style.css" rel="styleSheet" type="text/css" media="all"/>
<script type="text/javascript" src="${ctx}/resource/admin/js/jquery-1.7.1.js"></script>
</head>
<body>
<div class="login">
	<h2>应届毕业生论坛</h2>
	<div class="login-top">
		<h1>登录</h1>
		<form id="login_form">
			<input type="text" id="login_username" name="username" placeholder="用户名"/>
			<input type="password" id="login_password" name="password" placeholder="密码"/>
		</form>
		<div class="forget">
			<input type="button" onclick="loginCheck()" class="loginClass" value="登录"/>
		</div>
	</div>
</div>

</body>

<script type="text/javascript">
/**登录判断，正确之后直接登录*/
function loginCheck(){
	var username = $("#login_username").val();
	var password = $("#login_password").val();
	if(username==""||password==""){
		alert("用户名和密码必须填写");
		return false;
	}
	$.ajax({
		type:"POST",
		async:false, 		//设置同步方式：异步
		cache:false,
		url:"${ctx}/adminLogin/save.html",
		data:$("#login_form").serializeArray(),
		success:function(result){
			result = eval("("+result+")");
			if(result.status=="true"||result.status==true){
				if(result.msg=="1"){
					window.location.href="${ctx}/admin/index.html";					
				}else{
					alert("用户名或密码错误");
				}				
			}
		}
	});
	
}


</script>
</html>