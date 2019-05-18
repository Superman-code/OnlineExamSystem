package org.xkj.service.impl;

import java.util.List;

import org.xkj.dao.IStudentDao;
import org.xkj.dao.impl.StudentDaoImpl;
import org.xkj.entity.Student;
import org.xkj.entity.Subject;
import org.xkj.service.IStudentService;
import org.xkj.util.Page;

public class StudentServiceImpl implements IStudentService{
	private IStudentDao studentDao;
	
	public StudentServiceImpl() {
		studentDao = new StudentDaoImpl();
	}
	
	@Override
	public List<Student> findStudentsByName(String studentName, Page page) {
		return studentDao.findStudentsByName(studentName, page);
	}

	@Override
	public int findStudentCountByName(String studentName) {
		return studentDao.findStudentCountByName(studentName);
	}

	@Override
	public List<Student> findStudentsBySclass(String sclass, Page page) {
		return studentDao.findStudentsBySclass(sclass, page);
	}

	@Override
	public int findStudentCountBySclass(String sclass) {
		return studentDao.findStudentCountBySclass(sclass);
	}

	@Override
	public boolean allowLogin(String studentID, String password) {
		Student student = studentDao.findStudentByID(studentID);
		if(student == null) {
			return false;
		} else {
			if(password.equals(student.getPassword())) {
				return true;
			}
			return false;
		}
	}

	@Override
	public Student findStudentByID(String studentID) {
		return studentDao.findStudentByID(studentID);
	}

	@Override
	public void updateResultByID(String studentID, int result) {
		Student student = studentDao.findStudentByID(studentID);
		student.setResult(result);
		studentDao.updateStudent(student);
	}

}
