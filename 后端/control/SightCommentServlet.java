package control;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import entity.Facility;
import entity.SightComment;

/**
 * Servlet implementation class SightCommentServlet
 */
@WebServlet("/SightCommentServlet")
public class SightCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB private biz.SightLoadBean sightBean;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SightCommentServlet() {
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
        	List<SightComment> comments = sightBean.getSightComments(sightid);
        	// 设置响应内容类型为JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // 使用Jackson将列表转换为JSON字符串并写入响应
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(comments);
            response.getWriter().write(json);
        }catch(Exception e) {
        	e.printStackTrace();
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
