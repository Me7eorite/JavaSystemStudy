<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ include file="../admin/taglibs.jsp" %>
<link rel="StyleSheet" href="${ctx}/resource/admin/css/mobile_main.css" type="text/css"/>
<link rel="StyleSheet" href="${ctx}/resource/mine/one/mine.css" type="text/css"/>
<html>

<body class="mobile">
	<form id="form1" name="form1" method="post" action="list.html" target="query">
		<table class="mobile">
			<tr class="pageheader" height="6%">
				<td>用户管理</td>
			</tr>
			<tr class="pagesearch" height="5%">
				<td style="text-align:left;"> &nbsp;&nbsp;账号模糊查询：
					<input type="text" name="username" style="width:100px;"/>
					<input type="button" class="btn" value="查  询" onclick="search()"/>
					&nbsp;&nbsp;
					<input type="button" class="btn" value="新  增" onclick="add()"/>
				</td>
			</tr>
		</table>
		<iframe id="query" name="query" frameborder="0" height="88%" width="100%" scrolling="yes"></iframe>
	</form>

<script type="text/javascript">
	search();
	//查询
	function search(){
		form1.submit();
	}
	//新增
	function add(){
		MyWindow.OpenCenterWindow("edit.html","addOld",500,600);
	}

</script>
</body>
</html>