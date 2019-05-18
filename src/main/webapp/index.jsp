<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.toggle-password.js"></script>
</head>
<body>
<div class="container" style="margin-top: 15px;">
	<div class="row clearfix" style="margin-bottom: 15px;">
		<div class="col-md-12 column">
			<div class="carousel slide" id="carousel-24258">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-24258">
					</li>
					<li data-slide-to="1" data-target="#carousel-24258">
					</li>
					<li data-slide-to="2" data-target="#carousel-24258">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="images/img1.jpg" style="width: 100%;height: 350px" />
						<div class="carousel-caption">
							<h4>
								First Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="images/img2.jpg" style="width: 100%;height: 350px"/>
						<div class="carousel-caption">
							<h4>
								Second Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="images/img3.jpg" style="width: 100%;height: 350px" />
						<div class="carousel-caption">
							<h4>
								Third Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-24258" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-24258" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-6 column">
			<div class="jumbotron">
		        <h1>欢迎登陆页面！</h1>
		        <p>1.教师录入考试题目以及答案信息</p>
		        <p>2.学生参加考试并自动评分和查看正确答案</p>
		        <p>3.教师查看学生考试成绩</p>
		   </div>
		</div>
		<div class="col-md-6 column">
			<h3 style="margin-bottom: 15px;">教师(学生)登录 <span class="label label-default">必填</span></h3>
			<c:choose>
				<c:when test="${empty error}"></c:when>
				<c:otherwise>
					<div class="alert alert-danger alert-dismissable">
			            <button type="button" class="close" data-dismiss="alert"
			                    aria-hidden="true">
			                &times;
			            </button>
			           ${error}
			        </div>
				</c:otherwise>
			</c:choose>
			<form class="form-horizontal" action="login" method="post">
			
			  <div class="form-group">
			    <label class="col-sm-2 control-label">编号</label>
			    <div class="col-sm-10">
			      <input type="text" name="id" class="form-control" placeholder="请输入编号">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-10">
			      <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码">
			    </div>
			  </div>
			  
			  <div class="form-group">
			      <label class="checkbox-inline pull-right">
			        <input type="checkbox" id="togglePassword">显示密码
			      </label>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">登录角色</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">
			        <input type="radio" name="role" value="student" checked> 学生
			      </label>
			      <label class="radio-inline">
			        <input type="radio" name="role" value="teacher"> 教师
			      </label>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">登录</button>
			      <button type="reset" class="btn btn-default">重置</button>
			    </div>
			  </div>
			  
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		$("#password").togglePassword({
			el: "#togglePassword"
		});
	});
</script>
</body>
</html>