package cash.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cash.model.MemberDao;
import cash.vo.Member;

@WebServlet("/addMember")
public class AddMemberController extends HttpServlet {

    //addMember.jsp 회원가입폼
	@Override   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//session 유효성검사->로그인 안 된 상태(null)
		
		//jsp페이지로 포워드(디스패치)
		request.getRequestDispatcher("/WEB-INF/view/addMember.jsp").forward(request, response);
	}
	
	
	//회원가입액션
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//session 유효성검사->로그인 안 된 상태(null)
		
		//reqest.getParameter()
		//addmember.jsp에서 넘어온 id pw 값을 다시 member에 저장한다
		Member member = new Member();
			String id = request.getParameter("addMemberId");
			String pw = request.getParameter("addMemberPw");
			member.setMemberId(id);
			member.setMemberPw(pw);
		
		//회원가입 dao 호출
		MemberDao memberDao = new MemberDao();
		int row = memberDao.insertMember(member);
		if(row==0) { //실패시
			response.sendRedirect(request.getContextPath()+"/addMember");
			System.out.println("실패");
		} else if(row==1) { //성공시
			response.sendRedirect(request.getContextPath()+"/login");
			System.out.println("실패");
		} else {
			System.out.println("add memeber error!");
			
		}
		
		//회원가입 성공->login.jsp view로 이동하는 contoller를 리다이렉트
		//response.sendRedirect(request.getContextPath()+"/login");
		
	}

}
