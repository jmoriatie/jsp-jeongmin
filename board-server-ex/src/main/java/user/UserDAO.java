package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

public class UserDAO {
	// DAO : Date Access Object
	
	// 세션에다가 저장해서, 이 부분 사용하지 않음
	// ㄴ 어떻게 사용하는거야?
	public static final int REMOVE = 0;
	public static final int UPDATE = 1;
	
	// 1. Singletone Pattern
	// ㄴ 중앙관리자의 역할이기 떄문에
	private UserDAO() {}
	
	private static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}
	
	// 2. DTO에 대한 객체 배열 (ArrayList)
	private ArrayList<UserDTO> users = new ArrayList<UserDTO>();
	
	// 3. 실제 데이터 베이스에 연동할 객체들 (SQL객체)
	// ㄴ 1) Connection 		   	: DB 연동 
	// ㄴ 2) PreparedStatement 	: DB에 쿼리를 날릴 준비
	// ㄴ 3) ResultSet 			: excute된 쿼리에 대한 결과값을 가져와줌
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;	
	private ResultSet rs = null;
	
	public Connection getConnection() {
		try {
			// 드라이버 연동 (jdbc mysql connector (.jar)를  -> WEB-INF/lib 폴더로 넣어주기)
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// jdbc:mysql://localhost:3306/데이터베이스스키마명?serverTimezone=UTC
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC"; // 데이터베이스 주소
			String id = "root";
			String pw = "mymySql00";
			
			conn = DriverManager.getConnection(url, id, pw);
			
			if(conn != null) { // null 이 뜨면 성공이 될 예정임
				System.out.println("데이터베이스 연동 성공!");
			}
			else {
				System.out.println("DB연동 실패!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	// 데이터 조회 (객체 배열을 초기화 - 가져온 데이터에 대해서)
	public ArrayList<UserDTO> getUsers() {
		// 쿼리를 스트링 타입으로 작성
		try {
			conn = getConnection(); 				// DB 연동
			
			String str = "select * from users";		// spl 쿼리를 준비
			pstmt = conn.prepareStatement(str);		// 쿼리를 prepareStatement() 메소드를 활용하여 태움
			rs = pstmt.executeQuery();				// 쿼리를 날림과 동시에 rs로 결과값을 받음 (객체로 가져옴)
			
			users = new ArrayList<>(); // 초기화
			while(rs.next()) {	// 행(row) 단위 
				String id = rs.getString(1); // id
				String pw = rs.getString(2); // pw
				Timestamp regDate = rs.getTimestamp(3); // regdate

				users.add(new UserDTO(id, pw, regDate)); // 만들어놓은 객체에 추가
			}
			
			System.out.println("데이터 불러오기 완료");
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터 불러오기 실패");
		}
		return users;
	}
	
	// 유저 한명만 셀렉
	// ㄴ 중복검사 가입과정에서 진행해서 id로만 식별
	public UserDTO getOneUser(String id) { 
		users = getUsers();
		for(UserDTO u : users) {
			if(u.getId().equals(id)) {
				return u;
			}
		}
		return null;
	}
	
	//addUser()
	public int addUser(UserDTO user) {
		// 밀리세컨 단위를 넣어줘야함
//		Calendar cd = Calendar.getInstance();
//		Timestamp regDate = new Timestamp(cd.getTimeInMillis());
		if(checkUser(user.getId())) {
			try {
				UserDTO newUser = new UserDTO(user.getId(), user.getPw(), new Timestamp(Calendar.getInstance().getTimeInMillis())); 

				conn = getConnection();
				
				String str = "insert into users values(?, ?, ?)";	// ? 자리는 맵핑값을 setter로 처리할 포맷이다 
				pstmt = conn.prepareStatement(str);
				pstmt.setString(1, newUser.getId());
				pstmt.setString(2, newUser.getPw());
				pstmt.setTimestamp(3, newUser.getRegDate());		// 여기까지 쿼리 완성
				
				pstmt.executeUpdate();								// 완성된 쿼리를 연동된 데이터베이스에 날림		<< DB
				
				users.add(newUser);									// 실행중인 상태에서 dao의 객체배열도 업데이트 	<< DAO
				
				System.out.println("가입 성공");
				
				pstmt.close();
				conn.close();
				
				return users.size();
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("가입 실패");
			}
		}
		return -1;
	}
	
	public boolean checkLogin(String id, String pw) {
		users = getUsers();
		for(UserDTO user : users) {
			if(user.getId().equals(id) && user.getPw().equals(pw)) {
				return true;
			}
		}
		return false;
	}
	
	// deletelUser()
	public int deletelUser(String id, String pw) {
		users = getUsers();
		int delIdx = -1;
		for(int i=0; i<users.size(); i++) {
			if(id.equals(users.get(i).getId()) && pw.equals(users.get(i).getPw())) {
				delIdx = i;
			}
		}
		
		if(delIdx != -1) {
			try {
				conn = getConnection();
				String sql = "DELETE FROM users where id=?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				pstmt.executeUpdate(); // db
				
				System.out.println("삭제 성공"); // dao
				return delIdx;

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("삭제 실패");
			}
		}
		return -1;
	}
	
	
	private boolean checkUser(String id) {
		users = getUsers();
		for (UserDTO user : users) {
			if (id.equals(user.getId())) {
				System.out.println("중복 id");
				return false;
			}
		}
		return true;
	}
	
}
