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
                       	<article class="blog_post">
                           	<div class="tail"></div>
                           	<c:if test="${map.pic!=null }">
                           	<div class="f_pic"><a href="##"><img style="width: 400px;" src="${ctx }/${map.pic}" alt=""></a></div>
                           	</c:if>
                               <h4 class="title"><a href="##">${map.title }</a></h4>
                               <div class="info">
                               	<div class="date"><p>${map.insertDate }</p></div>
                               </div>
                               <div class="content">
                               	<p>${map.content }</p>
                               </div> 
                           </article>
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

</html>