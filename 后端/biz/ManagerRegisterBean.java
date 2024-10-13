package biz;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import dao.UserDao;

/**
 * Session Bean implementation class ManagerRegisterBean
 */
@Stateless
@LocalBean
public class ManagerRegisterBean {
	@EJB
	private UserDao userDao;
    /**
     * Default constructor. 
     */
    public ManagerRegisterBean() {
        // TODO Auto-generated constructor stub
    }
    
    public boolean managerRegister(String name, String pass, String gender, String email,String telnumber,String innercode) {
    	return userDao.register(name,pass,gender,email,telnumber,1,innercode);
    }

}
