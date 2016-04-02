package gapp.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StaffController {

	@RequestMapping(value = "/user/staff.html", method = RequestMethod.GET)
	public String StaffView(ModelMap models, HttpServletRequest request) {

		return "/user/staff";

	}
}
