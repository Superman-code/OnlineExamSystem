<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>试题信息</title>
</head>
<body>
<div class="container" style="margin-top: 50px;">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<%@ include file="navigator.jsp" %>
		</div>
		<div class="col-md-8 column">
			<ul class="nav nav-pills">
				<li class="active"><a style="cursor: default;">试题信息</a></li>
			</ul>
			<hr>
			<div class="panel panel-info">
			    <div class="panel-heading">面板标题</div>
			    <table class="table">
			        <tr><td>试题编号：</td><td>${requestScope.subject.subjectID}</td></tr>
			        <tr><td>试题题目：</td><td>${requestScope.subject.subjectTitle}</td></tr>
			        <tr><td>选项A：</td><td>${requestScope.subject.subjectOptionA}</td></tr>
			        <tr><td>选项B：</td><td>${requestScope.subject.subjectOptionB}</td></tr>
			        <tr><td>选项C：</td><td>${requestScope.subject.subjectOptionC}</td></tr>
			        <tr><td>选项D：</td><td>${requestScope.subject.subjectOptionD}</td></tr>
			        <tr><td>答案：</td><td>${requestScope.subject.subjectAnswer}</td></tr>
			        <tr><td>科目编号：</td><td>${requestScope.subject.typeID}</td></tr>
			        <tr><td>答案解析：</td><td>${requestScope.subject.subjectParse}</td></tr>
			    </table>
			</div>
		</div>
	</div>
</div>
</body>
</html>