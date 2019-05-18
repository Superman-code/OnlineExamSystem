package org.xkj.dao;

import org.xkj.entity.Teacher;

public interface ITeacherDao {
	public Teacher findTeacherByID(String teacherID);
}
