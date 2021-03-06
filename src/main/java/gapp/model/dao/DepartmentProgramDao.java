package gapp.model.dao;

import java.util.List;

import gapp.model.Department;
import gapp.model.DepartmentProgram;

public interface DepartmentProgramDao {
	
	DepartmentProgram getDeptProgram(Integer id);
	
	List<DepartmentProgram> getDeptProgramByDeptId (Integer deptId);
	
	List<DepartmentProgram> getDeptProgramByAjax (Integer deptId);
	
	List<DepartmentProgram> searchDepartmentProgramByDept(Integer deptId);
	
	void removeDepartmentProgram(Integer Id);
	
	 DepartmentProgram saveDepartmentProgram(DepartmentProgram deptProgram);
}
