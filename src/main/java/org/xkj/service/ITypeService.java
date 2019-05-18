package org.xkj.service;

import java.util.List;

import org.xkj.entity.Type;
import org.xkj.util.Page;

public interface ITypeService {
	public void addType(Type type);
	public Type findTypeByName(String typeName);
	public Type findTypeByID(int typeID);
	public List<Type> findAllTypeByPage(Page page);
	public int findAllCount();
	public void deleteType(int typeID);
	public void updateType(Type type);
	//查询所有科目，可以展现到前台页面,而且不需要分页
	public List<Type> findAllType();
}
