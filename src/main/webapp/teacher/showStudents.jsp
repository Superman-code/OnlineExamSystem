<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理学生</title>
</head>
<body>
<div class="container" style="margin-top: 50px;">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<%@ include file="navigator.jsp" %>
		</div>
		<div class="col-md-8 column">
			<ul class="nav nav-pills">
				<li class="active"><a style="cursor: default;">管理学生</a></li>
			</ul>
			<hr>
			<c:choose>
				<c:when test="${empty requestScope.message}"></c:when>
				<c:otherwise>
					<div class="alert alert-success alert-dismissable">
						<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">
							&times;
						</button>
						${requestScope.message}
					</div>
				</c:otherwise>
			</c:choose>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>学生编号</th>
						<th>学生姓名</th>
						<th>所属班级</th>
						<th>成绩</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.students}" var="student">
						<tr>
							<td>${student.studentID}</td>
							<td>${student.studentName}</td>
							<td>${student.sclass}</td>
							<td>${student.result}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="text-align: center;">
				<ul class="pagination">
					<c:choose>
						<c:when test="${requestScope.page.prePage}">
							<li><a href="queryStudentsBySclass?currentPage=${requestScope.page.currentPage-1}&sclass=${sclass}">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a style="pointer-events: none;">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach begin="1" end="${requestScope.page.totalPage}" var="i">
						<li><a href="queryStudentsBySclass?currentPage=${i}&sclass=${sclass}">${i}</a></li>
					</c:forEach>
					
					<c:choose>
						<c:when test="${requestScope.page.nextPage}">
							<li><a href="queryStudentsBySclass?currentPage=${requestScope.page.currentPage+1}&sclass=${sclass}">&raquo;</a></li>
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
		$("ul.pagination a").click(function(){
			var $href = $(this).attr("href");
			var suffixNum = $href.indexOf("sclass")+"sclass".length+1;
			//因为currentPage是通过JSTL表达式获得的，而在js代码中尽量不要出现JSTL代码，所以就将currentPage的值提取出来保存到i变量中
			var i = $href.substring($href.indexOf("currentPage")+"currentPage".length+1,$href.indexOf("&"));
			var suffix = $href.substring(suffixNum);
			$(this).attr("href","queryStudentsBySclass?currentPage="+i+"&sclass="+encodeURIComponent(suffix));
		});
	});
</script>
</body>
</html>