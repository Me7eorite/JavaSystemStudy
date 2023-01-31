<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp"%>
<!DOCTYPE html>
<html>

<jsp:include page="inc/inc_jscss.jsp"></jsp:include>
<body>
	<div class="wrapper sticky_footer">
    	<!-- HEADER BEGIN -->
        <jsp:include page="inc/inc_head.jsp"></jsp:include>
    	<!-- HEADER END -->
        
        <!-- CONTENT BEGIN -->
        <div id="content">
        	<div class="inner">
        		<!-- 往下 此div是整个body页面的容器 -->
            	<div class="general_content">
				<div class="all_content">
                <div class="block_blog_1">
                   	<c:forEach items="${list }" var="listss">
                       	<article class="blog_post">
                           	<div class="tail"></div>
                           	<c:if test="${listss.pic!=null }">
                           	<div class="f_pic"><a href="ggShow.html?id=${listss.id }"><img style="width: 400px;" src="${ctx }/${listss.pic}" alt=""></a></div>
                           	</c:if>
                               <h4 class="title"><a href="ggShow.html?id=${listss.id }">${listss.title }</a></h4>
                               <div class="info">
                               	<div class="date"><p>${listss.showDate }</p></div>
                               </div>                                
                           </article>
                   	</c:forEach>
                </div>
                        
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

</html>