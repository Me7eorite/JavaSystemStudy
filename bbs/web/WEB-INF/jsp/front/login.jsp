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
                        <p class="general_title"><span>欢迎您登录我们的网站</span></p>
                        <div class="separator" style="height:39px;"></div>
                        
                        <div class="block_registration">
                        	<form id="form1" name="form1" action="#" class="w_validation" >
                            	<div class="col_1">
                                	<div class="label"><p>账号<span>*</span>:</p></div>
                                    <div class="field"><input type="text" class="req"  name="username"/></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:14px;"></div>
                                    
                                    <div class="label"><p>密码<span>*</span>:</p></div>
                                    <div class="field"><input type="password" class="req"  name="password"/></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:12px;"></div>
                                    
                                    <div class="label"><p>验证码<span>*</span>:</p></div>
                                    <div class="field" style="width: 110px;float: left;margin-left: 115px;">
	                                    	 <input style="width: 100px;float: left;" type="text"  name="yzm"/>
                                    </div>
                                    <img src="${ctx }/public/image/validateImg.html" onclick="this.src='${ctx }/public/image/validateImg.html?d='+Math.random();" id="checkCode"/>
                                </div>
                                <div class="clearboth"></div>
                                <div class="separator" style="height:32px;" id="showerror"></div>
		                        <div class="separator" style="height:32px;"></div>
                                <p class="info_text"><input type="button" class="general_button" value="点击登录" /></p>
                                <p class="info_text"><a href="register.html">您还没有账号了吗？请点击我注册吧</a></p>
                                <p class="info_text"><a href="find.html">忘记密码了吗?</a></p>
                                
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
	$(function(){
		$(".general_button").click(function(){
			if(isInit==false){
			return false;	
			}
			isInit=false;
			var username = $("input[name='username']").val();
			if(username==''){
				showMessage("showerror","error","请填写账号");
				return false;
			}
			var password = $("input[name='password']").val();
			if(password==''||password.length<6){
				showMessage("showerror","error","密码长度必须大于6位");
				return false;
			}
			var yzm = $("input[name='yzm']").val();
			if(yzm==''){
				showMessage("showerror","error","请输入验证码");
				return false;
			}
			$.post("${ctx}/front/save.html", $('#form1').serialize(), function(result) {
				result = eval("(" + result + ")");
				if (result.status == "true" || result.status == true) {
					//alert('登录成功');
					window.location.href='index.html';
				}else{
					if(result.msg=='1'){
						showMessage("showerror","error","验证码不正确，请重新输入");
						$("#checkCode").attr("src","${ctx }/public/image/validateImg.html?random="+Date.parse(new Date()));
						return false;
					}else if(result.msg=='2'){
						showMessage("showerror","error","用户名或密码错误");
						return false;
					}
				}
			});
			
		});
	
	});
</script>

</html>