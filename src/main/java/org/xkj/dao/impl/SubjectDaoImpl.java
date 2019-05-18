package org.xkj.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.xkj.dao.ISubjectDao;
import org.xkj.entity.Subject;
import org.xkj.hibernate.HibernateSessionFactory;
import org.xkj.util.Page;

public class SubjectDaoImpl implements ISubjectDao{

	@Override
	public Subject querySubjectByTitle(String subjectTitle) {
		//获取session对象
		Session session = HibernateSessionFactory.getSession();
		//创建根据标题查询试题的hql语句
		String hql = "from Subject as sub where sub.subjectTitle=?1";
		//根据hql语句创建query对象
		Query<Subject> query = session.createQuery(hql);
		//为参数赋值
		query.setParameter(1, subjectTitle);
		//将查询结果保存到list中
		List<Subject> list = query.list();
		//关闭session对象
		HibernateSessionFactory.closeSession();
		if(list.size() == 0) {
			return null;	//没有查到，返回null
		} else {
			return (Subject) list.get(0);	//返回第一个试题
		}
	}

	@Override
	public void addSubject(Subject subject) {
		Session session = HibernateSessionFactory.getSession();
		//声明一个事务
		Transaction transaction = null;
		try {
			//开启事务
			transaction = session.beginTransaction();
			//录入试题信息
			session.save(subject);
			//提交事务
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			//事务回滚
			transaction.rollback();
		}
		//关闭session
		HibernateSessionFactory.closeSession();
	}

	@Override
	public List<Subject> queryAllByPage(Page page) {
		List<Subject> subjects = new ArrayList<Subject>();
		
		Session session = HibernateSessionFactory.getSession();
		
		String hql = "from Subject as sub order by sub.subjectID asc";
		
		Query<Subject> query = session.createQuery(hql);
		
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getEveryPage());
		
		subjects = query.list();
		
		HibernateSessionFactory.closeSession();
		
		return subjects;
	}

	@Override
	public int queryAllCount() {
		Session session = HibernateSessionFactory.getSession();
		
		String hql = "select count(sub) from Subject as sub";
		
		Query query = session.createQuery(hql);
		
		List resultList = query.getResultList();
		
		HibernateSessionFactory.closeSession();

		return Integer.valueOf(resultList.get(0).toString());
	}

	@Override
	public Subject querySubjectByID(int subjectID) {
		Session session = HibernateSessionFactory.getSession();
		
		Subject subject = session.get(Subject.class, subjectID);
		
		HibernateSessionFactory.closeSession();
		
		return subject;
	}

	@Override
	public void updateSubject(Subject subject) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.update(subject);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
		HibernateSessionFactory.closeSession();
	}

	@Override
	public void deleteSubject(int subjectID) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = null;
		//要删除指定Subject，需要先根据ID获取指定Subject
		Subject subject = session.get(Subject.class, subjectID);
		
		try {
			transaction = session.beginTransaction();
			session.delete(subject);
			transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
		HibernateSessionFactory.closeSession();
	}

	@Override
	public int findLinkQueryCount(String subjectTitle) {
		Session session = HibernateSessionFactory.getSession();
		
		String hql = "from Subject as sub where sub.subjectTitle like ?1";
		
		Query query = session.createQuery(hql);
		
		query.setParameter(1, "%"+subjectTitle+"%");
		
		List resultList = query.getResultList();
		
		int size = resultList.size();
		
		HibernateSessionFactory.closeSession();
		
		return size;
	}

	@Override
	public List<Subject> likeQueryByTitle(String subjectTitle) {
		Session session = HibernateSessionFactory.getSession();
		
		String hql = "from Subject as sub where sub.subjectTitle like ?1";
		
		Query query = session.createQuery(hql);
		
		query.setParameter(1, "%"+subjectTitle+"%");
		
		List resultList = query.getResultList();
		
		HibernateSessionFactory.closeSession();
		
		return resultList;
	}

	@Override
	public List<Subject> findRandomSubjects(int number, int typeID) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Subject as sub where sub.typeID=?1 order by rand()";
		Query query = session.createQuery(hql);
		query.setParameter(1, typeID);
		query.setMaxResults(number);
		List resultList = query.getResultList();
		HibernateSessionFactory.closeSession();
		return resultList;
	}

	@Override
	public List<Subject> findSubjectsByTypeID(int typeID, Page page) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Subject as sub where sub.typeID=?1 order by sub.subjectID asc";
		Query query = session.createQuery(hql);
		query.setParameter(1, typeID);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getEveryPage());
		List resultList = query.getResultList();
		HibernateSessionFactory.closeSession();
		return resultList;
	}

	@Override
	public int findCountByTypeID(int typeID) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Subject as sub where sub.typeID=?1";
		Query query = session.createQuery(hql);
		query.setParameter(1, typeID);
		List resultList = query.getResultList();
		int count = resultList.size();
		return count;
	}
	
}
