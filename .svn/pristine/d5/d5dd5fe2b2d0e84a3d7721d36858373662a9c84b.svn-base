package gapp.web.validator;

import gapp.model.User;
import gapp.model.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class LoginValidator implements Validator {

	@Autowired
	UserDao userDao;

	@Override
	public boolean supports(Class<?> clazz) {
		// clazz is User.class or a subclass of User
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;

		if (!StringUtils.hasText(user.getEmailId()))
			errors.rejectValue("emailId", "error.emailId.required");

		if (!StringUtils.hasText(user.getPassword()))
			errors.rejectValue("password", "error.password.required");

		if (StringUtils.hasText(user.getPassword())
				&& StringUtils.hasText(user.getEmailId())) {
			if (userDao.getUser(user.getEmailId(), user.getPassword()) == null) {
				errors.rejectValue("password", "error.password.validate");
			}
		}
	}
}
