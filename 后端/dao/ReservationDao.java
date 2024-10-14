package dao;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.jboss.ejb.client.EJBReceiverInvocationContext.ResultProducer;

import entity.Res_Display;
import entity.Reser_ref;
import entity.Reservation;
@Stateless
public class ReservationDao {
	@PersistenceContext(unitName = "TravelProject")
    private EntityManager manager;

	public List<Reservation> getReservation() {
		// TODO Auto-generated method stub
		try {
			TypedQuery<Reservation> query = manager.createQuery("SELECT r FROM Reservation r", Reservation.class);
			List<Reservation> reservations = query.getResultList();
            return reservations;
        } catch (NoResultException e) {
            System.out.println("No user found with the given name.");
            return null;
        } 
	}

	public List<Res_Display> getAllReservation() {
		List<Res_Display>res_Displays = new ArrayList<>();
		TypedQuery<Object[]> query = manager.createQuery("SELECT r.userid,r.sightid, r.time ,r.down FROM Reservation r", Object[].class);
		//根据选出的所有的reservation进行处理，处理日期、根据userid得到username、根据sightid得到sightname
		List<Object[]> results = query.getResultList();
        if (results.isEmpty()) {
            return null;
        }  
        
        for (Object[] result : results) {
        	int userId = (int) result[0];
            int sightId = (int) result[1];
            java.sql.Date date = (java.sql.Date) result[2];
            String down = "是";

            // 查询 sight 表中 sightId 为指定值的记录
            TypedQuery<String> sightQuery = manager.createQuery("SELECT s.name FROM Sight s WHERE s.id = :sightId", String.class);
            sightQuery.setParameter("sightId", sightId);
            
            //查询 user 表中 userId 为指定值的记录
            TypedQuery<String> userQuery = manager.createQuery("SELECT u.name FROM User u WHERE u.id = :userId", String.class);
            userQuery.setParameter("userId", userId);
                
            String sightName = sightQuery.getSingleResult();
            String userName = userQuery.getSingleResult();
//            System.out.println("this is username:"+userName);
//            System.out.println("this is sightname:"+sightName);
            Res_Display res = new Res_Display();
            res.setDate(date.toString());
            res.setUserName(userName);
            res.setSightName(sightName);
            res.setDown(down);
            System.out.println("this is username:"+res.getUserName());
            System.out.println("this is sightname:"+res.getSightName());
            res_Displays.add(res);
        }
		
		return res_Displays;
	}

}
