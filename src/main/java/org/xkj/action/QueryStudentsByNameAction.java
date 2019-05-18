package org.xkj.action;

import java.util.List;
import java.util.Map;

import org.xkj.entity.Student;
import org.xkj.service.IStudentService;
import org.xkj.service.impl.StudentServiceImpl;
import org.xkj.util.Page;
import org.xkj.util.PageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class QueryStudentsByNameAction extends ActionSupport{
	private String studentName;
	private int currentPage;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	
	private IStudentService studentService = new StudentServiceImpl();
	
	@Override
	public String execute() throws Exception {
		if(currentPage == 0) {
			currentPage = 1;
		}
		
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		
		Page page = PageUtil.createPage(10, studentService.findStudentCountByName(studentName), currentPage);
		
		List<Student> students = studentService.findStudentsByName(studentName, page);
		
		request.put("students", students);
		request.put("message", "一共查询到"+students.size()+"条结果");
		request.put("page", page);
		request.put("studentName", studentName);	//传到前台分页算法中使用，不然跳转页面时会丢失查询关键词
		
		return this.SUCCESS;
	}
}
