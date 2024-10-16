package biz;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateful;

import dao.ReservationDao;
import dao.SightDao;
import dao.UserDao;
import entity.Reservation;
import entity.Sight;
import entity.User;

/**
 * Session Bean implementation class BookBean
 */
@Stateful
@LocalBean
public class BookBean {
	@EJB
	private SightDao sightDao;
	@EJB
	private UserDao userDao;
	@EJB
	private ReservationDao reservationDao;
    /**
     * Default constructor. 
     */
    public BookBean() {
        // TODO Auto-generated constructor stub
    }

    public int book(String username,int sightid,String bookdate) {
    	User user = userDao.getUserDetail(username);
    	Sight sight = sightDao.getSight(sightid);
    	return sightDao.book(user,sight,bookdate);
    }
    
    public List<Reservation> getReservation() {
    	return reservationDao.getReservation();
    }
}
