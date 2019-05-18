<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更改科目</title>
</head>
<body>
<div class="container" style="margin-top: 50px;">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<%@ include file="navigator.jsp" %>
		</div>
		<div class="col-md-8 column">
			<ul class="nav nav-pills">
				<li class="active"><a style="cursor: default;">更改科目</a></li>
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
			<form class="form-horizontal" action="updateType" method="post">
				<input type="hidden" name="typeID" value="${requestScope.type.typeID}">
				<div class="form-group">
				    <label class="col-sm-2 control-label">科目名称</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="typeName" value="${requestScope.type.typeName}">
				    </div>
				 </div>
				 
				 <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default">更新</button>
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
				alert("科目名称不能为空！");
				return false;
			} else {
				return true;
			}
		});
	});
</script>
</body>
</html>