package org.xkj.action;

import java.util.Map;

import org.xkj.entity.Subject;
import org.xkj.service.ISubjectService;
import org.xkj.service.impl.SubjectServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SubjectAddAction extends ActionSupport {
	// 由于subjectID是自动递增，不需要干预
	private String subjectTitle;
	private String subjectOptionA;
	private String subjectOptionB;
	private String subjectOptionC;
	private String subjectOptionD;
	private String subjectAnswer;
	private int typeID;
	private String subjectParse;

	private ISubjectService subjectService = new SubjectServiceImpl();

	public int getTypeID() {
		return typeID;
	}

	public void setTypeID(int typeID) {
		this.typeID = typeID;
	}

	public String getSubjectTitle() {
		return subjectTitle;
	}

	public void setSubjectTitle(String subjectTitle) {
		this.subjectTitle = subjectTitle;
	}

	public String getSubjectOptionA() {
		return subjectOptionA;
	}

	public void setSubjectOptionA(String subjectOptionA) {
		this.subjectOptionA = subjectOptionA;
	}

	public String getSubjectOptionB() {
		return subjectOptionB;
	}

	public void setSubjectOptionB(String subjectOptionB) {
		this.subjectOptionB = subjectOptionB;
	}

	public String getSubjectOptionC() {
		return subjectOptionC;
	}

	public void setSubjectOptionC(String subjectOptionC) {
		this.subjectOptionC = subjectOptionC;
	}

	public String getSubjectOptionD() {
		return subjectOptionD;
	}

	public void setSubjectOptionD(String subjectOptionD) {
		this.subjectOptionD = subjectOptionD;
	}

	public String getSubjectAnswer() {
		return subjectAnswer;
	}

	public void setSubjectAnswer(String subjectAnswer) {
		this.subjectAnswer = subjectAnswer;
	}

	public String getSubjectParse() {
		return subjectParse;
	}

	public void setSubjectParse(String subjectParse) {
		this.subjectParse = subjectParse;
	}

	@Override
	public String execute() throws Exception {
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");

		Subject subject = new Subject();

		subject.setSubjectTitle(subjectTitle);
		subject.setSubjectOptionA(subjectOptionA);
		subject.setSubjectOptionB(subjectOptionB);
		subject.setSubjectOptionC(subjectOptionC);
		subject.setSubjectOptionD(subjectOptionD);
		subject.setSubjectAnswer(subjectAnswer);
		subject.setTypeID(typeID);
		subject.setSubjectParse(subjectParse);

		if (subjectService.saveSubject(subject)) {
			request.put("success", "添加成功！");
			return this.SUCCESS;
		} else {
			request.put("error", "该试题已经添加过了，请勿重复添加！");
			return this.INPUT;
		}
	}
}
