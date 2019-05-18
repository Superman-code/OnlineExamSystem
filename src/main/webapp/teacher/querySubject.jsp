<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询试题</title>
</head>
<body>
<div class="container" style="margin-top: 50px;">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<%@ include file="navigator.jsp" %>
		</div>
		<div class="col-md-8 column">
			<form action="querySubject" method="post">
			  <div class="form-group">
			    <label>试题题目</label>
			    <input type="text" class="form-control" placeholder="请输入试题题目" name="subjectTitle">
			  </div>
			  <div style="text-align: center;">
			  	<button type="submit" class="btn btn-default">查询</button>
			  	<button type="reset" class="btn btn-default">重置</button>
			  </div>
			</form>
		</div>
	</div>
</div>
</body>
</html>