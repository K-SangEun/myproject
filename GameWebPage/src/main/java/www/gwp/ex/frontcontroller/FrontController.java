package www.gwp.ex.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import www.gwp.ex.boardCommand.IndexCommand;
import www.gwp.ex.boardCommand.ListCommand;
import www.gwp.ex.boardCommand.PostOKCommand;
import www.gwp.ex.boardCommand.ViewCommand;
import www.gwp.ex.command.Command;
import www.gwp.ex.memberCommand.JoinCommand;
import www.gwp.ex.memberCommand.LoginCommand;
import www.gwp.ex.memberCommand.ModifyCommand;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String requestURI = request.getRequestURI();
		System.out.println("requestURI " + requestURI);
		String commandName = request.getServletPath();
		System.out.println("servletPath " +  commandName);
		String viewPage = null;
		Command command = null;
		int flag = 0;
		
		if(commandName.equals("/index.do")) {
			command = new IndexCommand();
			command.excute(request, response);
			viewPage = "index.jsp";
			flag=1;
		} else if(commandName.equals("/member/login.do")) {
			viewPage="login.jsp";
		}  else if(commandName.equals("/member/loginOK.do")) {
			command = new LoginCommand();
			command.excute(request, response);
			viewPage = "../index.do";
		} else if(commandName.equals("/member/join.do")) {
			viewPage = "join.jsp";
		} else if(commandName.equals("/member/joinOK.do")) {
			command = new JoinCommand();
			command.excute(request, response);
			viewPage = "login.jsp";
		} else if(commandName.equals("/member/modify.do")){
			viewPage = "modify.jsp";
		} else if(commandName.equals("/member/modifyOK.do")) {
			command = new ModifyCommand();
			command.excute(request, response);
			viewPage = "../index.do";
		} else if(commandName.equals("/logout.do")) {
			request.getSession().invalidate();
			viewPage = "index.do";
		} else if(commandName.equals("/game/list.do")) {
			command = new ListCommand();
			command.excute(request, response);
			viewPage = "list.jsp";
			flag=1;
		} else if(commandName.equals("/game/view.do")) {
			command = new ViewCommand();
			command.excute(request, response);
			viewPage = "view.jsp";
			flag=1;
		} else if(commandName.equals("/game/post.do")) {
			viewPage="post.jsp";
		} else if(commandName.equals("/game/postOK.do")) {
			command = new PostOKCommand();
			command.excute(request, response);
			viewPage = "../index.do";
		}
		
		
		if (flag==0) {
			response.sendRedirect(viewPage);
		} else if (flag==1) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
