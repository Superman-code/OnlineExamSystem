package org.xkj.service.impl;

import java.util.List;

import org.xkj.dao.ITypeDao;
import org.xkj.dao.impl.TypeDaoImpl;
import org.xkj.entity.Type;
import org.xkj.service.ITypeService;
import org.xkj.util.Page;

public class TypeServiceImpl implements ITypeService {
	private ITypeDao typeDao;

	public TypeServiceImpl() {
		this.typeDao = new TypeDaoImpl();
	}

	@Override
	public void addType(Type subjectType) {
		typeDao.addType(subjectType);
	}

	@Override
	public Type findTypeByName(String typeName) {
		return typeDao.findTypeByName(typeName);
	}

	@Override
	public List<Type> findAllTypeByPage(Page page) {
		return typeDao.findAllTypeByPage(page);
	}

	@Override
	public int findAllCount() {
		return typeDao.findAllCount();
	}

	@Override
	public void deleteType(int typeID) {
		typeDao.deleteType(typeID);
	}

	@Override
	public void updateType(Type type) {
		typeDao.updateType(type);
	}

	@Override
	public Type findTypeByID(int typeID) {
		return typeDao.findTypeByID(typeID);
	}

	@Override
	public List<Type> findAllType() {
		return typeDao.findAllType();
	}

}
