package gapp.model.dao;

import gapp.model.Application;
import gapp.model.Department;
import gapp.model.User;

import java.util.List;

public interface ApplicationDao {
	
	Application getApplication( Integer id );

	 List<Application> getApplicationByDepartment(String deptName, String programTerm);
	 
	 List<Application> getApplicationForStudent(String emailId);
	 
	 List<Application> getAllApplicationOfStudent(Integer userId);
	 
	 List<Application> getApplicationDetail(Integer applicationId);
	 
	 Application saveApplication(Application app);
	 
	 Integer UpdateApplication(Integer id, Boolean submit );
}
