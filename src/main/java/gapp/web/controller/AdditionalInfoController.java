package gapp.web.controller;

import java.util.Date;

import gapp.model.AdditionalInfo;
import gapp.model.Department;
import gapp.model.DepartmentProgram;
import gapp.model.User;
import gapp.model.dao.AdditionalInfoDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.UserDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdditionalInfoController {
	
	@Autowired
	DepartmentDao departmentDao;
	
	@Autowired
	AdditionalInfoDao additionalInfoDao;
	
	@Autowired
	UserDao userDao;


	@RequestMapping(value = "/department/viewAdditionalInfo.html", method = RequestMethod.GET)
	public String ViewDeptProgram(ModelMap models, HttpServletRequest request) {
		
		
		models.put("dept", departmentDao.getDepartments());
		models.put("additionalInfo", additionalInfoDao.searchAdditionalInfoByDept(-1));
		
		return "department/viewAdditionalInfo";
	}
	
	@RequestMapping(value = "/department/viewAdditionalInfo.html", method = RequestMethod.POST)
	public String ViewDeptProgram(ModelMap models, @RequestParam Integer deptId){
		
		models.put("dept", departmentDao.getDepartments());
		models.addAttribute("SelectedValue", deptId);
		models.put("additionalInfo", additionalInfoDao.searchAdditionalInfoByDept(deptId));
		return "department/viewAdditionalInfo";
		
	}
	
	 @RequestMapping(value = "/department/addAdditionalInfo.html", method = RequestMethod.GET)
		public String addDepartmentProgram(ModelMap models, HttpServletRequest request) {
			
			
			models.put("dept", departmentDao.getDepartments());
			return "department/addAdditionalInfo";
		}

	 @RequestMapping(value = "department/addAdditionalInfo.html", method = RequestMethod.POST)
	 public String addDepartmentProgram(ModelMap models, @RequestParam Integer deptId, @RequestParam String name,@RequestParam String type,@RequestParam String required, HttpServletRequest request){
		 
		 Department dp = departmentDao.getDepartmentById(deptId);
		 HttpSession session = request.getSession();
		 int uid = Integer.parseInt(session.getAttribute("userId").toString());
			User u = new User();
			u = userDao.getUser(uid);
		 AdditionalInfo addInfo = new AdditionalInfo();
		 addInfo.setName(name);
		 addInfo.setFieldType(type);
		 if(required.equals("Mandatory")){
			 addInfo.setRequired(true);
		 }
		 else{
			 addInfo.setRequired(false);
		 }
		 addInfo.setCreatedOn(new Date());
		 addInfo.setStaff(u);
		 addInfo.setDept(dp);
		 addInfo.setEnabled(true);
		 additionalInfoDao.saveAdditionalInfo(addInfo);
		 models.put("dept", departmentDao.getDepartments());
		 models.addAttribute("modalShow", "Saved");
		 
		 return "department/addAdditionalInfo";
	 }
	 
	 @RequestMapping(value = "/department/deleteAdditionalInfo.html", method = RequestMethod.GET)
	    public String removeDepartmentProgram(@RequestParam Integer ID, ModelMap models){
	         
	      additionalInfoDao.removeAdditionalInfo(ID);
	     // models.put("deptProgram", departmentProgramDao.searchDepartmentProgramByDept(deptId));
			return "redirect:../department/viewAdditionalInfo.html";
			
	    }

}
