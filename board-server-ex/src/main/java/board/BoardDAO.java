package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import user.UserDAO;
import user.UserDTO;

public class BoardDAO {

	private static BoardDAO instance = null;
	
	public static BoardDAO getInstance() {
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	private BoardDAO() {
	}
	

	private ArrayList<BoardDTO> brds = new ArrayList<BoardDTO>();
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // ??
			
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC";
			String id = "root";
			String pw = "mymySql00";
			
			conn = DriverManager.getConnection(url, id, pw);
			
			if(conn != null) {
				System.out.println("DB연동 성공!");
			}
			else {
				System.out.println("DB연동 실패!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public ArrayList<BoardDTO> getBoardList(){
		
		try {
			conn = getConnection();

			String sql = "select * from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			brds = new ArrayList<BoardDTO>();
			
			while(rs.next()) {
				int no = rs.getInt(1);
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String title = rs.getString(4);
				String contents = rs.getString(5);
				int likes = rs.getInt(6);
				Timestamp regDate = rs.getTimestamp(7);
				
				BoardDTO board = new BoardDTO(no, id, pw, title, contents, likes, regDate); 
				brds.add(board);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
			System.out.println("데이터 불러오기 완료");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터 불러오기 실패");
		}
		return brds;
	}
			
	public boolean boardWrite(String id, String title, String content) {
		try {
			conn = getConnection();
			UserDTO user = UserDAO.getInstance().getOneUser(id); 
			BoardDTO newPost = new BoardDTO(user.getId(), user.getPw(), title, content, new Timestamp(Calendar.getInstance().getTimeInMillis()));
			
			// 자동증가 뺴고 입력?
			String sql = "insert into board(id, pw, title, content, regdate) values(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPost.getId());
			pstmt.setString(2, newPost.getPw());
			pstmt.setString(3, newPost.getTitle());
			pstmt.setString(4, newPost.getContents());
			pstmt.setTimestamp(5, newPost.getRegDate());
			
			pstmt.executeUpdate();
			
			brds.add(newPost);
			
			System.out.println("게시물 작성 완료");
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 작성 실패");
			return false;
		}
	}
	
	public boolean updateBoard(BoardDTO dto) {
		try {
			
			brds = getBoardList();
			for(BoardDTO p : brds) {
				if(p.getNo() == dto.getNo()) {
					p.setTitle(dto.getTitle());
					p.setContents(dto.getTitle());
					break;
				}
			}
			
			conn = getConnection();
			String sql ="update board set title=?, content=? where no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContents());
			pstmt.setInt(3, dto.getNo());
			
			pstmt.executeUpdate();
			
			
			pstmt.close();
			conn.close();
			
			System.out.println("수정 성공!");
			return true;
		} catch (Exception e) {
			System.out.println("수정 실패!");
			e.printStackTrace();
		}
		return false;
	}
	
	// 회원 탈퇴시 관련 게시글 전체 삭제
	public boolean deleteAll(String id) {
		try {
			conn = getConnection();
			String sql = "delete from board where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
						
			System.out.println("게시물 삭제 성공");
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("삭제 실패");
		}
		return false;
	}
	
	public boolean deleteBoard(int no) {
		try {
			conn = getConnection();
			String sql = "delete from board where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
			System.out.println("게시물 삭제 성공");
			
			pstmt.close();
			conn.close();
			
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("삭제 실패");
		}
		return false;
	}
	
	// 내 게시물 아닐때만 노출
	public boolean plusLike(BoardDTO dto) {		
		try {
			int likes = (dto.getLikes() + 1);
			System.out.println("like: " + likes);

			conn = getConnection();
			String sql ="update board set likes=? where no=? ";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, likes);
			pstmt.setInt(2, dto.getNo());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			System.out.println("좋아요 +1");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("좋아요 유지");
		}
		return false;
	}
}
