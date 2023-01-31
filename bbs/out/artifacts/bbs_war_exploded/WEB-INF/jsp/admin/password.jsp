<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp" %>
<link rel="StyleSheet" href="${ctx}/resource/mine/one/mine.css" type="text/css"/>
<html>
<head>
<title>修改密码</title>

</head>
<body>
	<form id="form1" name="form1" method="post">
		<table class="mobile" style="width:300px;">
			<tr class="pageheader">
				<td colspan="2"><strong>修改密码</strong></td>
			</tr>
			<tr height="25">
				<td class="outDetail" style="width:30%;">旧密码：<label style="font-weight:bold;color:red">*</label></td>
				<td class="outDetail2" ><input type="password" id="oldPassword" name="oldPassword"/></td>
			</tr>
			<tr height="25">
				<td class="outDetail" style="width:30%;">新密码：<label style="font-weight:bold;color:red">*</label></td>
				<td class="outDetail2" ><input type="password" id="newPassword" name="newPassword"/></td>
			</tr>
			<tr height="25">
				<td class="outDetail" style="width:30%;">重复新密码：<label style="font-weight:bold;color:red">*</label></td>
				<td class="outDetail2" ><input type="password" id="newPasswordConfirm" name="newPasswordConfirm"/></td>
			</tr>
			
		</table>
			<br/>
			<input type="button" class="btn" value="保&nbsp;&nbsp;&nbsp;&nbsp;存" onclick="save()">
	
	</form>
</body>
	<script type="text/javascript">
		function save(){
			var oldPassword = $("#oldPassword").val();
			var newPassword = $("#newPassword").val();
			var newPasswordConfirm = $("#newPasswordConfirm").val();
			if(oldPassword==""){
				alert("旧密码不能为空");
				return false;				
			}
			if(newPassword==""){
				alert("新密码不能为空");
				return false;				
			}
			if(newPasswordConfirm==""){
				alert("重复新密码不能为空");
				return false;				
			}
			if(newPasswordConfirm!=newPassword){
				alert("两次新密码输入不一致");
				return false;	
			}
			$.post("${ctx}/admin/changePassword.html",$("#form1").serializeArray(),function(result){
				debugger;
				
				result = eval("("+result+")");
				if(result.status=="true"||result.status==true){
					alert("修改成功");
					window.location.reload();
				}else{
					alert("旧密码不对，请重新输入");
				}
			});
		}
	
	
	</script>
</html>