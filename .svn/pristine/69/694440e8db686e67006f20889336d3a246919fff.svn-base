package gapp.web.controller;


import java.util.Date;

import gapp.model.User;
import gapp.model.dao.UserDao;
import gapp.web.validator.UserValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	UserValidator userValidator;
	
	@RequestMapping(value = "/userRegistration.html", method=RequestMethod.GET)
	public String register(ModelMap models){
		models.put("user", new User());
		return "userRegistration";
	}
	
	@RequestMapping(value = "/userRegistration.html", method = RequestMethod.POST)
	public String register(@ModelAttribute User user, BindingResult bindingResult, ModelMap models ){
		
		userValidator.validate( user, bindingResult );
        if( bindingResult.hasErrors() ) {
        	return "userRegistration";
        }
        
        user.setUser_roles("Student");
        user.setCreatedOn(new Date());
        user.setEnabled(true);
        userDao.saveUser( user );
        models.addAttribute("modalShow", "Saved");
		return "userRegistration";
	}

}
