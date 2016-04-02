package gapp.web.validator;

import gapp.model.User;
import gapp.model.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
	
	@Autowired
	UserDao userDao;

	@Override
    public boolean supports( Class<?> clazz )
    {
        // clazz is User.class or a subclass of User
        return User.class.isAssignableFrom( clazz );
    }

    @Override
    public void validate( Object target, Errors errors )
    {
        User user = (User) target;
        
        String email = user.getEmailId();
        if( StringUtils.hasText( email)){
        	User u = userDao.checkEmailExist(email);
        	if( u != null ){
            errors.rejectValue( "emailId", "error.user.email.taken" );
        	}
        }
        
    }

}
