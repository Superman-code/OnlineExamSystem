package org.xkj.action;

import java.util.List;
import java.util.Map;

import org.xkj.entity.Subject;
import org.xkj.service.ISubjectService;
import org.xkj.service.impl.SubjectServiceImpl;
import org.xkj.util.Page;
import org.xkj.util.PageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SubjectManageAction extends ActionSupport{
	private int currentPage;
	private int subjectID;
	
	public int getSubjectID() {
		return subjectID;
	}

	public void setSubjectID(int subjectID) {
		this.subjectID = subjectID;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	private ISubjectService subjectService = new SubjectServiceImpl();
	
	public String queryAll() {
		if(currentPage == 0) {
			currentPage = 1;
		}
		
		Page page = PageUtil.createPage(10, subjectService.queryAllCount(), currentPage);
		
		List<Subject> subjects = subjectService.queryAll(page);
		
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		
		request.put("subjects", subjects);
		request.put("page", page);
		request.put("message", request.get("message"));
		
		return "subjectManage";
	}
	
	public String querySubjectByID() {
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		Subject subject = subjectService.querySubjectByID(subjectID);
		request.put("subject", subject);
		
		return "subjectShow";
	}
	
	public String jumpUpdateSubject() {
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		Subject subject = subjectService.querySubjectByID(subjectID);
		request.put("subject", subject);
		
		return "subjectUpdate";
	}
	
	public String deleteSubject() {
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		subjectService.deleteSubject(subjectID);
		request.put("success", "试题编号"+subjectID+"删除成功");
		
		return "deleteSubject";
	}
}
