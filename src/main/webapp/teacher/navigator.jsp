<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<ul class="nav nav-pills nav-stacked">
	<li class="active"><a href="index.jsp">科目管理</a></li>
	<li><a href="addType.jsp">录入科目</a></li>
	<li><a href="queryAllType">管理科目</a></li>

	<li class="active"><a href="index.jsp">试题管理</a></li>
	<!-- 这里的active属性就是使得所在的li的背景色变为蓝色-->
	<li><a href="subjectAdd.jsp">录入试题</a></li>
	<li><a href="subjectManage_queryAll">管理试题</a></li>
	<li><a href="querySubject.jsp">查询试题</a></li>
	
	<li class="active"><a href="index.jsp">学生管理</a></li>
	<li><a href="queryStudent.jsp">通过姓名查找学生成绩</a></li>
	<li><a href="queryStudents.jsp">查找某班级全部学生成绩</a></li>
	
	<li class="active"><a href="${pageContext.request.contextPath}/index.jsp">退出系统</a></li>
</ul>
</body>
</html>