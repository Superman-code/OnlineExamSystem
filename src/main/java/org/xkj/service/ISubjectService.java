package org.xkj.service;

import java.util.List;

import org.xkj.entity.Subject;
import org.xkj.util.Page;

public interface ISubjectService {
	public boolean saveSubject(Subject subject);
	public List<Subject> queryAll(Page page);
	public int queryAllCount();
	public Subject querySubjectByID(int subjectID);
	public void updateSubject(Subject subject);
	public void deleteSubject(int subjectID);
	public int findLinkQueryCount(String subjectTitle);
	public List<Subject> likeQueryByTitle(String subjectTitle);
	//根据所给的typeID查询指定科目的随机题目
	public List<Subject> findRandomSubjects(int number, int typeID);
	public int accountResult(List<Subject> subjects, List<String> studentAnswers);
	public List<Subject> checkSubjects(List<Subject> subjects, List<String> studentAnswers);
	
	public List<Subject> findSubjectsByTypeID(int typeID, Page page);
	public int findCountByTypeID(int typeID);
}
