package org.xkj.action;

import java.util.List;
import java.util.Map;

import org.xkj.entity.Student;
import org.xkj.entity.Subject;
import org.xkj.service.IStudentService;
import org.xkj.service.ISubjectService;
import org.xkj.service.impl.StudentServiceImpl;
import org.xkj.service.impl.SubjectServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SubmitExamAction extends ActionSupport{
//	private List<Integer> subjectIDs;	//保存题目的原始ID，方便查询正确答案
	private List<String> studentAnswers;
	
	public List<String> getStudentAnswers() {
		return studentAnswers;
	}

	public void setStudentAnswers(List<String> studentAnswers) {
		this.studentAnswers = studentAnswers;
	}


	private ISubjectService subjectService = new SubjectServiceImpl();
	private IStudentService studentService = new StudentServiceImpl();
	
	@Override
	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		List<Subject> subjects = (List<Subject>) session.get("subjects");
		
		int result = subjectService.accountResult(subjects, studentAnswers);
		subjects = subjectService.checkSubjects(subjects, studentAnswers);
		//应该将学生没做或者错的题目用红色标记出来，因此service再次增加一个方法
		
		//得到学生分数后，应该将分数保存数据库中
		Student student = (Student) session.get("student");
		studentService.updateResultByID(student.getStudentID(), result);
		student.setResult(result);
		
		session.put("result", result);
		session.put("subjects", subjects);
		
		return this.SUCCESS;
	}
}
