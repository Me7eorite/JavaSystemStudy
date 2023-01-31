<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../admin/taglibs.jsp"%>
<!DOCTYPE html>
<html>

<jsp:include page="./inc/inc_jscss.jsp"/>
<body>
	<div class="wrapper sticky_footer">
    	<!-- HEADER BEGIN -->
        <jsp:include page="inc/inc_head.jsp"/>
    	<!-- HEADER END -->
        
        <!-- CONTENT BEGIN -->
        <div id="content">
        	<div class="inner">
        		<!-- 往下 此div是整个body页面的容器 -->
            	<div class="general_content">
				<div class="all_content">
                        <!-- 产品简介开始 -->
                        <div class="block_special_topic">
                        	<div class="type"><p>推荐帖子</p></div>
                            <div class="title"><p></p></div>
                        </div>
                        <div class="main_content">
                        <div class="separator" style="height:30px;"></div>
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
                                    <div class="author"><p>发布者: <a href="#">${listss.customerName }</a></p></div>
                                    
                                    <div class="r_part">
                                    	<div class="category">
                                        	<p class="text">分类:</p>
                                            <ul>
                                            	<li><a href="luntan.html?bkId=${listss.bkId }">${listss.bkName }</a></li>
                                            </ul>
                                        </div>
                                        
                                        <a href="#" class="views" onclick="zan('${map.id}');">${listss.zan }</a>
                                        
                                    </div>
                                </div>
                            </article>
	                   	</c:forEach>
	                   	</div>
                    </div>
                        <!-- 产品简介结束 -->
                    </div>       		
                	<div class="clearboth"></div>
                </div>
                <!-- 往上，此div是整个body的容器 -->
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
function zan(id) {
		if(!checkIsLogin()){
			alert('请先登录');
			window.location.href='${ctx}/front/login.html';
			return false;
		}
		$.post("zanSave.html", {id:id}, function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('点赞成功');
				window.location.reload();
			} else {
				alert('保存失败，请重试');
			}
		});
	}
</script>
</html>