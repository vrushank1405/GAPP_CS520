package gapp.model.dao;

import gapp.model.Student;
import gapp.model.StudentEducationInfo;

import java.util.List;

public interface StudentEducationalInfoDao {
	
	List<StudentEducationInfo> getStudentEducationalInfo(Integer applicationId);
	
	StudentEducationInfo saveStudentEducationInfo(StudentEducationInfo stEduInfo);
	
	void removeStudentEducation(Integer Id);

}
