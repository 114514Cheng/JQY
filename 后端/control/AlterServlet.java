package control;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class AlterServlet
 */
@WebServlet("/AlterServlet")
public class AlterServlet extends HttpServlet {
	@EJB
	private biz.UserDetailBean userDetailBean;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("username");
		String pasString = request.getParameter("password");
		String genderString = request.getParameter("gender");
		String emailString = request.getParameter("email");
		
		boolean res = userDetailBean.alter(name,pasString,genderString,emailString);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(res);
		response.getWriter().write(json); 
		
	}

}
