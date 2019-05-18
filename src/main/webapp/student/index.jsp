<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.xkj.entity.Subject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>考试页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://louisville.edu/education/js/jquery.timers-1.2.js/at_download/file"></script>
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
			    	考试已经开始了<span id="passTime"></span>，剩余<span id="remainTime"></span>
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
		    			<%
		    				List<Subject> subjects = (List<Subject>)session.getAttribute("subjects");
			    			List<Subject> newSubjects = new ArrayList<Subject>();
		    				for(int i=0; i<subjects.size(); i++){
		    					List<String> options = new ArrayList<String>();
		    					Subject subject = subjects.get(i);
		    			%>
		    				<div class="form-group" style="margin-left: 22px;">
		    					<h4>第<%=i+1 %>题&nbsp;&nbsp;<%=subject.getSubjectTitle() %></h4>
		    					<ol type="A">
		    			<%
		    					options.add(subject.getSubjectOptionA());
			    				options.add(subject.getSubjectOptionB());
			    				options.add(subject.getSubjectOptionC());
			    				options.add(subject.getSubjectOptionD());
			    				Collections.shuffle(options);
			    				
			    				Subject newSubject = new Subject();
		    					newSubject.setSubjectTitle(subject.getSubjectTitle());
		    					newSubject.setSubjectID(subject.getSubjectID());
		    					newSubject.setSubjectAnswer(subject.getSubjectAnswer());
		    					newSubject.setSubjectParse(subject.getSubjectParse());
		    					newSubject.setSubjectOptionA(options.get(0));
		    					newSubject.setSubjectOptionB(options.get(1));
		    					newSubject.setSubjectOptionC(options.get(2));
		    					newSubject.setSubjectOptionD(options.get(3));
		    					
		    					newSubjects.add(newSubject);
		    					
		    					for(String option:options){
			    					
			    		%>
			    					<li><%=option %></li>
				    		<%
					    		}
				    		%>
				    			</ol>
				    		 </div>
			    			<div class="form-group">
					    		<div class="alert alert-warning">
					    			<label class="radio-inline" style="cursor: default;">正确答案</label>
					    			<label class="radio-inline">
								        <input type="radio" name="studentAnswers[<%=i %>]" value="<%=options.get(0) %>"> A
								    </label>
								    <label class="radio-inline">
								        <input type="radio" name="studentAnswers[<%=i %>]" value="<%=options.get(1) %>"> B
								    </label>
								    <label class="radio-inline">
								        <input type="radio" name="studentAnswers[<%=i %>]" value="<%=options.get(2) %>"> C
								    </label>
								    <label class="radio-inline">
								        <input type="radio" name="studentAnswers[<%=i %>]" value="<%=options.get(3) %>"> D
								    </label>
						    	</div>
					    	</div>
		    			<%
		    				}
		    				session.setAttribute("subjects", newSubjects);
		    			%>
				    	<div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="submit" class="btn btn-default">提交</button>
						      <button type="reset" class="btn btn-default">重置</button>
						    </div>
						</div>
			    	</form>
			    </div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		var totalTime = 120;
		
		var passTime_minute = 0;
		var passTime_second = 0;
		
		var remainTime_minute = 119;
		var remainTime_second = 60;
		
		$('span#totalTime').html(totalTime);
		$('body').everyTime('1s',function(){
			passTime_second++;
			remainTime_second--;
			if(passTime_second % 60 == 0){
				passTime_second = 0;
				passTime_minute++;
			}
			if(remainTime_second == 0){
				remainTime_minute--;
				remainTime_second = 60;
			}
			$("span#passTime").html(passTime_minute+"分"+passTime_second+"秒");
			$("span#remainTime").html(remainTime_minute+"分"+remainTime_second+"秒");
		});
		
		if(remainTime_minute == 0){
			$('body').stopTime();
			$("button[type='submit']").submit();
		}
		$("button[type='submit']").click(function(){
			var result = true;
			for(var i=0; i<20; i++){
				var radio = $("input[name='studentAnswers["+i+"]']:checked").val();
				if(radio != null){
					result = false;
					break;
				}
			}
			/*
			var radio1 = $("input[name='studentAnswers[0]']:checked").val();
			var radio2 = $("input[name='studentAnswers[1]']:checked").val();
			var radio3 = $("input[name='studentAnswers[2]']:checked").val();
			var radio4 = $("input[name='studentAnswers[3]']:checked").val();
			*/
			//假如单选框没有选中的话是null，而不是""
			//var result = (radio1==null && radio2==null && radio3==null && radio4==null);
			if(result){
				alert("请不要交白卷！");
				return false;
			} else {
				return true;
			}
		});
	});
</script>
</body>
</html>