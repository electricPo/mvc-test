package cash.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cash.model.MemberDao;
import cash.vo.Member;

/**
 * Servlet implementation class MemberOneController
 */
@WebServlet("/memberOne")
//
public class MemberOneController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//session 유효성 겁사 + 값 받아오기(id)
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		//모델값 구하기(dao 메서드 호출)
		MemberDao memberDao = new MemberDao();
		Member member = memberDao.selectMemberOne(loginMember.getMemberId());
		
		//member 출력하는(포워딩대상)memberOne.jsp에도 공유되어야 한다
		//request가 공유되니까 request안에 넣어서 공유한다
		request.setAttribute("member", member);
		
;		//memberOne.jsp를 포워딩
		request.getRequestDispatcher("/WEB-INF/view/memberOne.jsp").forward(request, response);
	}


}
