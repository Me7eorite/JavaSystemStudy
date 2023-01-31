<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="../taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/js/easy_validator.pack.js"></script>
<%@taglib prefix="ckeditor" uri="http://ckeditor.com"%>
<script type="text/javascript" src="${ctx}/js/jquery.bgiframe.min.js"></script>
<script type="text/javascript" src="${ctx }/resource/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/resource/admin/js/ajaxfileupload.js"></script>
<link href="${ctx}/css/validate.css" rel="stylesheet" type="text/css" />
<link rel="StyleSheet" href="${ctx }/resource/mine/one/mine.css" type="text/css" />
<link rel="StyleSheet" href="${ctx }/resource/admin/css/mobile_main.css" type="text/css" />

<html>
	<head>
		<title>公告管理</title>
	</head>
	<body>
		<form id="form1" name="form1" action="" method="post">
			<input type="hidden" value="${map.id }" name="id" id="id" />
			<table class="mobile" style="width: 95%;">
				<tr class="pageheader">
					<td colspan="2">
						<strong>公告管理</strong>
					</td>
				</tr>
			<tr height="25">
				<td class="outDetail" style="width: 30%">
					标题：
					<label style="font-weight: bold; color: red">
					</label>
				</td>
				<td class="outDetail2">
					<input type="text" id="title" value="${map.title }" name="title"/>
				</td>
			</tr>
			<tr height="25">
				<td class="outDetail" style="width: 30%">
					图片：
					<label style="font-weight: bold; color: red">
					</label>
				</td>
				<td class="outDetail2">
					<input id="f_fileImg0" name="cmfile"
					onchange="triggerUploadImg0(this);" title="选择图片" type="file">
					<input class="text" type="hidden" name="pic" id="bbbbbImg0" value="${map.pic }">
					<c:if test="${map.pic!=null }">
					<img style='width:100px;' src="${ctx }/${map.pic}" id="aaaaaImg0"/>
					</c:if>
				</td>
			</tr>
			<tr height="25">
				<td class="outDetail" style="width: 30%">
					内容：
					<label style="font-weight: bold; color: red">
					</label>
				</td>
				<td class="outDetail2">
					<textarea rows="5"  id="content" cols="50" name="content">${map.content }</textarea>
				</td>
			</tr>
			<tr height="25">
				<td class="outDetail" style="width: 30%">
					显示日期：
					<label style="font-weight: bold; color: red">
					</label>
				</td>
				<td class="outDetail2">
					<input  readonly="readonly" name="showDate" id="showDate" value="<fmt:formatDate value="${map.showDate }" type="date" pattern="yyyy-MM-dd"/>" type="text" onClick="WdatePicker()"/>
				</td>
			</tr>
			</table>
			<p align="center">
				<br>
				<input type="button" class="btn" value="保  存" onclick="save(this);" />
				<input type="button" class="btn" value="关  闭" onclick="window.close();" />
			</p>
		</form>
	</body>
	<script type="text/javascript">
	function save(src) {
		$.post("editSave.html",$("#form1").serializeArray(),
		       function(result){
		        	result = eval("("+result+")");
		    		if(result.status == "true" || result.status == true){
		    			alert('成功');
		    			saveAnd();
		    		}else{
		    			alert('保存失败，请重试');
		    		}
		        }
			);
	}
	
	function triggerUploadImg0(src) {
		$.ajaxFileUpload({
			url : '${ctx}/file/upload.json',
			secureuri : false,
			fileElementId : 'f_fileImg0',
			dataType : 'json',
			data : {
				fileloc : 'upload/',
				dir : 'temp'
			},
			success : function(data, status) {
				$("#bbbbbImg0").val(data.data.filepath);
				$("#aaaaaImg0").remove();
				$("#bbbbbImg0").after("<img  id='aaaaaImg0' style='width:100px;' src='${ctx}/"+data.data.filepath+"' />");
			},
			error : function(data, status, e) {alert('文件上传失败');}
		});
	}
</script>
</html>
