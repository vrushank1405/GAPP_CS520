package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.User;
import gapp.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

	 @PersistenceContext
	    private EntityManager entityManager;

	    @Override
	    public User getUser( Integer id )
	    {
	        return entityManager.find( User.class, id );
	    }

	    @Override
	    public List<User> getUsers()
	    {
	        return entityManager.createQuery( "from User where enabled = true order by id", User.class )
	            .getResultList();
	    }
	    
	    @Override
	    public List<User> searchUsers( String roles)
	    {
	    	 return entityManager.createQuery( "from User where user_roles = :role and enabled = true", User.class ).setParameter("role", roles)
	 	            .getResultList();
	    }
	    
	    @Override
	    public User getUser( String email, String psswd)
	    {
	    	List<User> results =  entityManager.createQuery( "from User where LOWER(emailId) = LOWER(:email) and password = :pswwd and enabled = true", User.class ).setParameter("email", email).setParameter("pswwd", psswd)
	 	            .getResultList();
	    	
	    	return results.size() == 0 ? null : results.get(0);
	    }
	    
	    @Override
	    public User checkEmailExist( String email)
	    {
	    	List<User> results =  entityManager.createQuery( "from User where LOWER(emailId) = LOWER(:email) and enabled = true", User.class ).setParameter("email", email).getResultList();
	    	
	    	return results.size() == 0 ? null : results.get(0);
	    }
	    
	    @Override
	    @Transactional
	    public User saveUser( User user )
	    {
	        return entityManager.merge( user );
	    }
	    
	   }
