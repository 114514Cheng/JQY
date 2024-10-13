package biz;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import dao.SightDao;
import dto.SightDTO;
import entity.Sight;
import entity.SightComment;
import entity.Sight_detail;

/**
 * Session Bean implementation class SightLoadBean
 */
@Stateless
@LocalBean
public class SightLoadBean {
	@EJB
	private SightDao sightDao;
    /**
     * Default constructor. 
     */
    public SightLoadBean() {
        // TODO Auto-generated constructor stub
    }
    
    public Sight getSight(int sightid) {
    	System.out.print("进入getSight！ sighid："+sightid);
    	Sight sight = sightDao.getSight(sightid);
    	System.out.print("bean执行完毕");
    	return sight;
    }

	public List<Sight_detail> getDetail(int sightid) {
		return sightDao.getDetail(sightid);
	}
	
	public List<SightComment> getSightComments(int sightid){
		return sightDao.getComments(sightid);
	}
}
