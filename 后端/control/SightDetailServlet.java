package control;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import entity.Sight;

/**
 * Servlet implementation class SightDetailServlet
 */
@WebServlet("/SightDetailServlet")
public class SightDetailServlet extends HttpServlet {
	@EJB private biz.SightLoadBean sightBean;
	@EJB private dao.SightDao sightDao;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SightDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding(StandardCharsets.UTF_8.name());
        response.setCharacterEncoding(StandardCharsets.UTF_8.name());
        response.setContentType("application/json; charset=UTF-8");
        try {
            int sightid = Integer.parseInt(request.getParameter("id"));
            System.out.println("Received request for sight ID: " + sightid);

            Sight sight = sightBean.getSight(sightid);
            System.out.print("sight成功返回");

            //System.out.println("Sight object received: " + (sight == null ? "null" : sight.toString()));
            System.out.print("sight info"+sight);
            
            ObjectMapper mapper = new ObjectMapper();
            String json  = mapper.writeValueAsString(sight);
            response.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error");
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
