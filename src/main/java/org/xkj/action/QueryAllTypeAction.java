package org.xkj.action;

import java.util.List;
import java.util.Map;

import org.xkj.entity.Type;
import org.xkj.service.ITypeService;
import org.xkj.service.impl.TypeServiceImpl;
import org.xkj.util.Page;
import org.xkj.util.PageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class QueryAllTypeAction extends ActionSupport {
	private int currentPage;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	private ITypeService typeService = new TypeServiceImpl();

	@Override
	public String execute() throws Exception {
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		
		if(currentPage == 0) {
			currentPage = 1;
		}
		
		Page page = PageUtil.createPage(5, typeService.findAllCount(), currentPage);
		
		List<Type> types = typeService.findAllTypeByPage(page);
		
		request.put("types", types);
		request.put("page", page);
		
		return super.execute();
	}
}
