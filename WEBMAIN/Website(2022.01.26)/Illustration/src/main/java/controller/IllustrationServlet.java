package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.modeler.modules.ModelerSource;

import domain.IllustVO;
import persistence.IllustDAO;


@WebServlet("/IllustrationServlet")
public class IllustrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IllustrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=UTF-8");
		
		String cmdReq = "";   // true false 판별.
		cmdReq = request.getParameter("cmdReq");

			
			IllustDAO dao = new IllustDAO();
			ArrayList<IllustVO> list = dao.select();
			
			request.setAttribute("IllustList", list);
			
			RequestDispatcher view = request.getRequestDispatcher("Illustration.jsp");  // Illustratrion 페이지에 쏘기.
			view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
}
