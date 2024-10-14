package biz;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import dao.ReservationDao;
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
    /**
     * Default constructor. 
     */
    public ManageBean() {
        // TODO Auto-generated constructor stub
    }
    

	public List<Res_Display> getAllReservation() {
		return resDao.getAllReservation();
	}

}
