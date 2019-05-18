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

public class FindSubjectByTypeIDAction extends ActionSupport {
	private int currentPage;
	private int typeID;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTypeID() {
		return typeID;
	}

	public void setTypeID(int typeID) {
		this.typeID = typeID;
	}
	
	private ISubjectService subjectService = new SubjectServiceImpl();

	@Override
	public String execute() throws Exception {
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		
		if(currentPage == 0) {
			currentPage = 1;
		}
		
		int count = subjectService.findCountByTypeID(typeID);
		Page page = PageUtil.createPage(10, count, currentPage);
		
		List<Subject> subjects = subjectService.findSubjectsByTypeID(typeID, page);
		
		request.put("success", "一共查询到"+count+"条数据");
		request.put("subjects", subjects);
		request.put("page", page);
		request.put("typeID", typeID);
		request.put("flag", "findSubjectByTypeID");
		
		return super.execute();
	}
}
