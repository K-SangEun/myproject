package www.gwp.ex.memberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import www.gwp.ex.command.Command;
import www.gwp.ex.dao.MemberDAO;
import www.gwp.ex.dto.MemberDTO;

public class LoginCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = MemberDAO.getMemberDAO();
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		HttpSession session = request.getSession();
		session.setAttribute("userInfo", dao.memberLoginDAO(dto));
	}

}
