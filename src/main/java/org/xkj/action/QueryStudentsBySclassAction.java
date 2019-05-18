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

public class QueryStudentsBySclassAction extends ActionSupport {
	private String sclass;
	private int currentPage;

	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	private IStudentService studentService = new StudentServiceImpl();

	@Override
	public String execute() throws Exception {
		if(currentPage == 0) {
			currentPage = 1;
		}
		
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		
		Page page = PageUtil.createPage(10, studentService.findStudentCountBySclass(sclass), currentPage);
		
		List<Student> students = studentService.findStudentsBySclass(sclass, page);
		
		request.put("students", students);
		request.put("message", "一共查询到"+students.size()+"条结果");
		request.put("page", page);
		request.put("sclass", sclass);
		return this.SUCCESS;
	}
}
