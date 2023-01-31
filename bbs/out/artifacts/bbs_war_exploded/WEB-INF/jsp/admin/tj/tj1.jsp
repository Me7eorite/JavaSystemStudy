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
			requestURI="tj1.html" class="list"
			id="row" cellspacing="0" cellpadding="0" >
			<display:column style="width:60px;" media="html" title="编号">
				<c:out value="${row_rowNum}"/>
			</display:column>
			<display:column title="日期" property="days"/>
			<display:column title="数量" property="counts"/>
		</display:table>
	</body>
</html>
