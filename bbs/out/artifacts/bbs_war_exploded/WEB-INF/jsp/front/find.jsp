<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="./taglibs_front.jsp"%>
<!DOCTYPE html>
<html>

<jsp:include page="./inc/inc_jscss.jsp"/>

<body>
	<div class="wrapper sticky_footer">
    	<!-- HEADER BEGIN -->
        <jsp:include page="./inc/inc_head.jsp"/>
    	<!-- HEADER END -->
        
        <!-- CONTENT BEGIN -->
        <div id="content" class="">
        	<div class="inner">
            	<div class="general_content">
                	<div class="main_content">
                        <p class="general_title"><span>找回密码</span></p>
                        <div class="separator" style="height:39px;"></div>
                        
                        <div class="block_registration">
                        	<form id="form1" name="form1" action="#" class="w_validation" >
                            	<div class="col_1">
                                	<div class="label"><p>账号<span>*</span>:</p></div>
                                    <div class="field"><input type="text" class="req" name="username"/></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:14px;"></div>
                                    
                                    <div class="label"><p>你的出生地（密保一）<span>*</span>:</p></div>
                                    <div class="field"><input type="text" class="req" name="mb1"/></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:12px;"></div>
                                    
                                    <div class="label"><p>你最喜欢的人（密保二）<span>*</span>:</p></div>
                                    <div class="field"><input type="text" class="req" name="mb2"/></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:12px;"></div>
                                    
                                    <div class="label"><p>你最喜欢的地方（密保三）<span>*</span>:</p></div>
                                    <div class="field"><input type="text" class="req" name="mb3"/></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:12px;"></div>
                                    
                                </div>
                                
                                <div class="clearboth"></div>
                                <div class="separator" style="height:32px;" id="showerror"></div>
		                        <div class="separator" style="height:32px;"></div>
                                <p class="info_text"><input type="button" class="general_button" value="找回" /></p>
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
		<jsp:include page="inc/inc_foot.jsp"/>
        <!-- FOOTER END -->
    </div>
    
    <!-- POPUP BEGIN -->
    <jsp:include page="inc/inc_popup.jsp"/>
    <!-- POPUP END -->
</body>
<script type="text/javascript">
	$(function(){
		$(".general_button").click(function(){
			var username = $("input[name='username']").val();
			var mb1 = $("input[name='mb1']").val();
			var mb2 = $("input[name='mb2']").val();
			var mb3 = $("input[name='mb3']").val();
			if (username === '' || mb1 === ''|| mb2 === ''|| mb3 === '') {
				alert("用户名和密保必须填写");
				return false;
			}
			$.post("${ctx}/front/findSave.html", $('#form1').serialize(), function(result) {
				result = eval("(" + result + ")");
				if (result.status === "true" || result.status === true) {
					var sex=prompt("请输入密码",'您的新密码');
					loginConfirm(sex);
				}else{
					alert('该账户密保填写错误，请重试');
				}
			});
			
		});
	
	});
	
	/**
	*保存新密码
	*/
	function loginConfirm(password) {
		var username = $("input[name='username']").val();
		var aa = "${ctx}/front/findSaveConfirm.html";
		$.ajax({
			type : "POST",
			async : false, // 设置同步方式
			cache : false,
			url : aa,
			data : {username:username,password:password},
			success : function(result) {
				result = eval("(" + result + ")");
				if (result.status == 'true' || result.status == true) {
					alert('修改成功');
					window.parent.location.href="index.html";
				}else{
					alert('修改失败');
				}
			}
		});
	}	
		
</script>

</html>