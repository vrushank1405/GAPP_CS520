package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import gapp.model.DepartmentProgram;
import gapp.model.ProgramTerm;
import gapp.model.dao.ProgramTermDao;

@Repository
public class ProgramTermDaoImpl implements ProgramTermDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public ProgramTerm getProgramTerm(Integer id) {
		return entityManager.find(ProgramTerm.class, id);
	}

	@Override
    public List<ProgramTerm> getProgramTerm()
    {
        return entityManager.createQuery( "from ProgramTerm ", ProgramTerm.class )
            .getResultList();
    }
}
