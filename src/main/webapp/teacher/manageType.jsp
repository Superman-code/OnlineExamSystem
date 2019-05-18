<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理科目</title>
</head>
<body>
<div class="container" style="margin-top: 50px;">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<%@ include file="navigator.jsp" %>
		</div>
		<div class="col-md-8 column">
			<ul class="nav nav-pills">
				<li class="active"><a style="cursor: default;">管理科目</a></li>
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
			<!-- 科目内容展现部分 -->
			<table class="table table-striped">
				<thead>
					<tr>
						<th>科目编号</th>
						<th>科目名称</th>
						<th>查看试题</th>
						<th>更改科目名称</th>
						<th>删除科目</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.types}" var="type">
						<tr>
							<td>${type.typeID}</td>
							<td>${type.typeName}</td>
							<td><a href="findSubjectByTypeID?typeID=${type.typeID}">查看</a></td>
							<td><a href="updateType?typeID=${type.typeID}">更新</a></td>
							<td><a href="deleteType?typeID=${type.typeID}" id="delete">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- 分页部分 -->
			<div style="text-align: center;">
				<ul class="pagination">
					<c:choose>
						<c:when test="${requestScope.page.prePage}">
							<li><a href="queryAllType?currentPage=${requestScope.page.currentPage-1}">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a style="pointer-events: none;">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach begin="1" end="${requestScope.page.totalPage}" var="i">
						<li><a href="queryAllType?currentPage=${i}">${i}</a></li>
					</c:forEach>
					
					<c:choose>
						<c:when test="${requestScope.page.nextPage}">
							<li><a href="queryAllType?currentPage=${requestScope.page.currentPage+1}">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a style="pointer-events: none;">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		$("a#delete").click(function(){
			var result = confirm("是否继续删除？删除后该科目下的所有题目全部删除，且不可恢复！");
			return result;
		});		
	});
</script>
</body>
</html>