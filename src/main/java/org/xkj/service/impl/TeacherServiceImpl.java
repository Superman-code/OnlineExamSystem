package org.xkj.service.impl;

import org.xkj.dao.ITeacherDao;
import org.xkj.dao.impl.TeacherDaoImpl;
import org.xkj.entity.Teacher;
import org.xkj.service.ITeacherService;

public class TeacherServiceImpl implements ITeacherService{
	private ITeacherDao teacherDao;
	
	public TeacherServiceImpl() {
		teacherDao = new TeacherDaoImpl();
	}
	
	@Override
	public Teacher findTeacherByID(String teacherID) {
		return teacherDao.findTeacherByID(teacherID);
	}

	@Override
	public boolean allowLogin(String teacherID, String password) {
		Teacher teacher = teacherDao.findTeacherByID(teacherID);
		if(teacher == null) {
			return false;
		} else {
			if(password.equals(teacher.getPassword())) {
				return true;
			}
			return false;
		}
	}

}
