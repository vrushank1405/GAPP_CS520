package gapp.model.dao;

import java.util.List;

import gapp.model.Application;
import gapp.model.Student;

public interface StudentDetailDao {
	
	List<Student> getStudentDetail(Integer applicationId);
	
	Student saveStudentDetail(Student app);
	
	Student getStudentDetailById(Integer applicationId);

}
