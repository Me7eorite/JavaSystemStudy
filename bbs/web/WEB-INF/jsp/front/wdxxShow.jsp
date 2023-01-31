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
        <div id="content">
        	<div class="inner">
        		<!-- 往下 此div是整个body页面的容器 -->
            	<div class="general_content">
				<div class="all_content">
                        <div class="block_special_topic">
                        	<div class="type"><p>帖子详细</p></div>
                            <div class="title"><p></p></div>
                        </div>
                        <div class="main_content">
                        <div class="separator" style="height:30px;"></div>
                        <div class="block_blog_1">
                        	<article class="blog_post">
                            	<div class="tail"></div>
                            	<c:if test="${map.pic!=null }">
                            	<div class="f_pic"><a href="##"><img style="width: 400px;" src="${ctx }/${map.pic}" alt=""></a></div>
                            	</c:if>
                                <h4 class="title"><a href="##">${map.title }<c:if test="${map.zd=='是' }"><font color="red">置顶</font></c:if></a></h4>
                                <div class="info">
                                	<div class="date"><p>${map.insertDate }</p></div>
                                    <div class="author"><p>发布者: <a href="#">${map.customerName }</a></p></div>
                                    
                                    <div class="r_part">
                                    	<div class="category">
                                        	<p class="text">分类:</p>
                                            <ul>
                                            	<li><a href="luntan.html?bkId=${map.bkId }">${map.bkName }</a></li>
                                            </ul>
                                        </div>
                                        
                                        <a href="#" class="views" onclick="zan('${map.id}');">${map.zan }赞</a>
                                    </div>
                                </div>
                                <div class="content">
                                	<p>${map.content }</p>
                                </div> 
                            </article>
	                   	</div>
                    </div>
                    
                    <div class="block_comments">
						<h2>评论</h2>
						<c:forEach items="${list }" var="lists">
							<li class="list-group-item">${lists.customerName }:${lists.content }(${lists.insertDate })</li>
						
							<div class="comment">
								<div class="userpic"><a href="#"><img style="width: 50px;" src="${ctx }/${lists.headPic}" alt=""></a></div>
								<div class="content">
									<p class="name"><a href="#">${lists.customerName }</a></p>
									<p class="info"><span class="date">${lists.insertDate }</span></p>
									<p class="text">${lists.content }</p>
								</div>
								<div class="clearboth"></div>
								<div class="line_3"></div>
							</div>
						</c:forEach>
					</div>
					
					<c:if test="${customerBean!=null&&customerBean.ispl!='否' }">
						<div class="separator" style="height:30px;"></div>
						<div class="block_leave_reply">
							<h3>留言</h3>
							<form class="w_validation" action="#" id="form1">
							<input type="hidden" name="wdxxId" value="${map.id }"/>
								<p>内容</p>
								<div class="textarea"><textarea cols="1" rows="1" name="content"></textarea></div>
								<input type="button" onclick="save(this);"  class="general_button" onclick="save(this);"  value="发表评论">
							</form>
						</div>
					</c:if>
                    
                        <!-- 产品简介结束 -->
                    </div>       		
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

/**
 * 评论提交
 */
 function save(src){
	if(!checkIsLogin()){
		alert('请先登录');
		window.location.href='${ctx}/front/login.html';
		return false;
	}
	$.post("pinglunSave.html", $("#form1").serializeArray(), function(result) {
		result = eval("(" + result + ")");
		if (result.status == "true" || result.status == true) {
			alert('评论成功');
			window.location.reload();
		} else {
			alert('评论失败，请重试');
		}
	});
}

</script>
</html>