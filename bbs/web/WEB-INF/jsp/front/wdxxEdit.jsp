<%@ page language="java" pageEncoding="UTF-8"%>

<%@taglib prefix="ckeditor" uri="http://ckeditor.com"%>
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
                        <p class="general_title"><span>发布帖子</span></p>
                        <div class="separator" style="height:39px;"></div>                        
                        <div class="block_registration">
                        	<form id="form1" name="form1" action="#" class="w_validation" >
                        		<input type="hidden" name="id" id="id" value="${map.id }">
                            	<div class="col_1" style="width: auto;float: none;">
                                	<div class="label"><p>标题<span>*</span>:</p></div>
                                    <div class="field">
                                    	<input  class="req" type="text" id="title" value="${map.title }" name="title" />
                                    </div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:14px;"></div>
                                    <div class="label"><p>图片<span>*</span>:</p></div>
                                    <div class="field"  style="height: 150px;">
                                    	<input  class="req" id="f_fileImg0" name="cmfile"
											onchange="triggerUploadImg0(this);" title="选择图片" type="file">
											<input class="text"  type="hidden" name="pic" id="bbbbbImg0"
											value="${map.pic }"> <c:if test="${map.pic!=null }">
												<img style='width:100px;' src="${ctx }/${map.pic}" id="aaaaaImg0" />
											</c:if>
                                    </div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:14px;"></div>    
                                    <div class="label"><p>内容<span>*</span>:</p></div>
                                    <div class="field" style="height: 500px;width: 700px;">
	                                    <textarea id="editor1"  class="req" rows="5" 
											cols="50" name="content">${map.content }</textarea><ckeditor:replace
											replace="editor1" basePath="${ctx }/resource/plugin/ckeditor/" />	
									</div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:12px;"></div>                                    
                                    <div class="label"><p>分类<span>*</span>:</p></div>
                                    <div class="field">
                                    	<select name="types" class="req" >
											<option ${map.types=='考研'?'selected':'' } value="考研">考研</option>
											<option ${map.types=='教育培训机构'?'selected':'' } value="教育培训机构">教育培训机构</option>
											<option ${map.types=='就业咨询'?'selected':'' } value="就业咨询">就业咨询</option>
											<option ${map.types=='公务员考试'?'selected':'' } value="公务员考试">公务员考试</option>
											<option ${map.types=='银行信用社'?'selected':'' } value="银行信用社">银行信用社</option>
											<option ${map.types=='事业单位'?'selected':'' } value="事业单位">事业单位</option>
											<option ${map.types=='国外深造'?'selected':'' } value="国外深造">国外深造</option>
											<option ${map.types=='创业天地'?'selected':'' } value="创业天地">创业天地</option>
										</select>
									</div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:12px;"></div>                                    
                                    <div class="label"><p>是否游客可见<span>*</span>:</p></div>
                                    <div class="field"><select name="nologin" class="req" >
											<option ${map.nologin=='yes'?'selected':'' } value="yes">是</option>
											<option ${map.nologin=='no'?'selected':'' } value="no">否</option>
										</select></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:12px;"></div>
                                    <div class="label"><p>版块<span>*</span>:</p></div>
                                    <div class="field"><select name="bkId" class="req">
										<c:forEach items="${rightBkList}" var="lists">
											<option ${map.bkId==lists.id?'selected':'' } value="${lists.id}">${lists.bkName}</option>
										</c:forEach>
									</select></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:12px;"></div>
                                </div>
                                
                                <div class="clearboth"></div>
                                <div class="separator" style="height:32px;" id="showerror"></div>
		                        <div class="separator" style="height:32px;"></div>
                                <p class="info_text"><input type="button" onclick="save(this);"  class="general_button" value="保存" /></p>
                                <p class="info_text"><input type="button" onclick="window.history.go(-1)"   class="general_button" value="返回" /></p>
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
		<jsp:include page="./inc/inc_foot.jsp"></jsp:include>
        <!-- FOOTER END -->
    </div>
    
    <!-- POPUP BEGIN -->
    <jsp:include page="./inc/inc_popup.jsp"/>
    <!-- POPUP END -->
</body>
<script type="text/javascript">

  	function save(src) {
	  	$("#editor1").val(CKEDITOR.instances.editor1.getData());
		$.post("wdxxEditSave.html", $("#form1").serializeArray(), function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('保存成功');
				window.location.reload();
			} else {
				alert('保存失败，请重试');
			}
		});
	}
  	
	function triggerUploadImg0(src) {
		$.ajaxFileUpload({
			url : '${ctx}/file/upload.json',
			secureuri : false,
			fileElementId : 'f_fileImg0',
			dataType : 'json',
			data : {
				fileloc : 'upload/',
				dir : 'temp'
			},
			success : function(data, status) {
				$("#bbbbbImg0").val(data.data.filepath);
				$("#aaaaaImg0").remove();
				$("#bbbbbImg0").after("<img  id='aaaaaImg0' style='width:100px;' src='${ctx}/"+data.data.filepath+"' />");
			},
			error : function(data, status, e) {
				alert('文件上传失败');
			}
		});
	}
	
  </script>

</html>