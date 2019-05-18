package org.xkj.action;

import java.util.Map;

import org.xkj.entity.Type;
import org.xkj.service.ITypeService;
import org.xkj.service.impl.TypeServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateTypeAction extends ActionSupport {
	private int typeID;
	private String typeName;

	public int getTypeID() {
		return typeID;
	}

	public void setTypeID(int typeID) {
		this.typeID = typeID;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	private ITypeService typeService = new TypeServiceImpl();

	@Override
	public String execute() throws Exception {
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		
		if(typeName == null) {
			Type type = typeService.findTypeByID(typeID);
			request.put("type", type);
			return "updateType";
		}
		
		if(typeService.findTypeByName(typeName) != null) {
			request.put("error", "科目名字重复，请重新填写！");
			return this.INPUT;
		}
		
		Type type = new Type();
		type.setTypeID(typeID);
		type.setTypeName(typeName);
		
		try {
			typeService.updateType(type);
		} catch (Exception e) {
			request.put("error", "更新失败！");
			return this.INPUT;
		}
		request.put("success", "更新成功！");
		
		return super.execute();
	}
}
