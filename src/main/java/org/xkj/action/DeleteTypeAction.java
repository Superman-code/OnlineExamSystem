package org.xkj.action;

import java.util.Map;

import org.xkj.service.ITypeService;
import org.xkj.service.impl.TypeServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteTypeAction extends ActionSupport {
	private int typeID;

	public int getTypeID() {
		return typeID;
	}

	public void setTypeID(int typeID) {
		this.typeID = typeID;
	}
	
	private ITypeService typeService = new TypeServiceImpl();

	@Override
	public String execute() throws Exception {
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		
		try {
			typeService.deleteType(typeID);
		} catch (Exception e) {
			e.printStackTrace();
			request.put("error", "删除失败！");
			return this.INPUT;
		}
		
		request.put("success", "删除成功！");
		
		return super.execute();
	}
}
