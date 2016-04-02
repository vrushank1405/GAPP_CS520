package gapp.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import gapp.model.Department;
import gapp.model.ListDepartment;
import gapp.model.User;
import gapp.model.dao.AdditionalInfoDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.DepartmentProgramDao;
import gapp.model.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DepartmentController {

	@Autowired
	UserDao userDao;

	@Autowired
	DepartmentDao departmentDao;

	@Autowired
	DepartmentProgramDao departmentProgramDao;

	@Autowired
	AdditionalInfoDao additionalInfoDao;

	@RequestMapping(value = "/department/viewDepartment.html", method = RequestMethod.GET)
	public String ViewDepartment(ModelMap models, HttpServletRequest request) {
		
		List<ListDepartment> st = new ArrayList<ListDepartment>();
		List<Object[]> rr = departmentDao.getDepartmentsWithProgram();
		for (Object[] line : rr) {

			st.add(new ListDepartment(Integer.parseInt(line[1].toString()),
					line[0].toString(), Integer.parseInt(line[2].toString())));
		}
		models.put("dept", st);
		return "department/viewDepartment";

	}

	@RequestMapping(value = "/department/viewDepartmentDetails.html", method = RequestMethod.GET)
	public String ViewDepartmentDetails(ModelMap models,
			@RequestParam Integer Id, HttpServletRequest request) {
		
		models.put("department", departmentDao.getDepartmentById(Id));
		models.put("departmentProgram",
				departmentProgramDao.getDeptProgramByDeptId(Id));
		models.put("additionalInfo",
				additionalInfoDao.getAdditionalInfoByDeptId(Id));
		return "department/viewDepartmentDetails";
	}
	
	 @RequestMapping(value = "/department/addDepartment.html", method = RequestMethod.GET)
	    public String addDepartment( ModelMap models, HttpServletRequest request )
	    {		 
		
	        models.put( "dept", new Department() );
	        return "department/addDepartment";
	    }
	 
	 @RequestMapping(value = "/department/addDepartment.html", method = RequestMethod.POST)
		public String register(@ModelAttribute Department dept, HttpServletRequest request, ModelMap models ){
		 
		 dept.setCreatedOn(new Date());
		 dept.setEnabled(true);
		 departmentDao.saveDepartment( dept );
		 models.addAttribute("modalShow", "Saved");
		    models.put( "dept", new Department() );
			return "department/addDepartment";
		}
	 
	  @RequestMapping(value = "/department/editDepartment.html", method = RequestMethod.GET)
	    public String edit( @RequestParam Integer Id, ModelMap models, HttpServletRequest request )
	    {
		  
	        models.put( "dept", departmentDao.getDepartmentById(Id) );
	        return "department/editDepartment";
	    }
	  
	  @RequestMapping(value = "/department/editDepartment.html", method = RequestMethod.POST)
	    public String edit( @ModelAttribute Department dept, @RequestParam Integer Id, ModelMap models)
	    {
		  	
			 departmentDao.UpdateDepartment(Id, dept.getDepartmentName());
			 models.addAttribute("modalShow", "Saved");
			    models.put( "dept", dept );
			return "department/editDepartment";
	    }

}
