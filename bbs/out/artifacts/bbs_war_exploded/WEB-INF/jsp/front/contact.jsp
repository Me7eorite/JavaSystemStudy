<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/taglibs_front.jsp"%>
<%@taglib prefix="ckeditor" uri="http://ckeditor.com"%>
<!DOCTYPE html>
<html>

<jsp:include page="inc/inc_jscss.jsp"></jsp:include>

<body>
	<div class="wrapper sticky_footer">
    	<!-- HEADER BEGIN -->
        <jsp:include page="inc/inc_head.jsp"></jsp:include>
    	<!-- HEADER END -->
        
        <!-- CONTENT BEGIN -->
        <div id="content" class="">
        	<div class="inner">
            	<div class="general_content">
                	<div class="main_content">
                        <p class="general_title"><span>反馈信息</span></p>
                        <div class="separator" style="height:39px;"></div>
                        
                        <div class="block_registration">
                        	<form id="registerFormcustomer" name="registerFormcustomer" action="#" class="w_validation" >
                        		<div class="label"><p>标题<span>*</span>:</p></div>
                                    <div class="field">
                                    	<input  class="req" type="text" id="title" value="" name="title" />
                                    </div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:14px;"></div>
                        	
                        	
                            	<div class="col_1" style="width: auto;float: none;">
                                    <div class="label"><p>内容<span>*</span>:</p></div>
                                    <div class="field" style="height: 80px;">
                                    	<textarea  class="req" rows="5" cols="50"  name="content"  ></textarea>
                                    </div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:12px;"></div>
                                </div>
                                
                                <div class="clearboth"></div>
                                <div class="separator" style="height:32px;" id="showerror"></div>
		                        <div class="separator" style="height:32px;"></div>
                                <p class="info_text"><input type="button" onclick="mineSave(this);"  class="general_button" value="提交" /></p>
                                <div class="fb_button"><a href="#"><img src="${ctx }/resource/front/images/button_fb_login.png" alt="" /></a></div>
                            </form>
                        </div>
                        <div class="line_3" style="margin:42px 0px 0px;"></div>
                    </div>
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
function mineSave(){
	if(!checkIsLogin()){
		alert('请先登录');
		window.location.href='${ctx}/front/login.html';
		return false;
	}
	$.ajax({
      type: "POST",
      async:false,  // 设置同步方式
      cache:false,
      url: "${ctx}/front/contactSave.html",
		data:$("#registerFormcustomer").serializeArray(),
		success:function(result){
		result = eval("("+result+")");
		if(result.status=='true'||result.status==true){
			alert('反馈成功');
			window.location.reload();
		}
      }
	});
}
</script>
</html>