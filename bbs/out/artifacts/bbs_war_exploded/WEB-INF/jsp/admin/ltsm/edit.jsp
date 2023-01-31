<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="../taglibs.jsp"%>
<%@taglib prefix="ckeditor" uri="http://ckeditor.com"%>
<script type="text/javascript" src="${ctx}/js/easy_validator.pack.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.bgiframe.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resource/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ctx}/resource/admin/js/ajaxfileupload.js"></script>
<link rel="StyleSheet" href="${ctx }/resource/mine/one/mine.css" type="text/css" />
<html>
<head>
<title>网站说明</title>
</head>
<body>
	<form id="form1" name="form1" action="" method="post">
		<table class="mobile" style="width: 95%;">
			<tr class="pageheader">
				<td colspan="2"><strong>网站说明</strong></td>
			</tr>
			<tr height="25">
				<td class="outDetail" style="width: 30%">详细内容： <label
					style="font-weight: bold; color: red"> </label></td>
				<td class="outDetail2">
					<textarea rows="5" cols="50" name="content" id="editor1">${map.content}</textarea>
					<ckeditor:replace replace="editor1" basePath="${ctx}/resource/plugin/ckeditor/" />
				</td>
			</tr>
		</table>
		<p align="center">
			<br>
			<input type="button" class="btn" value="保  存" onclick="save(this);" />
		</p>
	</form>
</body>
<script type="text/javascript">
	function save(src) {
	$("#editor1").val(CKEDITOR.instances.editor1.getData());
		$.post("editSave.html", $("#form1").serializeArray(), function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('成功');
				saveAnd();
			} else {
				alert('保存失败，请重试');
			}
		});
	}
</script>
</html>
