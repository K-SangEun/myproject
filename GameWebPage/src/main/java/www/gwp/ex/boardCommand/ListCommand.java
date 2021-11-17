package www.gwp.ex.boardCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import www.gwp.ex.command.Command;
import www.gwp.ex.dao.BoardDAO;
import www.gwp.ex.dto.BoardDTO;

public class ListCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = BoardDAO.getBoardDAO();
		BoardDTO dto = new BoardDTO();
		int curPage = 0;
		String tag = request.getParameter("tag");
		//dto.setTag(request.getParameter("tag"));
		if(request.getParameter("curPage") != null)
			curPage = Integer.parseInt(request.getParameter("curPage"));
		ArrayList<BoardDTO> toplist = dao.listDAO(curPage, tag);
		int totalPage = dao.calTotalPage();
		System.out.println("totalPage " + totalPage);
		System.out.println("tag "+dto.getTag());
		request.setAttribute("toplist", toplist);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("tag", tag);
	}

}
