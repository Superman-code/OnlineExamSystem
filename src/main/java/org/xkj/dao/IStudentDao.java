package org.xkj.dao;

import java.util.List;

import org.xkj.entity.Student;
import org.xkj.util.Page;

public interface IStudentDao {
	//可能会有重名的情况，所以返回结果为list
	public List<Student> findStudentsByName(String studentName, Page page);
	public int findStudentCountByName(String studentName);
	public List<Student> findStudentsBySclass(String sclass, Page page);
	public int findStudentCountBySclass(String sclass);
	public Student findStudentByID(String studentID);
	public void updateStudent(Student student);
}
