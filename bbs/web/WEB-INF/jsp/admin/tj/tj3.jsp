<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="../taglibs.jsp"%>
<script type="text/javascript" src="${ctx }/resource/jquery-1.8.3.min.js"></script>
<html><body><div id="container" style="width:100%; margin: 0 auto;"></div></body>
<script src="${ctx }/resource/highcharts.js"></script>
<script type="text/javascript">
	Highcharts.chart('container', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: ''
	    },
	    subtitle: {
	        text: '点赞次数排行统计（取前10名）'
	    },
	    xAxis: {
	        categories: [${aa}],
	        crosshair: true
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: '次数'
	        }
	    },
	    tooltip: {
	        headerFormat: '',
	        pointFormat: '次数',
	        footerFormat: '',
	        shared: true,
	        useHTML: true
	    },
	    plotOptions: {
	        column: {
	            pointPadding: 0.2,
	            borderWidth: 0
	        }
	    },
	    series: [${a}]
	});
</script>
</html>
