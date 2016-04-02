package gapp.model.dao.jpa;


import gapp.model.AdditionalInfoRecords;
import gapp.model.ApplicationStatusRecords;
import gapp.model.dao.AdditionalInfoRecordsDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class AdditionalInfoRecordsDaoImpl implements AdditionalInfoRecordsDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AdditionalInfoRecords> getAdditionalInfoRecords(Integer applicationId){
		
		String query = "select air from AdditionalInfoRecords air "
	            + "join fetch air.user "
				+ "join fetch air.additionalInfo "
	            + "where air.application.applicationId = :id and air.enabled = :enabled";

	  
    	return entityManager.createQuery( query ).setParameter("id", applicationId).setParameter("enabled", true)
	            .getResultList();

	}
	
	 @Override
		@Transactional
		public AdditionalInfoRecords saveAdditionalInfoRecords(AdditionalInfoRecords app) {
			return entityManager.merge(app);
		}
	 
	 @SuppressWarnings("unchecked")
		@Override
		public List<AdditionalInfoRecords> getAdditionalInfoRecordsByAjax(Integer applicationId){
			
			String query = "select air.additionalInfoRecordsId, air.value, air.additionalInfo.additionalInfoId from AdditionalInfoRecords air "					
		            + "where air.application.applicationId = :id and air.enabled = :enabled";

		  
	    	return entityManager.createQuery( query ).setParameter("id", applicationId).setParameter("enabled", true)
		            .getResultList();

		}

	 

}
