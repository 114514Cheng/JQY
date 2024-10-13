package biz;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import dao.UserDao;

@Stateless
@LocalBean
public class RegisterBean {
    @EJB
    private UserDao userDao;

    public boolean register(String name, String pass, String gender, String email,String telnumber) {
        boolean res = userDao.register(name, pass, gender, email,telnumber,0,"");
        return res;
    }
}