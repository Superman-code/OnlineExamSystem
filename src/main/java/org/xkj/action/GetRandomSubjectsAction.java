package org.xkj.action;

import java.util.List;
import java.util.Map;

import org.xkj.entity.Subject;
import org.xkj.service.ISubjectService;
import org.xkj.service.impl.SubjectServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class GetRandomSubjectsAction extends ActionSupport {
	private int typeID;
	
	public int getTypeID() {
		return typeID;
	}

	public void setTypeID(int typeID) {
		this.typeID = typeID;
	}

	private ISubjectService subjectService = new SubjectServiceImpl();

	@Override
	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		//在这里将试卷题数写死为20
		List<Subject> subjects = subjectService.findRandomSubjects(20, typeID);
		
		session.put("subjects", subjects);
		
		return this.SUCCESS;
	}
}
