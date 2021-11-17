package www.gwp.ex.boardCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import www.gwp.ex.command.Command;
import www.gwp.ex.dao.BoardDAO;
import www.gwp.ex.dto.BoardDTO;

public class ViewCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = BoardDAO.getBoardDAO();
		BoardDTO dto = new BoardDTO();
		dto.setB_num(Integer.parseInt(request.getParameter("b_num")));
		dao.viewDAO(dto);
		request.setAttribute("dto", dto);
	}

}
