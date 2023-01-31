<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../admin/taglibs.jsp"%>
<!DOCTYPE html>
<html>

<jsp:include page="inc/inc_jscss.jsp"/>
<body>
	<div class="wrapper sticky_footer">
    	<!-- HEADER BEGIN -->
        <jsp:include page="inc/inc_head.jsp"/>
    	<!-- HEADER END -->
        
        <!-- CONTENT BEGIN -->
        <div id="content" class="right_sidebar">
        	<div class="inner" style="padding-bottom: 507px;">
            	<div class="general_content">
                	<div class="main_content">
                			<c:if test="${param.dpc!=1&&customerBean!=null&&customerBean.isft!='否' }">
						    	<a  href="wdxxEdit.html" class="general_button standart type_1">发布一条帖子</a>
						    </c:if>
	                   	<div class="block_blog_1">
	                   	<c:forEach items="${list}" var="listss">
                        	<article class="blog_post">
                            	<div class="tail"></div>
                            	<c:if test="${listss.pic!=null }">
                            	<div class="f_pic"><a href="wdxxShow.html?id=${listss.id }"><img style="width: 400px;" src="${ctx }/${listss.pic}" alt=""></a></div>
                            	</c:if>
                                <h4 class="title"><a href="wdxxShow.html?id=${listss.id }">${listss.title }<c:if test="${listss.zd=='是' }"><font color="red">置顶</font></c:if></a></h4>
                                <div class="info">
                                	<div class="date"><p>${listss.insertDate }</p></div>
                                	
                                	<c:if test="${param.dpc!=1 }">
									<a class="general_button standart type_2" href="##" onclick="deleteOne('${listss.id}');" role="button">删除</a>
									<a class="general_button standart type_5" href="wdxxEdit.html?id=${listss.id }" role="button">修改</a>
									</c:if>
                                </div>
                            </article>
	                   	</c:forEach>
	                   	</div>
	                 </div>
                    <jsp:include page="inc/inc_right.jsp"></jsp:include>
                    
                	<div class="clearboth"></div>
                </div>
            </div>
        </div>
    	<!-- CONTENT END -->
        
        <!-- FOOTER BEGIN -->
        <jsp:include page="inc/inc_foot.jsp"></jsp:include>
        <!-- FOOTER END -->
    </div>
    
    
    <!-- POPUP BEGIN -->
    <jsp:include page="inc/inc_popup.jsp"></jsp:include>
    <!-- POPUP END -->
</body>
<script type="text/javascript">	
	function deleteOne(id){
		if(!confirm("确定要删除吗?")){
			return false;
		}
		var params={id:id};
		$.post("wdxxDelete.html",params,function(
				result){
			result=eval("("+result+")");
			if(result.status=="true"||result.status==true){
				alert('成功');
			window.location.reload();
			}
		});
	}
</script>
</html>