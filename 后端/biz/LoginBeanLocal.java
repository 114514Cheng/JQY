package biz;

import javax.ejb.Local;

@Local
public interface LoginBeanLocal {
	public int login(String name,String password); 
	public boolean loginManager(String name,String password); 
}
