package gapp.model.dao.jpa;

import gapp.model.AdditionalInfo;
import gapp.model.DepartmentProgram;
import gapp.model.dao.AdditionalInfoDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class AdditionalInfoDaoImpl implements AdditionalInfoDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public AdditionalInfo getAdditionalInfo(Integer id){
		 return entityManager.find( AdditionalInfo.class, id );
	}

    @SuppressWarnings("unchecked")
	@Override
    public List<AdditionalInfo> getAdditionalInfoByDeptId (Integer deptId){
    	
    	return entityManager.createQuery( "from AdditionalInfo where dept.departmentId = :Id and enabled = true" ).setParameter("Id", deptId)
	            .getResultList();
    }
    
    @SuppressWarnings("unchecked")
	@Override
    public List<AdditionalInfo> getAdditionalInfoByAjax (Integer deptId){
    	 String query = "select ai.additionalInfoId, ai.name, ai.fieldType, ai.required from AdditionalInfo ai "		            
		            + "where ai.dept.departmentId = :Id and enabled = true";

		  
	    	return entityManager.createQuery( query ).setParameter("Id", deptId)
		            .getResultList();	

	    	
    	/*return entityManager.createQuery( "from AdditionalInfo where dept.departmentId = :Id and enabled = true" ).setParameter("Id", deptId)
	            .getResultList();*/
    }

    @Override
	public List<AdditionalInfo> searchAdditionalInfoByDept(Integer deptId) {
		String query = "select ai from AdditionalInfo ai "
				+ "join fetch ai.dept "
				+ "where (ai.dept.departmentId = :id or -1=:id) and (ai.enabled = true)";

		return entityManager.createQuery(query).setParameter("id", deptId)
				.getResultList();
	}
    
    @Override
	@Transactional
	public AdditionalInfo saveAdditionalInfo(AdditionalInfo additionalInfo) {
		return entityManager.merge(additionalInfo);
	}
    
    @Override
	@Transactional
	public Integer removeAdditionalInfo(Integer Id) {
		String hql = "Update AdditionalInfo ai set ai.enabled = :enabled "  + 
	             "Where ai.additionalInfoId = :Id";
	Query query = entityManager.createQuery(hql);
	query.setParameter("enabled", false);
	query.setParameter("Id", Id);
	
	int result = query.executeUpdate();
	return result;
	}


}
