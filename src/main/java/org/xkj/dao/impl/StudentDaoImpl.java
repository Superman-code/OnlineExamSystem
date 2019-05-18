package org.xkj.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.xkj.dao.IStudentDao;
import org.xkj.entity.Student;
import org.xkj.hibernate.HibernateSessionFactory;
import org.xkj.util.Page;

public class StudentDaoImpl implements IStudentDao{

	@Override
	public List<Student> findStudentsByName(String studentName, Page page) {
		Session session = HibernateSessionFactory.getSession();
		
		String hql = "from Student as stu where stu.studentName=?1";
		
		Query query = session.createQuery(hql);
		
		query.setParameter(1, studentName);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getEveryPage());
		
		List resultList = query.getResultList();
		HibernateSessionFactory.closeSession();
		
		return resultList;
	}

	@Override
	public int findStudentCountByName(String studentName) {
		Session session = HibernateSessionFactory.getSession();
		
		String hql = "select count(stu) from Student as stu where stu.studentName=?1";
		
		Query query = session.createQuery(hql);
		
		query.setParameter(1, studentName);
		
		List resultList = query.getResultList();
		HibernateSessionFactory.closeSession();
		
		return resultList.size();
	}

	@Override
	public List<Student> findStudentsBySclass(String sclass, Page page) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Student as stu where stu.sclass=?1";
		Query query = session.createQuery(hql);
		query.setParameter(1, sclass);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getEveryPage());
		List resultList = query.getResultList();
		HibernateSessionFactory.closeSession();
		return resultList;
	}

	@Override
	public int findStudentCountBySclass(String sclass) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "select count(stu) from Student as stu where stu.sclass=?1";
		Query query = session.createQuery(hql);
		query.setParameter(1, sclass);
		List resultList = query.getResultList();
		HibernateSessionFactory.closeSession();
		return resultList.size();
	}

	@Override
	public Student findStudentByID(String studentID) {
		Session session = HibernateSessionFactory.getSession();
		Student student = session.get(Student.class, studentID);
		HibernateSessionFactory.closeSession();
		return student;
	}

	@Override
	public void updateStudent(Student student) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.update(student);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
		}
		HibernateSessionFactory.closeSession();
	}

}
