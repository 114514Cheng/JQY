package biz;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import dao.ReservationDao;
import dao.SightDao;
import dao.UserDao;
import entity.Res_Display;
import entity.Reservation;

/**
 * Session Bean implementation class ManageBean
 */
@Stateless
@LocalBean
public class ManageBean {
	@EJB
	private ReservationDao resDao;
	@EJB
	private SightDao sightDao;
    /**
     * Default constructor. 
     */
    public ManageBean() {
        // TODO Auto-generated constructor stub
    }
    

	public List<Res_Display> getAllReservation() {
		return resDao.getAllReservation();
	}


	public boolean saveSight(int id, String explain) {
		// TODO Auto-generated method stub
		return sightDao.saveSight(id,explain);
	}


	public boolean saveFacility(int id, String explain) {
		return sightDao.saveFacility(id,explain);
	}

}
