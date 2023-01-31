<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="../taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/js/easy_validator.pack.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.bgiframe.min.js"></script>
<script type="text/javascript" src="${ctx }/resource/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/resource/admin/js/ajaxfileupload.js"></script>
<link href="${ctx}/css/validate.css" rel="stylesheet" type="text/css" />
<link rel="StyleSheet" href="${ctx }/resource/mine/one/mine.css" type="text/css" />
<html>
	<head>
		<title>版块维护</title>
	</head>
	<body>
		<form id="form1" name="form1" action="" method="post">
			<input type="hidden" value="${map.id }" name="id" id="id" />
				<table class="mobile" style="width: 95%;">
					<tr class="pageheader">
						<td colspan="2">
							<strong>版块维护</strong>
						</td>
					</tr>
					<tr height="25">
						<td class="outDetail" style="width: 30%">
							版块名称：
							<label style="font-weight: bold; color: red">
							</label>
						</td>
						<td class="outDetail2">
							<input type="text" id="bkName" value="${map.bkName }" name="bkName"/>
						</td>
					</tr>
				</table>
				<br>
				<center>
				<input type="button" class="btn" value="保  存" onclick="save()" />
				<input type="button" class="btn" value="关  闭" onclick="window.close()" />
				</center>
		</form>
	</body>
	<script type="text/javascript">
	/**保存*/
	function save() {
		$.post("editSave.html",$("#form1").serializeArray(),
			function(result){
	        	result = eval("("+result+")");
	    		if(result.status == "true" || result.status == true){
	    			alert('保存成功');
	    			saveAnd();
	    		}else{
	    			alert('保存失败，请重试');
	    		}
	        }
		);
	}
</script>
</html>
