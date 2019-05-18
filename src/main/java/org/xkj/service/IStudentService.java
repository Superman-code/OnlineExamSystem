package org.xkj.service;

import java.util.List;

import org.xkj.entity.Student;
import org.xkj.entity.Subject;
import org.xkj.util.Page;

public interface IStudentService {
	public List<Student> findStudentsByName(String studentName, Page page);
	public int findStudentCountByName(String studentName);
	public List<Student> findStudentsBySclass(String sclass, Page page);
	public int findStudentCountBySclass(String sclass);
	public boolean allowLogin(String studentID, String password);
	public Student findStudentByID(String studentID);
	public void updateResultByID(String studentID, int result);
}
