package org.xkj.action;

import java.util.Map;

import org.xkj.entity.Type;
import org.xkj.service.ITypeService;
import org.xkj.service.impl.TypeServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddTypeAction extends ActionSupport {
	private String typeName;

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
		
		if(typeService.findTypeByName(typeName) != null) {
			request.put("error", "科目名称重复，请重新填写");
			return this.INPUT;
		} else {
			Type type = new Type();
			type.setTypeName(typeName);
			
			typeService.addType(type);
			
			request.put("success", "添加成功");
			return this.SUCCESS;
		}
	}
}
