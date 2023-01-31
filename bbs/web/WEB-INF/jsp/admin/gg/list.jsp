<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@include file="../taglibs.jsp"%>
<%@taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<style type="text/css">
@import url("${ctx}/resource/admin/displaytag/displaytag.css");
@import url("${ctx}/resource/admin/displaytag/alternative.css");
</style>
<link rel="StyleSheet" href="${ctx }/resource/mine/one/mine.css" type="text/css" />
<html>
	<body>
		<display:table name="list"
			requestURI="list.html" class="list" id="row" cellspacing="0" cellpadding="0" pagesize="5">
			<display:column style="width:60px;" media="html" title="编号">
				<c:out value="${row_rowNum}"/>
			</display:column>
			<display:column title="标题" property="title"/>
			<display:column title="图片">
				<img style="width:100px;" src="${ctx}/${row.pic}"/>
			</display:column>
			<display:column title="内容" property="content"/>
			<display:column title="显示日期">
				<fmt:formatDate value="${row.showDate}" type="date" pattern="yyyy-MM-dd"/>
			</display:column>
			<display:column title="修改" style="width:40px;">
				<img src="${ctx}/resource/admin/images/edit.gif"
					onclick="return modifyOne('${row.id}','modify');" style="cursor:hand;"/>
			</display:column>
			<display:column title="删除" style="width:40px;">
				<img src="${ctx}/resource/admin/images/delete.gif"
					onclick="return deleteOne('${row.id}');" style="cursor:hand;"/>
			</display:column>
		</display:table>
	</body>
	<script type="text/javascript">
	//删除确定
	function deleteOne(id){
		if(!confirm("确定要删除吗?")){
			return false;
		}
		var params={id:id};
		$.post("editDelete.html",params,function(result){
			result=eval("("+result+")");
			if(result.status=="true"||result.status==true){
				alert('成功');
				window.parent.form1.submit();
			}
		});
	}
	//修改信息
	function modifyOne(id,method){
			MyWindow.OpenCenterWindow('edit.html?id='+id+'&method='+method,'modify',800,800);
	}
</script>
</html>
