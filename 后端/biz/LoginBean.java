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
	public boolean login(String name, String password) {
		// TODO Auto-generated method stub
		boolean res = userDao.login(name,password);
		return res;
	}

}
