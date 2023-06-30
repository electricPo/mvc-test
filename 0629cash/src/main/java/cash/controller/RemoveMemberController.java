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


@WebServlet("/removeMember")
public class RemoveMemberController extends HttpServlet {

	//비밀번호 입력 폼
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/removeMember.jsp").forward(request, response);
		//HttpSession session = request.getSession();
	    //Member loginMember = (Member) session.getAttribute("loginMember");
		
		//MemberDao memberDao = new MemberDao();
		//Member member = memberDao.selectMemberOne(loginMember.getMemberId());
		//request.setAttribute("member", member);
	}
	
	// 탈퇴
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션 유효성 검사 id pw 받아오기
        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");
        //System.out.println(loginMember);
        System.out.println(loginMember.getMemberId());
        

        // 모델값 구하기
        //Member removeMember = new Member();
        MemberDao memberDao = new MemberDao();
        // Member member = memberDao.selectMemberOne(loginMember.getMemberPw());

        // 비밀번호 확인
        String memberId = loginMember.getMemberId();
        String memberPw = request.getParameter("memberPw");
        
        System.out.println(memberPw + "<-removeMemberController loginMember.getMemberPw()");
      

            // 회원 삭제
            int row = memberDao.removeMember(memberId, memberPw);
            System.out.println(row);
            if (row == 1) {
                // 세션 무효화
                session.invalidate();
            
                // 삭제 완료 후 리다이렉트
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                // 비밀번호가 일치하지 않을 경우 오류 페이지로 리다이렉트
                response.sendRedirect(request.getContextPath() + "/removeMember");
            }
        }
    

}