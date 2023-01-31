<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<jsp:include page="./inc/inc_jscss.jsp"/>
<body>
<div class="wrapper sticky_footer">
	<jsp:include page="./inc/inc_head.jsp"/>
	<div id="content">
		<div class="inner">
			<div class="general_content">
				<div class="main_content">
					<p class="general_title">欢迎您注册我们的网站</p>
					<div class="separator" style="height:40px;"></div>
					<div class="block_registration">
						<form action="#" id="form1" name="form1" class="w_validation">
							<div class="col_1">
								<div class="label">账号<span>*</span>:</div>
								<div class="field"><input type="text" class="req" name="username" id="username"/></div>
								<div class="clearboth"></div>
								<div class="separator" style="height:14px;"></div>
								
								<div class="label">密码<span>*</span>:</div>
								<div class="field"><input type="password" class="req" name="password" id="password"/></div>
								<div class="clearboth"></div>
								<div class="separator" style="height:14px;"></div>
								
								<div class="label">手机:</div>
								<div class="field"><input type="text" name="phone" id="phone"/></div>
								<div class="clearboth"></div>
								<div class="separator" style="height:14px;"></div>
								
								<div class="label">年龄:</div>
								<div class="field"><input type="text" name="age" id="age"/></div>
								<div class="clearboth"></div>
								<div class="separator" style="height:14px;"></div>
								
								<div class="label">身份证:</div>
								<div class="field"><input type="text" name="idcard" id="idcard"/></div>
								<div class="clearboth"></div>
								<div class="separator" style="height:14px;"></div>
								
								<div class="label">您的出生地:</div>
								<div class="field"><input type="text" name="mb1" id="mb1"/></div>
								<div class="clearboth"></div>
								<div class="separator" style="height:14px;"></div>
								
								<div class="label">您最喜欢的人:</div>
								<div class="field"><input type="text" name="mb2" id="mb2"/></div>
								<div class="clearboth"></div>
								<div class="separator" style="height:14px;"></div>
								
								<div class="label">您最喜欢的地方:</div>
								<div class="field"><input type="text" name="mb3" id="mb3"/></div>
								<div class="clearboth"></div>
								<div class="separator" style="height:14px;"></div>
								
								<div class="label">验证码:</div>
								<div class="field" style="width:110px;float:left;margin-left:75px;">
									<input type="text" name="yzm" id="yzm" style="width:100px;float:left;"/>
								</div>
								<img alt="验证码" src="${ctx}/public/image/validateImg.html" onclick="this.src='${ctx}/public/image/validateImg.html?d='+Math.random();" id="checkCode" />
								
							</div>
							
							
							
							<div class="col_2">
								<div class="label">姓名:</div>
								<div class="field"><input type="text" name="name" id="name"/></div>
								<div class="clearboth"></div>
								<div class="separator" style="height:14px;"></div>
								
								<div class="label">确认密码<span>*</span>:</div>
								<div class="field"><input type="password" class="req" name="password2" id="password2"/></div>
								<div class="clearboth"></div>
								<div class="separator" style="height:14px;"></div>
								
								<div class="label">性别:</div>
								<div class="field">
									<select name="sex" class="form-control">
										<option value="男">男</option>
										<option value="女">女</option>
									</select>
								</div>
								<div class="clearboth"></div>
								<div class="separator" style="height:14px;"></div>
								
								<div class="label">家庭住址:</div>
								<div class="field"><input type="text" name="address" id="address"/></div>
								<div class="clearboth"></div>
								<div class="separator" style="height:14px;"></div>
								
								<div class="label">头像:</div>
								<div class="field" style="height:200px;">
									<input class="form-control" id="f_fileImg0" name="cmfile" onchange="triggerUploadImg0(this);" title="选择图片" type="file">
									<input class="text" type="hidden" name="headPic" id="bbbbbImg0">
								</div>
								<div class="clearboth"></div>
								<div class="separator" style="height:14px;"></div>
							</div>
							
							<p class="info_text"><input type="button" class="general_button" value="点击注册"></p>
						
						</form>
					</div>
				</div>
			</div>
		
		</div>
	</div>
	
	<jsp:include page="inc/inc_foot.jsp"></jsp:include>
</div>
	
</body>

<script type="text/javascript">
	/**注册*/
	$(function(){
		$(".general_button").click(function(){
			var username = $("input[name='username']").val();
			if(username==''){
				alert("请填写账号");
				return false;
			}
			
			var password = $("input[name='password']").val();
			if(password==''||password.length<6){
				alert("密码长度必须大于6位");
				return false;
			}
			
			var password2 = $("input[name='password2']").val();
			if(password!=password2){
				alert("两次密码输入不一致");
				return false;
			}
			
			var phone = $("input[name='phone']").val();
			if(phone!=""){
				if(!checkMobile(phone)){
					alert("请输入正确的11位手机号");
					return false;
				}				
			}			

			var yzm = $("input[name='yzm']").val();
			if(yzm==''){
				alert("请输入验证码");
				return false;
			}
			
			
			//提交注册
			$.post("${ctx}/front/registerSave.html",$("#form1").serialize(),function(result){
				result = eval("("+result+")");
				if(result.status=="true"||result.status==true){
					alert("注册成功");
					window.location.href="index.html";
				}else{
					if(result.msg=='1'){
						alert("验证码不正确，请重新输入");
						$("#checkCode").attr("src","${ctx}/public/image/validateImg.html?d="+Math.random());
					}else if(result.msg=='2'){
						alert("该用户已存在");
					}
				}
			});
		});
	});

	/**上传头像*/
	function triggerUploadImg0(src){
		$.ajaxFileUpload({
			url:"${ctx}/file/upload.json",
			secureuri:false,
			fileElementId:"f_fileImg0",
			dataType:"json",
			data:{
				fileloc:"upload/",
				dir:"temp"
			},
			success:function(data,status){
				$("#bbbbbImg0").val(data.data.filepath);
				$("#aaaaaImg0").remove();
				$("#bbbbbImg0").after("<img id='aaaaaImg0' style='width:100px;' src='${ctx}/"+data.data.filepath+"' />");
			},
			error:function(data,status,e){
				alert("文件上传失败");
			}
		});
	}
	
	/**验证手机号*/
	function checkMobile(str){
		var re=/^1\d{10}$/
		if(re.test(str)){
			return true;
		}else{
			return false;
		}
	}
	
</script>
</html>