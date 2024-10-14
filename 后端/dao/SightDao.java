package dao;

import javax.ejb.Stateless;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import entity.Facility;
import entity.Ref_sight_facility;
import entity.Reservation;
import entity.Sight;
import entity.SightComment;
import entity.SightDisplay;
import entity.Sight_detail;
import entity.User;
@Stateless
public class SightDao {
	@PersistenceContext(unitName = "TravelProject")
    private EntityManager manager;
	
	public Sight getSight(int sightid) {
	    System.out.println("进入dao层的getSight");
	    System.out.println("id:" + sightid);
	    
	    try {
	        TypedQuery<Sight> query = manager.createQuery("SELECT s FROM Sight s WHERE s.id = :id", Sight.class);
	        query.setParameter("id", sightid);
	        
	        System.out.println("进入dao层的getSight2");
	        Sight sight = query.getSingleResult();
	        System.out.print("sight:"+sight.getExplain());
	        System.out.println("结束dao层的getSight");
	        Sight sight2 = new Sight();
	        sight2.setExplain(sight.getExplain());
	        sight2.setName(sight.getName());
	        sight2.setId(sight.getId());
	        return sight2;
	    } catch (Exception e) {
	    	System.out.print("出错！");
	        e.printStackTrace();
	        
	        return null;
	    }
	}



	public boolean book(User user, Sight sight,String bookdate) {
		//首先要查数据库，看看这位用户是否已经预约这个景点
		TypedQuery<Reservation> query = manager.createQuery("SELECT r FROM Reservation r WHERE r.userid = :userid AND r.sightid = :sightid", Reservation.class);
		query.setParameter("userid", user.getId());
		query.setParameter("sightid", sight.getId());
		try {
		    Reservation reservation = query.getSingleResult();
		    // 找到了匹配的实体，说明已经预约过景点
		    return false;
		    
		} catch (NoResultException e) {
		    //说明没有预约过景点，下面进行预约
			Reservation reservation = new Reservation();
			reservation.setUser(user.getId());
			reservation.setSight(sight.getId());
			java.sql.Date sqlDate = java.sql.Date.valueOf(bookdate);
			reservation.setDate(sqlDate);
			//转化bookdate为sql中的date类型
			reservation.setDown(false);
			manager.persist(reservation);
			return true;
		}

		

	}

	public List<Facility> getsightInfo(int sightId) {
		List<Facility>facilities = new ArrayList<Facility>();
		TypedQuery<Ref_sight_facility>Query = manager.createQuery("SELECT r FROM Ref_sight_facility r WHERE r.sightid = :sightId",Ref_sight_facility.class);
		Query.setParameter("sightId",sightId );
		List<Ref_sight_facility> rsf = Query.getResultList();
		if(rsf.isEmpty()) {
			return null;
		}
		
		TypedQuery<Facility>query2 = manager.createQuery("SELECT f FROM Facility f WHERE f.id = :facilityid",Facility.class);
		for(Ref_sight_facility r:rsf) {
			query2.setParameter("facilityid",r.getFacilityid());
			facilities.add(query2.getSingleResult());
		}
		return facilities;
//	    // 使用 JPQL 查询并执行 fetch join，立即加载关联的 Sight 对象
//		TypedQuery<Facility> query = manager.createQuery(
//                "SELECT f FROM Sight s JOIN s.facilities f WHERE s.id = :sightId", Facility.class);
//	    query.setParameter("sightId", sightId);
//	    List<Facility> facilities = query.getResultList();
//	    for (Facility facility : facilities) {
//	        // 这里你可以在控制台打印一些信息，以确保已加载所有关联对象
//
//	        System.out.println("Facility ID: " + facility.getId());
//	        System.out.println("Facility Explain: " + facility.getExplain());
//	        // 如果需要，你可以继续访问其他关联对象，例如 facility.getSights()
//	    }
//	    return facilities;
	}



	public List<Sight_detail> getDetail(int sightid) {
		// TODO Auto-generated method stub
		List<Sight_detail>sight_details = new ArrayList<Sight_detail>();
		TypedQuery<Sight_detail>query = manager.createQuery("SELECT s FROM Sight_detail s WHERE s.sightid = :sightid",Sight_detail.class);
		query.setParameter("sightid", sightid);
		sight_details = query.getResultList();
		System.out.print("img:"+sight_details.get(0).getImage());
		return sight_details;
	}
	
	public List<SightComment> getComments(int sightid){
		List<SightComment> sightComments = new ArrayList<SightComment>();
		TypedQuery<SightComment>query = manager.createQuery("SELECT c FROM SightComment c WHERE c.sightId = :sightId",SightComment.class);
		query.setParameter("sightId", sightid);
		sightComments = query.getResultList();
		
		return sightComments;
	}



	public List<SightDisplay> getAllSights() {
		List<SightDisplay>sightDisplays = new ArrayList<SightDisplay>();
		TypedQuery<Facility>query = manager.createQuery("SELECT f FROM Facility f",Facility.class);
		List<Facility>facilities = new ArrayList<Facility>();
		facilities = query.getResultList();//获取所有的Facility
		//测试版
		TypedQuery<Sight>query2 = manager.createQuery("SELECT s FROM Sight s",Sight.class);
		List<Sight>sights = new ArrayList<Sight>();
		sights = query2.getResultList();
		TypedQuery<Integer>query3 = manager.createQuery("SELECT rsf.facilityid FROM Ref_sight_facility rsf WHERE rsf.sightid = :sightid",Integer.class);
		List<Integer>indexList = new ArrayList<Integer>();
		List<Facility>facilities2 = new ArrayList<Facility>();
		for(Sight sight:sights) {
			facilities2.clear();
			SightDisplay sightDisplay = new SightDisplay();
			
			query3.setParameter("sightid", sight.getId());
			indexList = query3.getResultList();
			for(Integer index:indexList) {
				facilities2.add(facilities.get(index-1));
				System.out.println("this is facility name:"+facilities.get(index-1).getName());
			}
			
			sightDisplay.setId(sight.getId());
			sightDisplay.setName(sight.getName());
			sightDisplay.setExplain(sight.getExplain());
			sightDisplay.setFacilities(facilities2);
			
			sightDisplays.add(sightDisplay);
		}
		return sightDisplays;
	}



	public boolean saveSight(int id, String explain) {
		Query update = manager.createQuery("UPDATE Sight s SET s.explains = :Explain WHERE s.id = :id");
		update.setParameter("Explain", explain);
		update.setParameter("id", id);
		update.executeUpdate();
		return true;
	}



	public boolean saveFacility(int id, String explain) {
		Query update = manager.createQuery("UPDATE Facility f SET f.explains = :Explain WHERE f.id = :id");
		update.setParameter("Explain", explain);
		update.setParameter("id", id);
		update.executeUpdate();
		return true;
	}

}
