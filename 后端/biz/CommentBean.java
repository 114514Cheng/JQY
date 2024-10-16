package biz;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import com.fasterxml.jackson.databind.jsontype.impl.AsExistingPropertyTypeSerializer;

import dao.UserDao;

/**
 * Session Bean implementation class CommentBean
 */
@Stateless
@LocalBean
public class CommentBean {
	@EJB private UserDao userDao;
    /**
     * Default constructor. 
     */
    public CommentBean() {
        // TODO Auto-generated constructor stub
    }

    public boolean sendComment(int userid, int sightid ,String content) {
    	return userDao.sendComment(userid,sightid,content);
    }
}
