package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import gapp.model.Application;
import gapp.model.ProgramTerm;
import gapp.model.Student;
import gapp.model.dao.StudentDetailDao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class StudentDetailDaoImpl implements StudentDetailDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Student> getStudentDetail(Integer applicationId){
		
		String query = "select s from Student s "
	            + "join fetch s.application "
	            + "where s.application.applicationId = :id";

		return entityManager.createQuery( query ).setParameter("id", applicationId)
	            .getResultList();

	}	
	
	@Override
	@Transactional
	public Student saveStudentDetail(Student st) {
		return entityManager.merge(st);
	}
	
	@Override
	public Student getStudentDetailById(Integer applicationId) {
		String query = "select s from Student s "
	            + "join fetch s.application "
	            + "where s.application.applicationId = :id";

		return (Student) entityManager.createQuery( query ).setParameter("id", applicationId).getSingleResult();

	}
}
