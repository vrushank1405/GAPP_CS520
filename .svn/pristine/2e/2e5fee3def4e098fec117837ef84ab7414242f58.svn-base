package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Application;
import gapp.model.ApplicationStatusRecords;
import gapp.model.dao.ApplicationStatusRecordsDao;

@Repository
public class ApplicationStatusRecordsDaoImpl implements ApplicationStatusRecordsDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	 @SuppressWarnings("unchecked")
		@Override
	    public List<ApplicationStatusRecords> getApplicationStatusRecordsByAppId (Integer applicationId){
	    	
		  String query = "select asr from ApplicationStatusRecords asr "
		            + "join fetch asr.status "
		            + "where asr.application.applicationId = :id";

		  
	    	return entityManager.createQuery( query ).setParameter("id", applicationId)
		            .getResultList();
	    }
	 
	 @Override
		@Transactional
		public ApplicationStatusRecords saveApplicationStatusRecords(ApplicationStatusRecords app) {
			return entityManager.merge(app);
		}
}
