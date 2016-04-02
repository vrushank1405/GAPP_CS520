package gapp.model.dao.jpa;

import gapp.model.Status;
import gapp.model.dao.StatusDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class StatusDaoImpl implements StatusDao {
	
	@PersistenceContext
    private EntityManager entityManager;

    @Override
    public Status getStatus( Integer id )
    {
        return entityManager.find( Status.class, id );
    }

    @Override
    public List<Status> getStatus()
    {
        return entityManager.createQuery( "from Status ", Status.class )
            .getResultList();
    }

}
