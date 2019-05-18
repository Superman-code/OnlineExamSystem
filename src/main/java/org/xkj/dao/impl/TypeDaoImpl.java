package org.xkj.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.xkj.dao.ITypeDao;
import org.xkj.entity.Type;
import org.xkj.hibernate.HibernateSessionFactory;
import org.xkj.util.Page;

public class TypeDaoImpl implements ITypeDao {

	@Override
	public void addType(Type type) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			/*
			 * saveOrUpdate先查看这个对象是不是有主键，
			 * 有主键那么就执行update（）方法，没有主键就执行save（）方法，
			 */
			session.saveOrUpdate(type);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
		HibernateSessionFactory.closeSession();
	}

	@Override
	public Type findTypeByName(String typeName) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Type as t where t.typeName=?1";
		Query query = session.createQuery(hql);
		query.setParameter(1, typeName);
		List resultList = query.getResultList();
		HibernateSessionFactory.closeSession();
		if(resultList.size() == 0) {
			return null;
		} else {
			Type type = (Type) resultList.get(0);
			return type;
		}
	}

	@Override
	public List<Type> findAllTypeByPage(Page page) {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Type as t order by t.typeID asc";
		Query query = session.createQuery(hql);
		query.setFirstResult(page.getBeginIndex());
		query.setMaxResults(page.getEveryPage());
		List resultList = query.getResultList();
		HibernateSessionFactory.closeSession();
		return resultList;
	}

	@Override
	public int findAllCount() {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Type as t";
		Query query = session.createQuery(hql);
		List resultList = query.getResultList();
		int count = resultList.size();
		HibernateSessionFactory.closeSession();
		return count;
	}

	@Override
	public void deleteType(int typeID) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = null;
		Type type = session.get(Type.class, typeID);
		try {
			transaction = session.beginTransaction();
			session.delete(type);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
		HibernateSessionFactory.closeSession();
	}

	@Override
	public void updateType(Type type) {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.update(type);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
		HibernateSessionFactory.closeSession();
	}

	@Override
	public Type findTypeByID(int typeID) {
		Session session = HibernateSessionFactory.getSession();
		Type type = session.get(Type.class, typeID);
		HibernateSessionFactory.closeSession();
		return type;
	}

	@Override
	public List<Type> findAllType() {
		Session session = HibernateSessionFactory.getSession();
		String hql = "from Type as t order by t.typeID asc";
		Query query = session.createQuery(hql);
		List resultList = query.getResultList();
		HibernateSessionFactory.closeSession();
		return resultList;
	}
	
}
