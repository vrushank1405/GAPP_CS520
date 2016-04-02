package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Student;
import gapp.model.StudentEducationInfo;
import gapp.model.dao.StudentEducationalInfoDao;

@Repository
public class StudentEducationalInfoDaoImpl implements StudentEducationalInfoDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<StudentEducationInfo> getStudentEducationalInfo(Integer applicationId){
		
		String query = "select sei from StudentEducationInfo sei "
	            + "join fetch sei.application "
	            + "where sei.application.applicationId = :id and sei.enabled = :enabled";

	  
    	return entityManager.createQuery( query ).setParameter("id", applicationId).setParameter("enabled", true)
	            .getResultList();

	}
	
	@Override
	@Transactional
	public StudentEducationInfo saveStudentEducationInfo(StudentEducationInfo stEduinfo) {
		return entityManager.merge(stEduinfo);
	}
	
	@Override
	@Transactional
	public void removeStudentEducation(Integer Id) {
		String hql = "Update StudentEducationInfo sei set sei.enabled = :enabled "  + 
	             "Where sei.educationInfoId = :Id";
	Query query = entityManager.createQuery(hql);
	query.setParameter("enabled", false);
	query.setParameter("Id", Id);
	
	int result = query.executeUpdate();
	}

	
}
