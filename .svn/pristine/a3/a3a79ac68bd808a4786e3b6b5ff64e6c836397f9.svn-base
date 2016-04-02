package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Application;
import gapp.model.Department;
import gapp.model.User;
import gapp.model.dao.DepartmentDao;
import org.hibernate.*;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Department getDepartmentById(Integer id) {
		return entityManager.find(Department.class, id);
	}

	@Override
	public List<Department> getDepartments() {
		return entityManager.createQuery("from Department where enabled = true order by id",
				Department.class).getResultList();
	}

	@Override
	public List<Object[]> getDepartmentsWithProgram() {
		TypedQuery<Object[]> q = entityManager
				.createQuery(
						"select  e.departmentName as deptName, e.departmentId as deptId, count(dp.programId) as count from "
								+ "Department as e left join e.deptprogram as dp with dp.enabled = true where e.enabled = true  group by  e.departmentName, e.departmentId",
						Object[].class);
		List<Object[]> recs = q.getResultList();

		
		return recs;
	}

	@Override
	@Transactional
	public Department saveDepartment(Department dept) {
		return entityManager.merge(dept);
	}
	
	@Override
	@Transactional
	public Integer UpdateDepartment(Integer id, String deptName){
		
		String hql = "Update Department dp set dp.departmentName = :deptName , dp.enabled = :enabled "  + 
	             "Where dp.departmentId = :deptId";
	Query query = entityManager.createQuery(hql);
	query.setParameter("deptName", deptName);
	query.setParameter("enabled", true);
	query.setParameter("deptId", id);
	
	int result = query.executeUpdate();
    
		//Query query = entityManager.createQuery("Update Department SET departmentName = :deptName Where departmentId = :Id", Department.class).setParameter("deptName", deptName).setParameter("Id", id);
		//int result = query.executeUpdate();
		return result;
	}

}
