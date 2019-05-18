package org.xkj.dao.impl;

import org.hibernate.Session;
import org.xkj.dao.ITeacherDao;
import org.xkj.entity.Teacher;
import org.xkj.hibernate.HibernateSessionFactory;

public class TeacherDaoImpl implements ITeacherDao{

	@Override
	public Teacher findTeacherByID(String teacherID) {
		Session session = HibernateSessionFactory.getSession();
		Teacher teacher = session.get(Teacher.class, teacherID);
		HibernateSessionFactory.closeSession();
		return teacher;
	}

}
