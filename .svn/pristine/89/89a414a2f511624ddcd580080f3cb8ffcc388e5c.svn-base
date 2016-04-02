package gapp.model;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.hibernate.Query;

public class Test {
	
	public static void main(String[] args)   
	 {  
		 EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("gapp");
	        EntityManager entityManager = entityManagerFactory.createEntityManager();
	 
	        User e2 = entityManager.find( User.class, 2 );
	        System.out.println( e2.getFirst_name() );

	        
		//final Session session = sessionFactory.openSession();
	      /*  TypedQuery<Object[]> q =  entityManager.createQuery("select  e.departmentName, e.departmentId, count(dp.programId) from " +
                "Department as e left join e.deptprogram as dp  group by  e.departmentName, e.departmentId", Object[].class);
        List<Object[]> recs = q.getResultList();
        List<ListDepartment> st = new ArrayList<ListDepartment>();
        for (Object[] line : recs) {
        	st.add(new ListDepartment(Integer.parseInt(line[1].toString()), line[0].toString(), Integer.parseInt(line[2].toString())));
            System.out.println("Total entities under Master with id " + line[0] + " is " + line[2] + " dept id :" + line[1] );
        }*/
	        String hql = "DELETE from DepartmentProgram dp "
					+ "WHERE dp.programId = :id";
			javax.persistence.Query query = entityManager.createQuery(hql);
			query.setParameter("id", 3);
			@SuppressWarnings("unused")
			int result = query.executeUpdate();
			//return result;



		 System.out.println("Total entities under Master with id " + result);
        entityManager.close();
        entityManagerFactory.close();
}}
