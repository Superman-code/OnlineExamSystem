<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>试题答案</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" style="margin-top: 15px;margin-bottom: 15px">
	<div class="row clearfix">
		<div class="col-md-6 column">
			<div class="panel panel-info">
			    <div class="panel-heading">
			        <h3 class="panel-title">考试时间</h3>
			    </div>
			    <div class="panel-body">
			    	<span id="totalTime"></span>分钟
			    </div>
			</div>
		</div>
		<div class="col-md-6 column">
			<div class="panel panel-primary">
			    <div class="panel-heading">
			        <h3 class="panel-title">考生：${student.studentName}</h3>
			    </div>
			    <div class="panel-body">
			    	<a href="examResult.jsp">返回考试结果页面</a>
			    </div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="panel panel-info">
			    <div class="panel-heading">
			        <h3 class="panel-title">选择题(每小题5分，共20个)</h3>
			    </div>
			    <div class="panel-body">
			    	<form action="submitExam" method="post" class="form-horizontal">
			    		<c:forEach items="${subjects}" var="subject" varStatus="status">
				    		<div class="form-group" style="margin-left: 22px;">
					    		<h4>第${status.index+1}题&nbsp;&nbsp;${subject.subjectTitle}</h4>
					    		<ol type="A">
					    			<li>${subject.subjectOptionA}</li>
					    			<li>${subject.subjectOptionB}</li>
					    			<li>${subject.subjectOptionC}</li>
					    			<li>${subject.subjectOptionD}</li>
					    		</ol>
				    		</div>
				    		<div class="form-group">
					    		<div class="alert alert-warning">
					    			<p>
						    			<label style="cursor: default;">【正确答案】：</label>
						    			<label>
						    				<c:choose>
						    					<c:when test="${subject.subjectOptionA==subject.subjectAnswer}">
						    						A
						    					</c:when>
						    					<c:when test="${subject.subjectOptionB==subject.subjectAnswer}">
						    						B
						    					</c:when>
						    					<c:when test="${subject.subjectOptionC==subject.subjectAnswer}">
						    						C
						    					</c:when>
						    					<c:when test="${subject.subjectOptionD==subject.subjectAnswer}">
						    						D
						    					</c:when>
						    				</c:choose>
						    			</label>
						    		</p>
						    		<p>
						    			<label style="cursor: default;">【参考解析】：</label>
						    			<label>${subject.subjectParse}</label>
						    		</p>
						    	</div>
					    	</div>
				    	</c:forEach>
			    	</form>
			    </div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		var totalTime = 120;
		$('span#totalTime').html(totalTime);
	});
</script>
</body>
</html>