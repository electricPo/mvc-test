package cash.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cash.model.CashbookDao;
import cash.vo.Cashbook;
import cash.vo.Member;


@WebServlet("/cashbook")
public class CashbookController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//session 인증 겁사 코드
		//HttpSession session = request.getSession();
		//if(session.getAttribute("loginMember") == null) {
		//	response.sendRedirect(request.getContextPath()+"/login");
		//	return;
		//}
		//Member member = (Member) session.getAttribute("loginMember");
		
		String memberId = "user1";

		//요청한 파라미터로부터 연도/월/일을 가져오기
		int targetYear = Integer.parseInt(request.getParameter("targetYear"));
		int targetMonth = Integer.parseInt(request.getParameter("targetMonth"));
		int targetDate = Integer.parseInt(request.getParameter("targetDate"));
		
		//지정 날짜에 해당하는 가계부 목록을 조회
		List<Cashbook>list=new CashbookDao().selectCashbookListByDate(memberId, targetYear, targetMonth + 1, targetDate);
		
		//조회된 가계부 목록과 목표 날짜를 request에 저장
		request.setAttribute("targetYear", targetYear);
		request.setAttribute("targetMonth", targetMonth);
		request.setAttribute("targetDate", targetDate);
		request.setAttribute("list", list);
		
		//달력에 가계부 목록의 값을 설정
		// /cashbook 경로로 get 요청이 들어올 때 해당 날짜에 대한 가계부 목록을 조회 -> 결과를 cashbook.jsp 에 전달해 출력
		request.getRequestDispatcher("/WEB-INF/view/cashbook.jsp").forward(request, response);

	}
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		}

	
}
