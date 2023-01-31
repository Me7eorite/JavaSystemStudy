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
		<display:table name="list" requestURI="list.html" class="list" id="row" cellspacing="0" cellpadding="0" pagesize="5">
			<display:column style="width:60px;" media="html" title="编号">
				<c:out value="${row_rowNum}"/>
			</display:column>
			<display:column title="用户" property="customerName"/>
			<display:column title="图片">
				<img alt="" style="width:100px;" src="${ctx}/${row.pic}">
			</display:column>
			<display:column title="赞" property="zan"/>
			<display:column title="发布时间" property="insertDate"/>
			
			<display:column title="删除" style="width:40px;">
				<img src="${ctx}/resource/admin/images/delete.gif"
					onclick="deleteOne('${row.id}')" style="cursor:hand;"/>
			</display:column>
			
			<display:column title="置顶" style="width:40px;">
				<c:if test="${row.zd=='是'}">
					<a href="#" onclick="zd('${row.id}','否')">取消置顶</a>
				</c:if>
				<c:if test="${row.zd==null||row.zd=='否'}">
					<a href="#" onclick="zd('${row.id}','是')">置顶</a>
				</c:if>				
			</display:column>
			
			<display:column title="显隐" style="width:40px;">
				<c:if test="${row.status=='显示'}">
					<a href="#" onclick="yc('${row.id}','隐藏')">隐藏</a>
				</c:if>
				<c:if test="${row.status==null||row.status=='隐藏'}">
					<a href="#" onclick="yc('${row.id}','显示')">显示</a>
				</c:if>				
			</display:column>
			
			
		</display:table>
	</body>
	<script type="text/javascript">
	/**删除一条记录*/
	function deleteOne(id){
		if(!confirm("确定要删除吗?")){
			return false;
		}
		var params={id:id};
		$.post("editDelete.html",params,function(result){
			result=eval("("+result+")");
			if(result.status=="true"||result.status==true){
				alert('删除成功');
				window.parent.form1.submit();
			}
		});
	}
	
	/**置顶或取消置顶*/
	function zd(id,status){
		var params={id:id,status:status};
		$.post("zdSave.html",params,function(result){
			result=eval("("+result+")");
			if(result.status=="true"||result.status==true){
				alert('成功');
				window.parent.form1.submit();
			}
		});
	}
	
	/**显示或隐藏控制*/
	function yc(id,status){
		var params={id:id,status:status};
		$.post("ycSave.html",params,function(result){
			result=eval("("+result+")");
			if(result.status=="true"||result.status==true){
				alert('成功');
				window.parent.form1.submit();
			}
		});
	}
	
</script>
</html>
