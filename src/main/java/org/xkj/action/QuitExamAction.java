package org.xkj.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class QuitExamAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.remove("subjects");
		session.remove("result");
		session.remove("student");
		session.remove("types");
		return this.SUCCESS;
	}
}
