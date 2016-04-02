package gapp.model.dao;

import java.util.List;

import gapp.model.User;

public interface UserDao {

	User getUser( Integer id );

    List<User> getUsers();
    
    List<User> searchUsers( String roles);
    
    User getUser( String emailId, String password  );
 
    User checkEmailExist(String email);
    
    User saveUser(User user);
    
}
