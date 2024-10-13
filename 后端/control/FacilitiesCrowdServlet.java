package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import entity.Facility;
import entity.FacilityBref;
import entity.Reservation;
import entity.Sight;

/**
 * Servlet implementation class FacilitiesCrowdServlet
 */
@WebServlet("/FacilitiesCrowdServlet")
public class FacilitiesCrowdServlet extends HttpServlet {
	@EJB private biz.SightFacilityBean sightFacilityBean;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacilitiesCrowdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取请求参数中的id
        int id = Integer.parseInt(request.getParameter("id"));

        // 获取指定id的设施信息
        List<Facility> facilities = sightFacilityBean.getsightInfo(id);

        

        // 设置响应内容类型为JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // 使用Jackson将列表转换为JSON字符串并写入响应
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(facilities);
        response.getWriter().write(json);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
