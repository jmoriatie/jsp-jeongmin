package controller.action.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.action.Action;
import model.dao.BoardDAO;
import model.dto.BoardDTO;

public class BoardUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noString = request.getParameter("no");
		int no = Integer.parseInt(noString);
		
		String pw = request.getParameter("pw");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDAO dao = BoardDAO.getInstance();
		// 비밀번호 맞는지 확인 전까진 임시객체
		BoardDTO post = dao.getOnePost(no);
		
		// 데이터 처리
		post.setTitle(title);
		post.setContents(content);
		
		String url = "";
		if(post.getPw().equals(pw)){
			dao.updateBoard(post);
			url= "service?command=boardView&no="+no;
		}
		else{
			url= "service?command=boardUpdateForm&no="+no;
		}
		System.out.println("url: " + url);
		request.getRequestDispatcher(url).forward(request, response);
	}
}
