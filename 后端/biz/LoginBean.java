package biz;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import dao.UserDao;

/**
 * Session Bean implementation class LoginBean
 */
@Stateless
@LocalBean
public class LoginBean implements LoginBeanLocal {
	@EJB
	private UserDao userDao;
    /**
     * Default constructor. 
     */
    public LoginBean() {
        // TODO Auto-generated constructor stub
    	
    }

	@Override
	public int login(String name, String password) {
		// TODO Auto-generated method stub
		int res = userDao.login(name,password);
		return res;//返回0代表没有对应用户，返回1代表用户被ban，返回2代表一切正常；
	}

	@Override
	public boolean loginManager(String name, String password) {
		// TODO Auto-generated method stub
		boolean res = userDao.loginManager(name,password);
		return res;//返回0代表没有对应用户，返回1代表用户被ban，返回2代表一切正常；
	}

}
