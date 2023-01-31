<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../taglibs_front.jsp"%>
<div id="overlay"></div>
    <div id="login" class="block_popup">
    	<div class="popup">
        	<a href="#" class="close">Close</a>
            
            <div class="content">
            	<div class="title"><p>个人用户登录</p></div>
                
                <div class="form">
                	<form action="#" id="formapp"/>
                    	<div class="column">
                        	<p class="label">账号</p>
                            <div class="field"><input type="text" placeholder="您的账号"  value="" name="vp1"/></div>
                        </div>
                        
                        <div class="column">
                        	<p class="label">密码</p>
                            <div class="field"><input type="password" placeholder="您的密码" value="" name="vp2"/></div>
                        </div>
                        <div class="column">
                        	<p class="label">验证码</p>
                            <div class="field"><input type="text" placeholder="您的验证码" name="vp3"/></div>
                            <img src="${ctx }/public/image/validateImg.html" onclick="this.src='${ctx }/public/image/validateImg.html?d='+Math.random();" id="checkCodeapp"/>
                        </div>
                        
                        <div class="column button">
                            <a href="javascript:clopp();" class="enter"><span>登录</span></a>
                        </div>
                        
                        <div class="clearboth"></div>
                    </form>
                </div>
                
                <div class="subtitle"><p>个人用户登录</p>
                <div class="column_2">
                    <p class="forgot_pass"><a href="find.html">忘记密码了吗?</a></p>
                </div>
                </div>
                <div class="fb_button" id="oppLogin"></div>
            </div>
        </div>
    </div>
    <script>
    	var isInit=true;
	    function showMessage(v1,v2,v3){
			//第一个参数Id 第二个参数是分类 error success 第三个是内容
			$("#"+v1).after("<div style=\"display: none;\" id=\"showMessage\" class=\"general_info_box "+v2+"\"><a class=\"close\" href=\"#\">Close</a><p><b>说明:</b>"+v3+"</p></div>");
			$("#showMessage").slideDown();
			setTimeout(function(){
				$("#showMessage").slideUp(function(){
					isInit=true;
					$(".general_info_box").remove();
				});
			}, 1500);
		}
		
		function clopp(){
			if(isInit==false){
			return false;	
			}
			isInit=false;
			<%-- 
			var v1 = $("input[name='vp1']").val();
			var v1Out = checkEmail(v1);//调用
			if(v1Out==false){
				showMessage("oppLogin","error","请检查您的邮箱格式是否正确");
				return false;
			}--%>
			var v1 = $("input[name='vp1']").val();
			if(v1==''){
				showMessage("oppLogin","error","请填写账号");
				return false;
			}
			var v2 = $("input[name='vp2']").val();
			if(v2==''||v2.length<6){
				showMessage("oppLogin","error","密码长度必须大于6位");
				return false;
			}
			var v3 = $("input[name='vp3']").val();
			if(v3==''){
				showMessage("oppLogin","error","请输入验证码");
				return false;
			}
			$.post("${ctx}/front/save.html", {username:v1,password:v2,yzm:v3}, function(result) {
				result = eval("(" + result + ")");
				if (result.status == "true" || result.status == true) {
					alert('登录成功');
					window.location.href='index.html';
				}else{
					if(result.msg=='1'){
						showMessage("oppLogin","error","验证码不正确，请重新输入");
						$("#checkCodeapp").attr("src","${ctx }/public/validateImg.html?random="+Date.parse(new Date()));
						return false;
					}else if(result.msg=='2'){
						showMessage("oppLogin","error","用户名或密码错误");
						return false;
					}
				}
			});
		}
		
		
	function checkEmail(str){
    	var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
	    if(re.test(str)){
	        return true;
	    }else{
	        return false;
	    }
	}
	
	
	function GetRandomNum(Min,Max){   
		var Range = Max - Min;   
		var Rand = Math.random();   
		return(Min + Math.round(Rand * Range));   
	}
	
	function showLogin(){
		$('#overlay').show();
		$("#login").show(500);
	}   
    </script>