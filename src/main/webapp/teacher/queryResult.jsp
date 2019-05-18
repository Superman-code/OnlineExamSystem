<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索结果</title>
</head>
<body>
<div class="container" style="margin-top: 50px;">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<%@ include file="navigator.jsp" %>
		</div>
		<div class="col-md-8 column">
			<ul class="nav nav-pills">
				<li class="active"><a style="cursor: default;">搜索结果</a></li>
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
						<th>试题编号</th>
						<th>试题标题</th>
						<th>正确答案</th>
						<th>查看试题</th>
						<th>更新试题</th>
						<th>删除试题</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.subjects}" var="subject">
						<tr>
							<td>${subject.subjectID}</td>
							<td style="width:45%;word-break:break-all;word-wrap:break-word;">${subject.subjectTitle}</td>
							<td>${subject.subjectAnswer}</td>
							<td><a href="subjectManage_querySubjectByID?subjectID=${subject.subjectID}">查看</a></td>
							<td><a href="subjectManage_jumpUpdateSubject?subjectID=${subject.subjectID}">更新</a></td>
							<td><a href="subjectManage_deleteSubject?subjectID=${subject.subjectID}">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="text-align: center;">
				<ul class="pagination">
					<c:choose>
						<c:when test="${requestScope.page.prePage}">
							<li><a href="querySubject?currentPage=${requestScope.page.currentPage-1}&subjectTitle=${subjectTitle}">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a style="pointer-events: none;">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach begin="1" end="${requestScope.page.totalPage}" var="i">
						<li><a href="querySubject?currentPage=${i}&subjectTitle=${subjectTitle}">${i}</a></li>
					</c:forEach>
					
					<c:choose>
						<c:when test="${requestScope.page.nextPage}">
							<li><a href="querySubject?currentPage=${requestScope.page.currentPage+1}&subjectTitle=${subjectTitle}">&raquo;</a></li>
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
			var suffixNum = $href.indexOf("subjectTitle")+"subjectTitle".length+1;
			var i = $href.substring($href.indexOf("currentPage")+"currentPage".length+1,$href.indexOf("&"));
			var suffix = $href.substring(suffixNum);
			$(this).attr("href","querySubject?currentPage="+i+"&subjectTitle="+encodeURIComponent(suffix));
		});
	});
</script>
</body>
</html>