package org.xkj.service.impl;

import java.util.List;
import java.util.regex.Pattern;

import org.xkj.dao.ISubjectDao;
import org.xkj.dao.impl.SubjectDaoImpl;
import org.xkj.entity.Subject;
import org.xkj.service.ISubjectService;
import org.xkj.util.Page;

public class SubjectServiceImpl implements ISubjectService{
	private ISubjectDao subjectDao;
	
	public SubjectServiceImpl() {
		subjectDao = new SubjectDaoImpl();
	}
	
	@Override
	public boolean saveSubject(Subject subject) {
		//获取试题题目
		String subjectTitle = subject.getSubjectTitle();
		//如果试题标题不存在，允许添加
		if(subjectDao.querySubjectByTitle(subjectTitle) == null) {
			subjectDao.addSubject(subject);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<Subject> queryAll(Page page) {
		return subjectDao.queryAllByPage(page);
	}

	@Override
	public int queryAllCount() {
		return subjectDao.queryAllCount();
	}

	@Override
	public Subject querySubjectByID(int subjectID) {
		return subjectDao.querySubjectByID(subjectID);
	}

	@Override
	public void updateSubject(Subject subject) {
		subjectDao.updateSubject(subject);
	}

	@Override
	public void deleteSubject(int subjectID) {
		subjectDao.deleteSubject(subjectID);
	}

	@Override
	public int findLinkQueryCount(String subjectTitle) {
		return subjectDao.findLinkQueryCount(subjectTitle);
	}

	@Override
	public List<Subject> likeQueryByTitle(String subjectTitle) {
		return subjectDao.likeQueryByTitle(subjectTitle);
	}

	@Override
	public List<Subject> findRandomSubjects(int number, int typeID) {
		return subjectDao.findRandomSubjects(number,typeID);
	}

	@Override
	public int accountResult(List<Subject> subjects, List<String> studentAnswers) {
		int totalScore = 0;
		for(int i=0; i<studentAnswers.size(); i++) {
			String rightAnswer = subjects.get(i).getSubjectAnswer();
			if(rightAnswer.equals(studentAnswers.get(i))) {
				totalScore += 5;
			}
		}
		return totalScore;
	}

	@Override
	public List<Subject> checkSubjects(List<Subject> subjects, List<String> studentAnswers) {
		for(int i=0; i<subjects.size(); i++) {
			String subjectTitle = subjects.get(i).getSubjectTitle();
			String primitiveTitle = subjectDao.querySubjectByID(subjects.get(i).getSubjectID()).getSubjectTitle();
			String right = "<font color='green'>"+primitiveTitle+"</font>";
			String replaceAll = "";
			if(right.equals(subjectTitle)) {
				replaceAll = subjectTitle.replaceAll(Pattern.quote(right), "<font color='red'>"+primitiveTitle+"</font>");
			} else {
				replaceAll = subjectTitle.replaceAll(Pattern.quote(subjectTitle), "<font color='red'>"+primitiveTitle+"</font>");
			}
			
			subjects.get(i).setSubjectTitle(replaceAll);
		}
		for(int i=0; i<studentAnswers.size(); i++) {
			String rightAnswer = subjects.get(i).getSubjectAnswer();
			if(rightAnswer.equals(studentAnswers.get(i))) {
				String subjectTitle = subjects.get(i).getSubjectTitle();
				String primitiveTitle = subjectDao.querySubjectByID(subjects.get(i).getSubjectID()).getSubjectTitle();
				String replaceAll = subjectTitle.replaceAll(Pattern.quote(subjectTitle), "<font color='green'>"+primitiveTitle+"</font>");
				subjects.get(i).setSubjectTitle(replaceAll);
			}
		}
		return subjects;
	}

	@Override
	public List<Subject> findSubjectsByTypeID(int typeID, Page page) {
		return subjectDao.findSubjectsByTypeID(typeID, page);
	}

	@Override
	public int findCountByTypeID(int typeID) {
		return subjectDao.findCountByTypeID(typeID);
	}

}
