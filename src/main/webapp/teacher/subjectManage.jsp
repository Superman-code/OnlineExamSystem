<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理试题</title>
</head>
<body>
<div class="container" style="margin-top: 50px;">
	<div class="row clearfix">
		<div class="col-md-4 column">
			<%@ include file="navigator.jsp" %>
		</div>
		<div class="col-md-8 column">
			<ul class="nav nav-pills">
				<li class="active"><a style="cursor: default;">管理试题</a></li>
			</ul>
			<hr>
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
						<c:when test="${requestScope.flag=='findSubjectByTypeID'}">
							<c:choose>
								<c:when test="${requestScope.page.prePage}">
									<li><a href="findSubjectByTypeID?currentPage=${requestScope.page.currentPage-1}&typeID=${typeID}">&laquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a style="pointer-events: none;">&laquo;</a></li>
								</c:otherwise>
							</c:choose>
							
							<c:forEach begin="1" end="${requestScope.page.totalPage}" var="i">
								<li><a href="findSubjectByTypeID?currentPage=${i}&typeID=${typeID}">${i}</a></li>
							</c:forEach>
							
							<c:choose>
								<c:when test="${requestScope.page.nextPage}">
									<li><a href="findSubjectByTypeID?currentPage=${requestScope.page.currentPage+1}&typeID=${typeID}">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a style="pointer-events: none;">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${requestScope.page.prePage}">
									<li><a href="subjectManage_queryAll?currentPage=${requestScope.page.currentPage-1}">&laquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a style="pointer-events: none;">&laquo;</a></li>
								</c:otherwise>
							</c:choose>
							
							<c:forEach begin="1" end="${requestScope.page.totalPage}" var="i">
								<li><a href="subjectManage_queryAll?currentPage=${i}">${i}</a></li>
							</c:forEach>
							
							<c:choose>
								<c:when test="${requestScope.page.nextPage}">
									<li><a href="subjectManage_queryAll?currentPage=${requestScope.page.currentPage+1}">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li><a style="pointer-events: none;">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>