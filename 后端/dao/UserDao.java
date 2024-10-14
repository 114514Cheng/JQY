package dao;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import entity.Innercode;
import entity.Reser_ref;
import entity.User;
import utils.PasswordUtils;

@Stateless
public class UserDao {
    @PersistenceContext(unitName = "TravelProject")
    private EntityManager manager;

    public boolean register(String name, String pass, String gender, String email,String telnumber,int mode,String innercode) {
        // 添加调试信息
        //System.out.println("UserDao: manager is " + (manager != null ? "not null" : "null"));
    	if(mode == 1) {
    		TypedQuery<Innercode> query = manager.createQuery("SELECT i FROM Innercode i WHERE i.innercode = :innercode", Innercode.class);
    		query.setParameter("innercode", innercode);
    		List<Innercode>list = query.getResultList();
    		if(!list.isEmpty()) {
    			//说明我们在数据库中找到了合法的innercode
    			
    		}
    		else {
    			System.out.println("内部代码错误！");
    			return false;
    		}
    	}
    	//首先判断用户名是否重复
    	TypedQuery<User> query = manager.createQuery("SELECT u FROM User u WHERE u.name = :name", User.class);
        query.setParameter("name", name);
//        User user = query.getSingleResult();
        List<User>userlist = query.getResultList();
        if(!userlist.isEmpty()) {
        	System.out.println("用户名重复！");
        	return false;
        }
        User user;
    	if(!PasswordUtils.validatePassword(pass)) {
    		System.out.println("密码格式不正确！");
    		return false;
    	}
    	String encryptedPassword = PasswordUtils.encryptPassword(pass);
        if (manager != null) {
            user = new User();
            user.setName(name);
            user.setPass(encryptedPassword);
            user.setGender(gender);
            user.setEmail(email);
            user.setPhone(telnumber);
            manager.persist(user);
            return true;
        } else {
            // 处理 EntityManager 注入失败的情况
            throw new IllegalStateException("EntityManager 注入失败");
        }
    }
    
    public int login(String name,String password) {
    	TypedQuery<User> query = manager.createQuery("SELECT u FROM User u WHERE u.name = :name AND u.password = :password", User.class);
    	String encodePass = PasswordUtils.encryptPassword(password);
    	System.out.println("encrypt code:"+encodePass);
        query.setParameter("name", name);
        query.setParameter("password", encodePass);
        List<User>userlist = query.getResultList();
        if(userlist.isEmpty()) {
        	return 0;//返回0表示没有对应的用户
        }
        //之后检测一下用户是否封禁
        User user = query.getSingleResult();
        int ban = user.getBan();
        if( ban == 1 ) {
        	return 1;//说明被ban了，不准登录
        }
        return 2;//返回2表示一切正常，可以正常登录;
    }
    
    public User getUserDetail(String name) {
        try {
            TypedQuery<User> query = manager.createQuery("SELECT u FROM User u WHERE u.name = :name", User.class);
            query.setParameter("name", name);
            User user = query.getSingleResult();
            System.out.println("电话"+user.getPhone());
            return user;
        } catch (NoResultException e) {
            System.out.println("No user found with the given name.");
            return null;
        } catch (NonUniqueResultException e) {
            // 处理多个结果的情况
        	e.printStackTrace();
        	return null;
        }catch (Exception e) {
            System.out.println("An error occurred: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

	public boolean resetPass(String name,String newpass) {
		User user = manager.createQuery("SELECT u FROM User u WHERE u.name = :name", User.class).setParameter("name", name).getSingleResult();
		if(user !=null) {
			String encodenewPass = PasswordUtils.encryptPassword(newpass);
			user.setPass(encodenewPass);
			manager.merge(user);
			return true;
		}else {
			return false;
		}
		
	}

	public boolean alter(String name, String pasString, String genderString, String emailString) {
		try {
            // 使用 JPQL 更新用户信息
            Query query = manager.createQuery("UPDATE User u SET u.password = :password, u.gender = :gender, u.email = :email WHERE u.name = :username");
            String encodePass = PasswordUtils.encryptPassword(pasString);
            query.setParameter("password", encodePass);
            query.setParameter("gender", genderString);
            query.setParameter("email", emailString);
            query.setParameter("username", name);

            int rowsUpdated = query.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
	}

	public List<Reser_ref> getResv_ref(int userid) {
        // 查询 reservation 表中 userid 为指定值的记录
        TypedQuery<Object[]> query = manager.createQuery(
            "SELECT r.sightid, r.time FROM Reservation r WHERE r.userid = :userid", Object[].class);
        query.setParameter("userid", userid);
        
        List<Object[]> results = query.getResultList();
        if (results.isEmpty()) {
            return null;
        }

        List<Reser_ref> reserRefs = new ArrayList<>();
        
        for (Object[] result : results) {
            int sightId = (int) result[0];
            java.sql.Date date = (java.sql.Date) result[1];
            
            // 查询 sight 表中 sightId 为指定值的记录
            TypedQuery<String> sightQuery = manager.createQuery(
                "SELECT s.name FROM Sight s WHERE s.id = :sightId", String.class);
            sightQuery.setParameter("sightId", sightId);
            
            String sightName = sightQuery.getSingleResult();
            Reser_ref reser_ref = new Reser_ref();
            reser_ref.setDate(date.toString());
            reser_ref.setName(sightName);
            System.out.print("名字："+sightName);
            reserRefs.add(reser_ref);
        }
        
        return reserRefs;
    }

	public String getUserById(int userid) {
		TypedQuery<User>nameQuery = manager.createQuery("SELECT u FROM User u WHERE u.id = :userid",User.class);
		nameQuery.setParameter("userid", userid);
		User user = nameQuery.getSingleResult();
		
		return user.getName();
	}

	public boolean loginManager(String name, String password) {
		TypedQuery<User> query = manager.createQuery("SELECT u FROM User u WHERE u.name = :name AND u.password = :password", User.class);
    	String encodePass = PasswordUtils.encryptPassword(password);
    	System.out.println("encrypt code:"+encodePass);
        query.setParameter("name", name);
        query.setParameter("password", encodePass);
        List<User>userlist = query.getResultList();
        if(userlist.isEmpty()) {
        	return false;//返回0表示没有对应的用户
        }
        //检测身份的int是否是1
        User user = query.getSingleResult();
        int identify = user.getIdentify();
        if(identify==1) {
        	return true;
        }
        else {
        	return false;
        }
	}

	public List<User> getUsers() {
	    List<User> users = new ArrayList<>();

	    try {
	        TypedQuery<User> query = manager.createQuery("SELECT u FROM User u WHERE u.identify = :identify", User.class);
	        query.setParameter("identify", 0);
	        users = query.getResultList();
	    } catch (Exception e) {
	        System.err.println("Error retrieving users: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return users;
	}

	public boolean banUser(int userid) {
		try {
	        Query update = manager.createQuery("UPDATE User u SET u.ban = :ban WHERE u.id = :userid");
	        update.setParameter("userid", userid);
	        update.setParameter("ban", 1);
	        update.executeUpdate();
	        return true;
	    } catch (Exception e) {
	        System.err.println("Error retrieving users: " + e.getMessage());
	        e.printStackTrace();
	        return false;
	    }
	}

	public boolean unBanUser(int userid) {
		try {
	        Query update = manager.createQuery("UPDATE User u SET u.ban = :ban WHERE u.id = :userid");
	        update.setParameter("userid", userid);
	        update.setParameter("ban", 0);
	        update.executeUpdate();
	        return true;
	    } catch (Exception e) {
	        System.err.println("Error retrieving users: " + e.getMessage());
	        e.printStackTrace();
	        return false;
	    }
	}


}
