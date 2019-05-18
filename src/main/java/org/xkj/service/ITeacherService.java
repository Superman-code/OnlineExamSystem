package org.xkj.service;

import org.xkj.entity.Teacher;

public interface ITeacherService {
	public Teacher findTeacherByID(String teacherID);
	public boolean allowLogin(String teacherID, String password);
}
