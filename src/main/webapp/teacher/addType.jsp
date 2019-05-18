<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加科目</title>
</head>
<body>
<div class="container" style="margin-top: 50px;">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<%@ include file="navigator.jsp" %>
		</div>
		<div class="col-md-8 column">
			<ul class="nav nav-pills">
				<li class="active"><a style="cursor: default;">添加科目</a></li>
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
			<c:choose>
				<c:when test="${empty requestScope.success}"></c:when>
				<c:otherwise>
					<div class="alert alert-success alert-dismissable">
						<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">
							&times;
						</button>
						${requestScope.success}
					</div>
				</c:otherwise>
			</c:choose>
			<form class="form-horizontal" action="addType" method="post">
				
				<div class="form-group">
				    <label class="col-sm-2 control-label">科目名称</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="typeName" placeholder="请输入科目名称">
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
			var value = $("input[name='typeName']").val();
			if(value == ""){
				alert("科目名不能为空！");
				return false;
			} else {
				return true;
			}
		});
	});
</script>
</body>
</html>