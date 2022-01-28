package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import persistence.UserDAO;  // DB 정보 정의하는 UserDAO import
import domain.UserVO;

// url 매핑 처리하는 코드
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    // doGet은 Login.jsp 에서 옴. 로그인 이미지를 띄워주기만 함.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
		rd.forward(request, response);

	}
    
	// jsp에서 입력한 값과 DB 저장된 값을 비교하여 로그인 처리할 것. (post 연결)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");  // 오류 날 수 있으니, 인코딩 utf-8로 진행.
		String id = request.getParameter("id");  // jsp 쪽에서 불러온 파라미터를 string에 저장함.
		String pw = request.getParameter("pw");
		
		UserVO vo = new UserVO();  // 입력한 id와 pw 저장하기 위함.
		
		// vo 객체에 id, pw 저장
		vo.setUser_id("id");
		vo.setUser_pw("pw");
		
		UserDAO userDao = UserDAO.getInstance();
		int loginResult = userDao.login(id, pw);   // UserDAO 에게서 판별하는 조건이 되는 인스턴스를 받아오는게 제일 중요함.
		
			if (loginResult == 1) {  // 입력된 아이디, 비번 값이 저장된 값과 모두 같으면 리턴 값이 1이다.
				request.setAttribute("loginResult", loginResult);
				HttpSession session = request.getSession();
				
				session.setAttribute("sessionID", id); // 세션에 ID 값 저장.
				
				// 다음 경로는 localhost:// ~ /Home.jsp?id=    로 가야함.  (Home은 뒤에 ?id= 가 달린 모든 루트에 접근 가능.) 아래의 경로는 일단 테스트.
				RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
				rd.forward(request, response);
			} else {  // 1이 아닌 경우에는 로그인 Fail로.
				request.setAttribute("loginResult", loginResult);
				// 세션에는 아무것도 저장하지 않는다. (추후 조건문 처리를 위함.)
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디 또는 비밀번호가 맞지 않습니다.'); location.href='Login.jsp';</script>");
				out.flush();
				//RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp");
				//rd.forward(request, response);
			}
	}
}