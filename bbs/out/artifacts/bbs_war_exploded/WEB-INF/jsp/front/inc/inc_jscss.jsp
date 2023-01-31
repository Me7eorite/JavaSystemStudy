<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>

<%--<%@ page language="java" errorPage="/WEB-INF/jsp/error.jsp" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>--%>
<%@ include file="/WEB-INF/jsp/front/taglibs_front.jsp"%>

<head>
<title>应届毕业生论坛</title>
<meta name="viewport" content="width=device-width" />

<!-- [if lt IE 9]>
<script type="text/javascript" src="${ctx}/resource/front/layout/plugins/html5.js"></script>
<![endif]-->

<link rel="styleSheet" href="${ctx}/resource/front/layout/style.css" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/front/layout/js/jquery.js"></script>

<link rel="styleSheet" href="${ctx}/resource/front/layout/plugins/prettyphoto/css/prettyPhoto.css" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/front/layout/plugins/prettyphoto/jquery.prettyPhoto.js"></script>

<script type="text/javascript" src="${ctx}/resource/front/layout/plugins/tools/jquery.tools.min.js"></script>

<link rel="styleSheet" href="${ctx}/resource/front/layout/plugins/calendar/calendar.css" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/front/layout/plugins/calendar/calendar.js"></script>

<script type="text/javascript" src="${ctx}/resource/front/layout/plugins/scrollto/jquery.scroll.to.min.js"></script>

<link rel="styleSheet" href="${ctx}/resource/front/layout/plugins/video-audio/mediaelementplayer.css" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/front/layout/plugins/video-audio/mediaelement-and-player.js"></script>

<link rel="styleSheet" href="${ctx}/resource/front/layout/plugins/flexslider/flexslider.css" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/front/layout/plugins/flexslider/jquery.flexslider-min.js"></script>

<link rel="styleSheet" href="${ctx}/resource/front/layout/plugins/ibuttons/css/jquery.ibutton.css" type="text/css" />
<script type="text/javascript" src="${ctx}/resource/front/layout/plugins/ibuttons/lib/jquery.ibutton.min.js"></script>

<script type="text/javascript" src="${ctx}/resource/front/layout/plugins/ajaxform/jquery.form.js"></script>

<script type="text/javascript" src="${ctx}/resource/front/layout/js/main.js"></script>

<script type="text/javascript" src="${ctx}/resource/admin/js/ajaxfileupload.js"></script>
    <script>
        function checkIsLogin() {
            var out = false;
            $.ajax({
                type: "POST",
                async: false,
                cache: false,
                url: "${ctx}/front/checkIsLogin.html",
                data:{id:1},
                success: function (result) {
                    result = eval("("+result+")");
                    if(result.status === 'true' || result.status === true){
                        out = true;
                    }else{
                        out=false;
                    }
                }
            });
            return out;
        }
    </script>

</head>

