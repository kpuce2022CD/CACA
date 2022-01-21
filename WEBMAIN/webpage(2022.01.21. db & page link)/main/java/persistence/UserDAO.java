package persistence;  // DB와 연동하여 기능하는 DAO class.

// DB 질의를 통하여 데이터에 접근하는 객체
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;   // 데이터 전달을 메서드와 '?' 를 이용해서 전달 가능하게 해주는 모듈. 기본적으로는 쿼리문 호출.

public class UserDAO {
	
	private static UserDAO userDAO = new UserDAO();
	
	// 싱글톤. 해당 패턴은 객체 생성 시 딱 한번 생성자가 호출되면서 객체를 만들며 사용. (생성자 안에 DB연결 부분 넣으면 작동 안함.)
	public static UserDAO getInstance() {
		return userDAO;
	}
	
	Connection con = null;				// DB접속
	PreparedStatement pstmt = null;     // 쿼리문 저장될 변수
	ResultSet rs = null; 				// SQL문 실행결과 저장될 변수 선언  
	
	// 객체 생성 시 DB 커넥션 생성
	private UserDAO() {
		System.out.println("UserDAO 생성자 생성");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("DB 연결 성공");
		}catch (Exception e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
	}
	
	// DB 연결 끊어주는 함수
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 로그인 수행. (메서드마다 처음에 DB연결을 하게 해야함.)
	public int login(String id, String pw){  // 매개변수 id와 pw를 받음.
		try {
			
			// rds 연결 전에 필요한 정보들 선언
		    String dbName = "clonet_database";
		    String userName = "admin";
		    String password = "qwer1234";
		    String hostname = "";

		    String jdbcUrl = "jdbc:mysql://" + hostname + "/" + dbName; /*"?user=" + userName + "&password=" + password;*/
		    
		    con = DriverManager.getConnection(jdbcUrl, userName, password);
		    
		    System.out.println("DB connection success");
		      
			StringBuffer query = new StringBuffer();   // 쿼리문이 저장될 스트링 버퍼 선언.
			query.append("SELECT user_pw").append(" from user").append(" WHERE user_id = ?");
			
			
			pstmt = con.prepareStatement(query.toString());  // sql문을 문자열로 만들고, prepareStatement 클래스 객체 만듬.
			// 바로 connection 객체로 생성할 때, sql을 보내고 ? 안의 값을 세팅한다.
			pstmt.setString(1, id); // pstmt.setString(1, id) 는 첫번째 ? 에 id 변수를 셋팅한다.
			// pstmt.executeQuery -> select -> ResultSet 반환
			rs = pstmt.executeQuery();  // pstmt 에 저장된 sql문의 결과값을 반환함.
			
			if (rs.next()) {  // 입력받은 pw와 db에 저장된 pw가 같을 때, 
				if(rs.getString("user_pw").equals(pw)) {  // 입력된 pw랑 user_pw에 저장된 값이 같을 때,
					return 1;   // 1을 반환한다.
				} else {       
					return 0;   // 다를때는 0을 반환한다.
				}
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {  // DB 정보 불러오고 결과 출력했으면 바로 끊어져야함.
			this.close(con, pstmt, rs);
			System.out.println("DB disconnected");
		}
		return -1;
	}
	
}

