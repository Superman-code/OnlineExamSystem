<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>考试结果</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" style="margin-top: 15px;">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="jumbotron">
				<h1>
					考试情况表
				</h1>
				<div class="row clearfix">
					<div class="col-md-6 column">
						<p>
							<c:choose>
								<c:when test="${student.result<60}">
									<div class="panel panel-danger">
									    <div class="panel-heading">
									        <h3 class="panel-title">考生姓名：${student.studentName}</h3>
									    </div>
									    <div class="panel-body">
									    	考生得分：${student.result}
									    </div>
									</div>
								</c:when>
								<c:when test="${student.result<80}">
									<div class="panel panel-warning">
									    <div class="panel-heading">
									        <h3 class="panel-title">考生姓名：${student.studentName}</h3>
									    </div>
									    <div class="panel-body">
									    	考生得分：${student.result}
									    </div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="panel panel-success">
									    <div class="panel-heading">
									        <h3 class="panel-title">考生姓名：${student.studentName}</h3>
									    </div>
									    <div class="panel-body">
									    	考生得分：${student.result}
									    </div>
									</div>
								</c:otherwise>
							</c:choose>
						</p>
					</div>
				</div>
				<p><a href="showAnswer.jsp" class="btn btn-primary btn-lg">
			         查看答案</a>
			         <a href="getRandomSubjects" class="btn btn-primary btn-lg">
			         重新考试</a>
			         <a href="${pageContext.request.contextPath}/student/welcome.jsp" class="btn btn-primary btn-lg">
			         返回首页</a>
			         <a href="quitExam" class="btn btn-primary btn-lg">
			         退出系统</a>
			    </p>
			</div>
		</div>
	</div>
</div>
</body>
</html>