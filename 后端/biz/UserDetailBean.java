package biz;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import dao.UserDao;
import entity.Reser_ref;
import entity.User;

/**
 * Session Bean implementation class UserDetailBean
 */
@Stateless
@LocalBean
public class UserDetailBean {
	@EJB
	private UserDao userDao;
    /**
     * Default constructor. 
     */
    public UserDetailBean() {
        // TODO Auto-generated constructor stub
    }
    public User getUserDetail(String name) {
    	//返回user对象到GetUserDetailServlet
    	//System.out.print("userdetailbean!");
    	return userDao.getUserDetail(name);
    }
    public boolean resetPass(String name,String newpass) {
    	return userDao.resetPass(name,newpass);
    }
	public boolean alter(String name, String pasString, String genderString, String emailString) {
		// TODO Auto-generated method stub
		
		return userDao.alter(name,pasString,genderString,emailString);
	}
	public List<Reser_ref>getResv_ref(int userid) {
		// TODO Auto-generated method stub
		
		return userDao.getResv_ref(userid);
	}
	
	public String getUserById(int userid) {
		return userDao.getUserById(userid);
	}
	
	public List<User> getUsers(){
		return userDao.getUsers();
	}
	public boolean banUser(int userid) {
		return userDao.banUser(userid);
	}
	public boolean unBanUser(int userid) {
		return userDao.unBanUser(userid);
	}
}
