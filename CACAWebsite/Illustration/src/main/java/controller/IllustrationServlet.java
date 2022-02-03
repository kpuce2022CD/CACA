package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import domain.IllustVO;
import persistence.IllustDAO;


@WebServlet("/IllustrationServlet")
public class IllustrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IllustrationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=UTF-8");
		
			String cmdReq = "";
			cmdReq = request.getParameter("cmdReq");
		
			IllustDAO dao = new IllustDAO();
			ArrayList<IllustVO> list = dao.select();  // DAO에 있는 정보 불러오고, 배열에 저장.
				
			request.setAttribute("IllustList", list);
				
			RequestDispatcher illust = request.getRequestDispatcher("Illustration.jsp");  // Illustratrion 페이지에 쏘기.
			illust.forward(request, response);
		
		
		// checked 라는 파라미터가 반환 되었을 때.
		//if(cmdReq.equals("checked"))
		//{
			//IllustDAO dao2 = new IllustDAO();
			///ArrayList<IllustVO> check = dao2.select();  // DAO에 있는 정보 불러오고, 배열에 저장.
			
			// boolean photo_check가 true로 된 것만 반환.
			//if(check.getPhoto_check() == true) {
				
				//request.setAttribute("Checked_Illust", list);   // Attribute 이름을 Checked_Illust 라고 놓음.
				
				//RequestDispatcher illust_true = request.getRequestDispatcher("IllustPreview.jsp");
				//illust_true.forward(request, response);
			//}
		//}
		

		/*
		// make link! button 클릭 했을 때
		if (cmdReq.equals("linked"))
		{
			IllustDAO dao2 = new IllustDAO();
			ArrayList<IllustVO> check = dao2.select();  // DAO에 있는 정보 불러오고, 배열에 저장.
			
			request.setAttribute("Linked_Illust", illust_link);
			
			RequestDispatcher illust_link = request.getRequestDispatcher("IllustLink.jsp");
			illust_link.forward(request, response);
		}
		*/

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=UTF-8");
		
		/*
		String cmdReq = "";
		cmdReq = request.getParameter("cmdReq");
		
		if(cmdReq.equals("checked"))   // 
		{
			IllustVO check = new IllustVO();  // 변수 다르게 선언.
			
			check.setPhoto_check(request.getParameter("photo_check"));
			
			// true가 체크된 이미지만 set 되어야 한다. (true 판별 기준은 체크 이벤트로 받아온 것.)
			request.setAttribute("IllustList", list_true);  // 페이지 쏘는 것 까지는 동일.
			
			// true 체크된 이미지만 IllustPreview.jsp 페이지에 쏜다.
			RequestDispatcher illust_true = request.getRequestDispatcher("IllustPreview.jsp");
			illust_true.forward(request, response);
		}
	
		
		// make link! button 클릭 했을 때
		if (cmdReq.equals("linked"))
		{		
			IllustDAO dao_true = new IllustDAO();  // 변수 다르게 선언.
			ArrayList<IllustVO> list_true = dao_true.select();
			
			// true가 체크된 이미지만 set 되어야 한다. (true 판별 기준은 체크 이벤트로 받아온 것.)
			request.setAttribute("IllustList", list_true);  // 페이지 쏘는 것 까지는 동일.
			// 문자열 형태의 url을 IllustLink.jsp 페이지에 쏜다.
			
			
			
			RequestDispatcher illust_link = request.getRequestDispatcher("IllustLink.jsp");  // 
			illust_link.forward(request, response);
		}
		*/
		
	}
}
