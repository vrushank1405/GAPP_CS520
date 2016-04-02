package gapp.web.controller;

import java.util.Date;

import gapp.model.Department;
import gapp.model.DepartmentProgram;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.DepartmentProgramDao;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DepartmentProgramController {
	
	@Autowired
	DepartmentDao departmentDao;
	
	@Autowired
	DepartmentProgramDao departmentProgramDao;

	@RequestMapping(value = "/department/viewDepartmentProgram.html", method = RequestMethod.GET)
	public String ViewDeptProgram(ModelMap models, HttpServletRequest request) {
		
		
		models.put("dept", departmentDao.getDepartments());
		models.put("deptProgram", departmentProgramDao.searchDepartmentProgramByDept(-1));
		
		return "department/viewDepartmentProgram";
	}
	
	@RequestMapping(value = "/department/viewDepartmentProgram.html", method = RequestMethod.POST)
	public String ViewDeptProgram(ModelMap models, @RequestParam Integer deptId){
		
		models.put("dept", departmentDao.getDepartments());
		models.addAttribute("SelectedValue", deptId);
		models.put("deptProgram", departmentProgramDao.searchDepartmentProgramByDept(deptId));
		return "department/viewDepartmentProgram";
		
	}
	
	 @RequestMapping(value = "/department/deleteDepartmentProgram.html", method = RequestMethod.GET)
	    public String removeDepartmentProgram(@RequestParam Integer ID, ModelMap models){
	         
	      departmentProgramDao.removeDepartmentProgram(ID);
	     // models.put("deptProgram", departmentProgramDao.searchDepartmentProgramByDept(deptId));
			return "redirect:../department/viewDepartmentProgram.html";
			
	    }
	 
	 @RequestMapping(value = "/department/addDepartmentProgram.html", method = RequestMethod.GET)
		public String addDepartmentProgram(ModelMap models, HttpServletRequest request) {
			
			
			models.put("dept", departmentDao.getDepartments());
			return "department/addDepartmentProgram";
		}
	 
	 @RequestMapping(value = "department/addDepartmentProgram.html", method = RequestMethod.POST)
	 public String addDepartmentProgram(ModelMap models, @RequestParam Integer deptId, @RequestParam String programName){
		 
		 Department dp = departmentDao.getDepartmentById(deptId);
		 DepartmentProgram deptProgram = new DepartmentProgram();
		 deptProgram.setProgramName(programName);
		 deptProgram.setDept(dp);
		 deptProgram.setCreatedOn(new Date());
		 deptProgram.setEnabled(true);
		 departmentProgramDao.saveDepartmentProgram(deptProgram);
		 models.put("dept", departmentDao.getDepartments());
		 models.addAttribute("modalShow", "Saved");
		 
		 return "department/addDepartmentProgram";
	 }
}
