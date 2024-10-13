package biz;

import java.util.Collection;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import dao.SightDao;
import entity.Facility;

/**
 * Session Bean implementation class SightFacilityBean
 */
@Stateless
@LocalBean
public class SightFacilityBean {
	@EJB
	private SightDao sightDao;
    /**
     * Default constructor. 
     */
    public SightFacilityBean() {
        // TODO Auto-generated constructor stub
    }
	public List<Facility> getsightInfo(int id) {
		// TODO Auto-generated method stub
		return sightDao.getsightInfo(id);
	}

}
