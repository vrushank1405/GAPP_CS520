package gapp.web.controller;

import gapp.model.dao.DepartmentDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@Autowired
	DepartmentDao deptDao;
	 @RequestMapping("/home1.html")
	    public String index(ModelMap models)
	    {
		 models.put("user", deptDao.getDepartmentsWithProgram());
	        return "home";
	    }
}
