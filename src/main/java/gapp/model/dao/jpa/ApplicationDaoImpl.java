package gapp.model.dao.jpa;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Application;
import gapp.model.Department;
import gapp.model.User;
import gapp.model.dao.ApplicationDao;

@Repository
public class ApplicationDaoImpl implements ApplicationDao {

	 @PersistenceContext
	    private EntityManager entityManager;
	 
	  @Override
	    public Application getApplication( Integer id )
	    {
	        return entityManager.find( Application.class, id );
	    }

	 @SuppressWarnings("unchecked")
		@Override
	    public List<Application> getApplicationByDepartment(String deptName, String programName)
	    {
	        return entityManager.createQuery( "from Application  where  program.dept.departmentName = :name and term.termName = :term").setParameter("name", deptName).setParameter("term",programName).getResultList();
	    }
	 
	 @SuppressWarnings("unchecked")
	@Override
	 public List<Application> getApplicationForStudent(String emailId){
		   return entityManager.createQuery( "from Application  where  user.emailId = :emailId").setParameter("emailId", emailId).getResultList();
	 }
	 
	 @SuppressWarnings("unchecked")
	@Override
	 public List<Application> getAllApplicationOfStudent(Integer userId){
			String query = "select app from Application app "
					+ "join fetch app.user u "
					+ "join fetch app.term pt "
					+ "join fetch app.program prog "
					+ "join fetch prog.dept dept "
					+ "join fetch app.status st "
					+ "where (app.user.id = :id) and (app.enabled = true)";

			return entityManager.createQuery(query).setParameter("id", userId)
					.getResultList();
		   //return entityManager.createQuery( "from Application  where  user.id = :userId").setParameter("userId", userId).getResultList();
	 }
	 
	 @SuppressWarnings("unchecked")
		@Override
		 public List<Application> getApplicationDetail(Integer applicationId){
				String query = "select app from Application app "
						+ "join fetch app.user u "
						+ "join fetch app.term pt "
						+ "join fetch app.program prog "
						+ "join fetch prog.dept dept "
						+ "join fetch app.status st "
						+ "where (app.applicationId = :id) and (app.enabled = true)";

				return entityManager.createQuery(query).setParameter("id", applicationId)
						.getResultList();
			   //return entityManager.createQuery( "from Application  where  user.id = :userId").setParameter("userId", userId).getResultList();
		 }

	 @Override
		@Transactional
		public Application saveApplication(Application app) {
			return entityManager.merge(app);
		}
	 
	 @Override
		@Transactional
		public Integer UpdateApplication(Integer id, Boolean submit){
			
			String hql = "Update Application app set app.submit = :submit, app.createdOn = :sbDate "  + 
		             "Where app.applicationId = :appId";
		Query query = entityManager.createQuery(hql);
		query.setParameter("submit", submit);
		query.setParameter("sbDate", new Date());
		query.setParameter("appId", id);
		
		int result = query.executeUpdate();
			return result;
		}

	}
