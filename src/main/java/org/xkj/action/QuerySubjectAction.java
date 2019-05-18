package org.xkj.action;

import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.xkj.entity.Subject;
import org.xkj.service.ISubjectService;
import org.xkj.service.impl.SubjectServiceImpl;
import org.xkj.util.Page;
import org.xkj.util.PageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class QuerySubjectAction extends ActionSupport{
	private String subjectTitle;
	private int currentPage;
	
	private ISubjectService subjectService = new SubjectServiceImpl();

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSubjectTitle() {
		return subjectTitle;
	}

	public void setSubjectTitle(String subjectTitle) {
		this.subjectTitle = subjectTitle;
	}
	
	@Override
	public String execute() throws Exception {
		if(currentPage == 0) {
			currentPage = 1;
		}
		
		Page page = PageUtil.createPage(10, subjectService.findLinkQueryCount(subjectTitle), currentPage);
		
		List<Subject> subjects = subjectService.likeQueryByTitle(subjectTitle);
		
		for(Subject subject:subjects) {
			/*
			 * Pattern.quote(str)
			 * 返回指定String的字面模式String
			 * 输入序列中的元字符和转义序列不具有任何特殊意义
			 * 可以屏蔽+、*等元字符的效果
			 * 例如可以直接匹配1+2=()，不会转义
			 */
			String newTitle = subject.getSubjectTitle().replaceAll(Pattern.quote(subjectTitle), "<font color='red'>"+subjectTitle+"</font>");
			subject.setSubjectTitle(newTitle);
		}
		
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		
		request.put("subjects", subjects);
		if(subjects.size() == 0) {
			request.put("message", "没有查询到相关试题！");
		} else {
			request.put("message", "一共查到"+subjects.size()+"条数据");
		}
		request.put("page", page);
		request.put("subjectTitle", subjectTitle);
		
		return this.SUCCESS;
	}
}
