<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新试题</title>
</head>
<body>
<div class="container" style="margin-top: 50px;">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<%@ include file="navigator.jsp" %>
		</div>
		<div class="col-md-8 column">
			<ul class="nav nav-pills">
				<li class="active"><a style="cursor: default;">更新试题</a></li>
			</ul>
			<hr>
			<form class="form-horizontal" action="subjectUpdate" method="post">
			
			  <div class="form-group hidden">
			    <label class="col-sm-2 control-label">试题ID</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="subjectID" value="${requestScope.subject.subjectID}">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">试题题目</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="subjectTitle" value="${requestScope.subject.subjectTitle}">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">选项A</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="subjectOptionA" value="${requestScope.subject.subjectOptionA}">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">选项B</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="subjectOptionB" value="${requestScope.subject.subjectOptionB}">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">选项C</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="subjectOptionC" value="${requestScope.subject.subjectOptionC}">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">选项D</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="subjectOptionD" value="${requestScope.subject.subjectOptionD}">
			    </div>
			  </div>
			  
			  <div class="form-group">
			  	<label class="col-sm-2 control-label">正确答案</label>
			  	<div class="col-sm-10">
			      <input type="text" class="form-control" name="subjectAnswer" value="${requestScope.subject.subjectAnswer}">
			    </div>
			  </div>
			  
			  <div class="form-group">
			  	<label class="col-sm-2 control-label">科目编号</label>
			  	<div class="col-sm-10">
			      <input type="text" class="form-control" name="typeID" value="${requestScope.subject.typeID}">
			    </div>
			  </div>
			  
			  <div class="form-group">
			  	<label class="col-sm-2 control-label">试题解析</label>
			    <div class="col-sm-10">
			      <textarea class="form-control" rows="3" name="subjectParse">${requestScope.subject.subjectParse}</textarea>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">录入</button>
			      <button type="reset" class="btn btn-default">重置</button>
			    </div>
			  </div>
			  
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		$("button[type='submit']").click(function(){
			var value1 = $("input[name='subjectTitle']").val();
			var value2 = $("input[name='subjectOptionA']").val();
			var value3 = $("input[name='subjectOptionB']").val();
			var value4 = $("input[name='subjectOptionC']").val();
			var value5 = $("input[name='subjectOptionD']").val();
			var value6 = $("input[name='subjectAnswer']").val();
			var value6 = $("input[name='typeID']").val();
			
			var result = (value1!="" && value2!="" && value3!="" && value4!="" && value5!="" && value6!="" && value7!="");
			if(result){
				return true;
			} else {
				alert("请将题目信息补充完成后再提交！");
				return false;
			}
		});
	});
</script>
</body>
</html>