<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../taglibs_front.jsp"%>
<div class="sidebar">
                        
                        <div class="block_sidebar_menu">
                        	<h4>分类</h4>
                            <ul>
                            <c:forEach items="${rightBkList}" var="lists">
                         		<li><a href="luntan.html?bkId=${lists.id }">${lists.bkName }</a></li>
                         	</c:forEach>
							</ul>
                            <div class="line_2"></div>
                        </div>
                        <div class="separator" style="height:31px;"></div>
                    </div>