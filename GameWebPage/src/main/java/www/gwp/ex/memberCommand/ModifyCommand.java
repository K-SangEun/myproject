package www.gwp.ex.memberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import www.gwp.ex.command.Command;
import www.gwp.ex.dao.MemberDAO;
import www.gwp.ex.dto.MemberDTO;

public class ModifyCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = MemberDAO.getMemberDAO();
		MemberDTO dto = new MemberDTO();
		HttpSession session = request.getSession();
		
		dto.setPw(request.getParameter("pw"));
		dto.setEmail(request.getParameter("email"));
		dao.memberModifyDAO(dto);
		
		session.setAttribute("userInfo", dto);
	}

}
