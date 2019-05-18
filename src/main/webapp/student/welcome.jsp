<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎页</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery.timers-1.2.js"></script>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-3 column">
			<div class="panel panel-info">
			    <div class="panel-heading">
			        <h3 class="panel-title">年/月/日</h3>
			    </div>
			    <div class="panel-body">
			       <span id="date"></span>
			    </div>
			</div>
		</div>
		<div class="col-md-3 column">
			<div class="panel panel-info">
			    <div class="panel-heading">
			        <h3 class="panel-title">时:分:秒</h3>
			    </div>
			    <div class="panel-body">
			        <span id="time"></span>
			    </div>
			</div>
		</div>
		<div class="col-md-6 column">
			<div class="media" style="margin-top: 15px;">
			  <div class="media-body">
			    <h4 class="media-heading">姓名：${student.studentName}</h4>
			    <p>亲爱的${student.studentName},美好的一天从这里开始吧！</p>
			    <p><a href="quitExam" class="btn btn-danger">退出系统</a></p>
			  </div>
			  <div class="media-right">
			    <img src="https://static.runoob.com/images/mix/img_avatar.png" class="media-object" style="width:60px">
			  </div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<c:forEach items="${types}" var="type">
			<div class="col-sm-6 col-md-3">
		         <div class="thumbnail">
		            <img src="../images/exam.jpg" 
		             alt="通用的占位符缩略图">
		            <div class="caption">
		                <h3>${type.typeName}</h3>
		                <p>
		                    <a href="getRandomSubjects?typeID=${type.typeID}" class="btn btn-primary" role="button">
		                        	考试
		                    </a> 
		                </p>
		            </div>
		         </div>
		    </div>
		</c:forEach>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		$('body').everyTime('1s',function(){
			var currentTime = new Date();
			$("#date").html(currentTime.getFullYear()+"/"+eval(currentTime.getMonth()+1)+"/"+currentTime.getDate());
			$("#time").html(currentTime.getHours()+":"+currentTime.getMinutes()+":"+currentTime.getSeconds());
		});
	});
</script>
</body>
</html>