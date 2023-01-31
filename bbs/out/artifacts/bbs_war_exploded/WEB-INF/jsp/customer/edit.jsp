<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="../admin/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/resource/admin/js/ajaxfileupload.js"></script>
<link rel="StyleSheet" href="${ctx }/resource/mine/one/mine.css" type="text/css" />
<html>
<head>
<title>用户信息</title>
</head>
<body>
<form id="form1" name="form1" action="" method="post">
	<input type="hidden" value="${map.id }" name="id" id="id" />
	<table class="mobile" style="width: 95%;">
		<tr class="pageheader">
			<td colspan="2"><strong>用户信息</strong></td>
		</tr>
		<tr height="25">
			<td class="outDetail" style="width: 30%">账号： <label
				style="font-weight: bold; color: red"> </label></td>
			<td class="outDetail2"><input type="text" id="username"
				value="${map.username }" name="username" /></td>
		</tr>
		<tr height="25">
			<td class="outDetail" style="width: 30%">密码： <label
				style="font-weight: bold; color: red"> </label></td>
			<td class="outDetail2"><input type="text" id="password"
				value="${map.password }" name="password" /></td>
		</tr>
		<tr height="25">
			<td class="outDetail" style="width: 30%">姓名： <label
				style="font-weight: bold; color: red"> </label></td>
			<td class="outDetail2"><input type="text" id="name"
				value="${map.name }" name="name" /></td>
		</tr>
		<tr height="25">
			<td class="outDetail" style="width: 30%">手机： <label
				style="font-weight: bold; color: red"> </label></td>
			<td class="outDetail2"><input type="text" id="phone"
				value="${map.phone }" name="phone" /></td>
		</tr>
		<tr height="25">
			<td class="outDetail" style="width: 30%">性别： <label
				style="font-weight: bold; color: red"> </label></td>
			<td class="outDetail2"><select id="sex" name="sex">
					<option value="男" ${map.sex=='男'?'selected':'' }>男</option>
					<option value="女" ${map.sex=='女'?'selected':'' }>女</option>
			</select></td>
		</tr>
		<tr height="25">
			<td class="outDetail" style="width: 30%">年龄： <label
				style="font-weight: bold; color: red"> </label></td>
			<td class="outDetail2"><input type="text" id="age"
				value="${map.age }" name="age" /></td>
		</tr>
		<tr height="25">
			<td class="outDetail" style="width: 30%">家庭住址： <label
				style="font-weight: bold; color: red"> </label></td>
			<td class="outDetail2"><input type="text" id="address"
				value="${map.address }" name="address" /></td>
		</tr>
		<tr height="25">
			<td class="outDetail" style="width: 30%">身份证： <label
				style="font-weight: bold; color: red"> </label></td>
			<td class="outDetail2"><input type="text" id="idcard"
				value="${map.idcard }" name="idcard" /></td>
		</tr>
		<tr height="25">
			<td class="outDetail" style="width: 30%">发布信息权限： <label
				style="font-weight: bold; color: red"> </label></td>
			<td class="outDetail2"><select id="isft" name="isft">
					<option value="是" ${map.isft=='是'?'selected':'' }>是</option>
					<option value="否" ${map.isft=='否'?'selected':'' }>否</option>
			</select></td>
		</tr>
		<tr height="25">
			<td class="outDetail" style="width: 30%">评论权限： <label
				style="font-weight: bold; color: red"> </label></td>
			<td class="outDetail2"><select id="ispl" name="ispl">
					<option value="是" ${map.ispl=='是'?'selected':'' }>是</option>
					<option value="否" ${map.ispl=='否'?'selected':'' }>否</option>
			</select></td>
		</tr>
		<tr height="25">
			<td class="outDetail" style="width: 30%">级别： <label
				style="font-weight: bold; color: red"> </label></td>
			<td class="outDetail2"><select id="level" name="level">
					<option value="普通用户" ${map.level=='普通用户'?'selected':'' }>普通用户</option>
					<option value="版主" ${map.level=='版主'?'selected':'' }>版主</option>
			</select></td>
		</tr>
	</table>
	<p align="center">
		<br> <input type="button" class="btn" value="保  存" onclick="save(this);" />
		<input type="button" class="btn" value="关  闭" onclick="window.close();" />
	</p>
</form>
</body>
<script type="text/javascript">
function save(src) {
	$.post("editSave.html", $("#form1").serializeArray(), function(result) {
		result = eval("(" + result + ")");
		if (result.status == "true" || result.status == true) {
			alert('提交成功');
			saveAnd();
		} else {
			alert('保存失败，请重试');
		}
	});
}
</script>
</html>
