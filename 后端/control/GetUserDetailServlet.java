package control;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hornetq.utils.json.JSONException;
import org.hornetq.utils.json.JSONObject;
import org.jboss.resteasy.util.IsAssignableFrom;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.UserDao;
import entity.User;
import utils.PasswordUtils;

/**
 * Servlet implementation class GetUserDetailServlet
 */
@WebServlet("/GetUserDetailServlet")
public class GetUserDetailServlet extends HttpServlet {
	@EJB private biz.UserDetailBean userdetailbean;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUserDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("servlet!");
		String nameString = request.getParameter("name");
		//System.out.print(nameString);
		User user = userdetailbean.getUserDetail(nameString);
		System.out.print(nameString);
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
		if(user!=null) {
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(user);
            response.getWriter().write(json); 
		}else {
			System.out.print("user is null");
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    String newPassword = request.getParameter("newPassword");
	    String newPasswordSec = request.getParameter("newPasswordSec");

	    User user = userdetailbean.getUserDetail(name);
	    boolean res = true;

	    if(user == null) {
	        System.out.println("不存在用户！");
	        res = false; // 用户不存在时，res 设为 false
	    } else {
	        if (!user.getEmail().equals(email)) {
	            res = false;
	        }
	        if (user.getPhone() == null || !user.getPhone().equals(phone)) { // 检查 user.getPhone() 是否为 null
	            res = false;
	        }
	        if (!newPassword.equals(newPasswordSec)) {
	            res = false;
	        }
	    }
	    
	    
	    //后面修改的话上面可以不改，只看下面即可
	    if(res) {
	    	//说明提供的资料都是正确的，下面进行修改验证
	    	if(!PasswordUtils.validatePassword(newPassword)) {
	    		System.out.println("密码格式不正确！");
	    		res = false;
	    	}else {
	    		//完全符合要求，对数据库中的密码进行修改
	    		res = userdetailbean.resetPass(name,newPasswordSec);
	    	}
	    }
	    
	    ObjectMapper mapper = new ObjectMapper();
	    String json = mapper.writeValueAsString(res);
	    response.getWriter().write(json);
	}


}
