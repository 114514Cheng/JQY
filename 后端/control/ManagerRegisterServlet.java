package control;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManagerRegisterServlet
 */
@WebServlet("/ManagerRegisterServlet")
public class ManagerRegisterServlet extends HttpServlet {
	@EJB private biz.ManagerRegisterBean registerbean;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String telnumber = request.getParameter("telnumber");
		String innercode = request.getParameter("innercode");
		/*
		 * System.out.println(username); System.out.println(password);
		 * System.out.println(gender); System.out.println(email);
		 */
		boolean res = registerbean.managerRegister(username,password,gender,email,telnumber,innercode);
		if(res) {
			response.getWriter().write("User registered successfully!");
		}else {
			response.getWriter().write("User registered failed!");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
