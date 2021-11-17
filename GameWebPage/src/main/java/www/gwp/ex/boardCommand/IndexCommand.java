package www.gwp.ex.boardCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import www.gwp.ex.command.Command;
import www.gwp.ex.dao.BoardDAO;
import www.gwp.ex.dto.BoardDTO;

public class IndexCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = BoardDAO.getBoardDAO();
		BoardDTO[] dto = new BoardDTO[6];
		BoardDTO topdto = new BoardDTO();
		String[] tag = {"action", "adventureCasual", "rolePlaying", "sportsRacing", "simulation", "strategy"};
		for(int i=0;i<6;i++) {
			dto[i] = dao.indexTagDAO(tag[i]);
		}
		topdto = dao.topDTO();
		request.setAttribute("action", dto[0]);
		request.setAttribute("adventureCasual", dto[1]);
		request.setAttribute("rolePlaying", dto[2]);
		request.setAttribute("sportsRacing", dto[3]);
		request.setAttribute("simulation", dto[4]);
		request.setAttribute("strategy", dto[5]);
		request.setAttribute("topdto", topdto);
	}

}
