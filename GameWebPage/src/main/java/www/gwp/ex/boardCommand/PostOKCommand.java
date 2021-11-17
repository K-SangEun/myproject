package www.gwp.ex.boardCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import www.gwp.ex.command.Command;
import www.gwp.ex.dao.BoardDAO;
import www.gwp.ex.dto.BoardDTO;

public class PostOKCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = BoardDAO.getBoardDAO();
		BoardDTO dto = new BoardDTO();
		MultipartRequest multi = null;
		String realPath = request.getSession().getServletContext().getRealPath("/game/img");
		int sizeLimit = 15*1024*1024;
		multi = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		dto.setTitle(multi.getParameter("title"));
		dto.setImgSrc("img/"+multi.getFilesystemName("imgSrc"));
		dto.setsIntro(multi.getParameter("sIntro"));
		dto.setPrice(Integer.parseInt(multi.getParameter("price")));
		dto.setTag(multi.getParameter("tag"));
		dto.setlIntro(multi.getParameter("lIntro"));
		dao.postOKDAO(dto);
	}

}

