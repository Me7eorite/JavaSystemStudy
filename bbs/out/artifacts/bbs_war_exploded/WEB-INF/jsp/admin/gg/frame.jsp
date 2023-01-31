<%@ page language="java" pageEncoding= "UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="../taglibs.jsp"%>
<link rel="StyleSheet" href="${ctx }/resource/admin/css/mobile_main.css" type="text/css" />
<link rel="StyleSheet" href="${ctx }/resource/mine/one/mine.css" type="text/css" />
<html>
	<body class= "mobile">
		<form id= "form1" name="form1" method="post" action= "list.html" target= "query">
			<input type="hidden" value="${param.flag }" name="flag"/>
			<table class= "mobile">
				<tr class= "pageheader" height="6%">
					<td colspan= "2">
						公告管理
					</td>
				</tr>
				<tr class= "pagesearch" height="5%">
					<td style= "text-align: left;">
						&nbsp;&nbsp;
						标题模糊查询：
						<input type= "text" name= "title" style= "width:100px;">
						<input type= "button" class= "btn" value= "查 询 " onClick= "search();" />
						&nbsp;&nbsp;
						<input type= "button" class= "btn" value= "新 增 " onClick= "add();" />						
					</td>
				</tr>
			</table>
			<iframe id= "query" name= "query" frameborder= "0" height= "88%"
				width= "100%" scrolling= "yes"></iframe>
		</form>
		<script>
		search();
		function search() {
			form1.action= "list.html";
			form1.submit();
		}

		function add(){
			MyWindow.OpenCenterWindow('edit.html','addOld',800,800);
		}
   </script>
	</body>
</html>
