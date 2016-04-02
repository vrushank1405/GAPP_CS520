package gapp.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "ApplicationDaoTests")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class ApplicationDaoTest extends AbstractTransactionalTestNGSpringContextTests {

	 @Autowired
	    ApplicationDao applicationDao;
	    
	 /*--- Test Case for Accounting Department , Fall 2016 Application----*/
	    @Test
	    public void getApplicationByDepartment()
	    {
	        assert applicationDao.getApplicationByDepartment("Accounting", "Fall 2016").size() == 1;
	    }
	    
	 /*-------- Test Case for student1 had submitted one application----*/
	    @Test
	    public void getApplicationForStudent()
	    {
	        assert applicationDao.getApplicationForStudent("student1@localhost.localdomain").size() == 1;
	    }

}
