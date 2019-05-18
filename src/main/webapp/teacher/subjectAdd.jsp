<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>录入试题</title>
</head>
<body>
<div class="container" style="margin-top: 50px;">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<%@ include file="navigator.jsp" %>
		</div>
		<div class="col-md-8 column">
			<ul class="nav nav-pills">
				<li class="active"><a style="cursor: default;">录入试题</a></li>
			</ul>
			<hr>
			<c:choose>
				<c:when test="${empty requestScope.error}"></c:when>
				<c:otherwise>
					<div class="alert alert-danger alert-dismissable">
						<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">
							&times;
						</button>
						${requestScope.error}
					</div>
				</c:otherwise>
			</c:choose>
			<form class="form-horizontal" action="subjectAdd" method="post">
			
			  <div class="form-group">
			    <label class="col-sm-2 control-label">试题题目</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="subjectTitle" placeholder="请输入试题题目">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">选项A</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="subjectOptionA" placeholder="请输入选项A">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">选项B</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="subjectOptionB" placeholder="请输入选项B">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">选项C</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="subjectOptionC" placeholder="请输入选项C">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">选项D</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="subjectOptionD" placeholder="请输入选项D">
			    </div>
			  </div>
			  
			  <div class="form-group">
			  	<label class="col-sm-2 control-label">正确答案</label>
			  	<div class="col-sm-10">
			  	  <input type="text" class="form-control" name="subjectAnswer" placeholder="请输入正确答案">
			    </div>
			  </div>
			  
			  <div class="form-group">
			  	<label class="col-sm-2 control-label">科目编号</label>
			  	<div class="col-sm-10">
			  	  <input type="text" class="form-control" name="typeID" placeholder="请输入科目编号">
			    </div>
			  </div>
			  
			  <div class="form-group">
			  	<label class="col-sm-2 control-label">试题解析</label>
			    <div class="col-sm-10">
			      <textarea class="form-control" rows="3" name="subjectParse"></textarea>
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