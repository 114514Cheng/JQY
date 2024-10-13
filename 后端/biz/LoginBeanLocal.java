package biz;

import javax.ejb.Local;

@Local
public interface LoginBeanLocal {
	public boolean login(String name,String password); 
}
