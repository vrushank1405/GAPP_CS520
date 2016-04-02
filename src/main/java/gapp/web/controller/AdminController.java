package gapp.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import gapp.model.User;
import gapp.model.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

	@Autowired
	UserDao userDao;

	@RequestMapping(value = "/user/admin.html", method = RequestMethod.GET)
	public String AdminView(ModelMap models, HttpServletRequest request) {

		return "/user/admin";

	}
}
