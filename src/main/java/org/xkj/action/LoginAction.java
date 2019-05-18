package org.xkj.action;

import java.util.List;
import java.util.Map;

import org.xkj.entity.Student;
import org.xkj.entity.Type;
import org.xkj.service.IStudentService;
import org.xkj.service.ITeacherService;
import org.xkj.service.ITypeService;
import org.xkj.service.impl.StudentServiceImpl;
import org.xkj.service.impl.TeacherServiceImpl;
import org.xkj.service.impl.TypeServiceImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private String id;
	private String password;
	private String role;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	private IStudentService studentService = new StudentServiceImpl();
	private ITeacherService teacherService = new TeacherServiceImpl();
	private ITypeService typeService = new TypeServiceImpl();
	
	@Override
	public String execute() throws Exception {
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		Map<String, Object> session = ActionContext.getContext().getSession();
		if("student".equals(role)) {
			if(studentService.allowLogin(id, password)) {
				Student student = studentService.findStudentByID(id);
				List<Type> types = typeService.findAllType();
				session.put("student", student);
				session.put("types", types);
				return "studentSuccess";
			} else {
				request.put("error", "该学生编号不存在，或者密码不正确");
				return this.INPUT;
			}
		} else {
			if(teacherService.allowLogin(id, password)) {
				return "teacherSuccess";
			} else {
				request.put("error", "该教师编号不存在，或者密码不正确");
				return this.INPUT;
			}
		}
	}
}
