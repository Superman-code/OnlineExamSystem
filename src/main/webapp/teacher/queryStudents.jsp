<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生成绩</title>
</head>
<body>
<div class="container" style="margin-top: 50px;">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<%@ include file="navigator.jsp" %>
		</div>
		<div class="col-md-8 column">
			<ul class="nav nav-pills">
				<li class="active"><a style="cursor: default;">学生成绩</a></li>
			</ul>
			<hr>
			<form class="form-horizontal" action="queryStudentsBySclass" method="post">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">班级名称</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="sclass" placeholder="请输入班级名称">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">查询</button>
			      <button type="reset" class="btn btn-default">重置</button>
			    </div>
			  </div>
			</form>
		</div>
	</div>
</div>
</body>
</html>