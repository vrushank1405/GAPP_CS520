package gapp.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import gapp.model.User;
import gapp.model.dao.UserDao;
import gapp.web.validator.LoginValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@Autowired
	UserDao userdao;

	@Autowired
	LoginValidator loginValidator;

	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public String Login(ModelMap models, HttpServletRequest request) {
		HttpSession session = request.getSession();
		//session.setAttribute("userId", null);
		//session.setAttribute("Name", null);
		session.invalidate();
		models.addAttribute("user", new User());
		return "login";

	}

	@RequestMapping(value = "/login.html", method = RequestMethod.POST)
	public String Login(@ModelAttribute User user, BindingResult bindingResult,
			HttpServletRequest request) {

		loginValidator.validate(user, bindingResult);
		if (bindingResult.hasErrors()) {
			return "login";
		}

		User u = userdao.getUser(user.getEmailId(), user.getPassword());

		if (u != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", u.getId());
			session.setAttribute("Name", u.getFirst_name());

			if (u.getUser_roles().equals("Admin"))
				return "redirect:/user/admin.html";
			else if (u.getUser_roles().equals("Student"))
				return "redirect:/user/student.html";
			else
				return "redirect:/user/staff.html";
		}
		return "login";

	}

}
