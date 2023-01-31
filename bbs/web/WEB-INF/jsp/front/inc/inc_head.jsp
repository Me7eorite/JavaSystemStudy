<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../taglibs_front.jsp"%>
  <header>
      <div id="header">
      	<section class="bottom">
          	<div class="inner">
              	<div id="logo_top"><a href="index.html"></a></div>
                  
                  <div class="block_today_date">
                  	<div class="num"><p id="num_top" /></div>
                      <div class="other">
                      	<p class="month_year"><span id="month_top"></span>, <span id="year_top"></span></p>
                          <p id="day_top" class="day" />
                      </div>
                  </div>
                  
                  <div class="fr">
                  <%--
                  	<div class="block_languages">
                      	<div class="text"><p>Language:</p></div>
                          <ul>
                          	<li class="current"><a href="#" class="eng">English</a></li>
                              <li><a href="#" class="french">French</a></li>
                              <li><a href="#" class="ger">German</a></li>
                          </ul>
                          
                          <div class="clearboth"></div>
                      </div>
                       --%>
                      <div class="block_search_top mine_block_top_menu">
                      <c:if test="${customerBean!=null }">
                      <p><img src="${ctx }/${customerBean.headPic }" style="height: 30px;"> <span>${customerBean.username }(${customerBean.phone })</span></p>
                     </c:if>
                      <ul>
                      <c:choose>
			         	<c:when test="${customerBean!=null }">
                          	<li><a href="wdxxList.html">我的帖子</a></li>
			         		<li><a href="mine.html" >个人信息</a></li>
			         		<li><a href="out.html">注销</a></li>
			         	</c:when>
			         	<c:otherwise>
			         		<li><a href="login.html">登录</a></li>
			            	<li><a href="register.html" >注册</a></li>
			         	</c:otherwise>
			         </c:choose>
                      </ul>
                      </div>
                      
                      <div class="clearboth"></div>
                  </div>
              </div>
              
          </section>
          
          <section class="section_main_menu">
          	<div class="inner">
              	<nav class="main_menu">
				  <ul>
					<li class="big_dropdown"><a href="index.html">首页</a></li>
				  	<li class="big_dropdown"><a href="luntan.html">论坛中心</a></li>
				  	<li class="big_dropdown"><a href="gg.html">公告</a></li>
				  	<li class="big_dropdown"><a href="ltgz.html">网站说明</a></li>
				  	<li class="big_dropdown"><a href="contact.html">意见反馈</a></li>
				  </ul>
				</nav>
			</div>
          </section>
          
          <section class="section_big_dropdown">
          	<div class="inner">
                  <div class="block_big_dropdown" data-menu="technology">
                  	<div class="content">
                      	<div class="image">
                          	<a href="blog_post.html" class="pic"><img src="${ctx}/resource/front/images/pic_big_drop_5.jpg" alt="" /></a>
                              <p><a href="blog_post.html">Simply dummy text of the printing.</a></p>
                          </div>
                          <div class="line"></div>
                          
                          <div class="image">
                          	<a href="blog_post.html" class="pic"><img src="${ctx}/resource/front/images/pic_big_drop_6.jpg" alt="" /></a>
                              <p><a href="blog_post.html">Internet tend to repeat predefined chunks.</a></p>
                          </div>
                          <div class="line"></div>
                          
                          <div class="popular_posts">
                          	<div class="title"><p>Popular Posts</p></div>
                              <ul>
                              	<li><a href="blog_post.html"><span>11 July, 2012</span>Publishing packages and web page</a></li>
                                  <li><a href="blog_post_w_slider.html"><span>08 July, 2012</span>Generators on the Internet tend to repeat.</a></li>
                                  <li><a href="blog_post_w_video.html"><span>05 July, 2012</span>Anything embarrassing hidden in the middle.</a></li>
                                  <li><a href="blog_post.html"><span>01 July, 2012</span>Words which don't look even slightly.</a></li>
                              </ul>
                          </div>
                          <div class="line"></div>
                          
                          <div class="more">
                          	<div class="title"><p>More In Tech</p></div>
                              <ul>
                              	<li><a href="#">Web Development</a></li>
                                  <li><a href="#">Programming</a></li>
                                  <li><a href="#">Techique</a></li>
                                  <li><a href="#">Cars</a></li>
                              </ul>
                          </div>
                          
                          <div class="clearboth"></div>
                      </div>
                  </div>
              </div>
        	</section>
      </div>
  </header>