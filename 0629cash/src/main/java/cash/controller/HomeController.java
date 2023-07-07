package cash.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cash.service.CounterService;
import cash.vo.Member;

@WebServlet("/home")
public class HomeController extends HttpServlet {

	//service 초기화
	private CounterService counterService = new CounterService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 세션 불러오기
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginMember");
		
		//로그인 실패시 -> login doGet으로 보냄
		if(session.getAttribute("loginMember") == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		
		
		this.counterService = new CounterService();
		
		int counter = counterService.getCounter();
		int totalCounter = counterService.getCounterAll();
		//currentCounter -> countListner의 application
		int currentCounter = (int) getServletContext().getAttribute("currentCounter");
		
		System.out.println(counter +"<-counter / home");
		System.out.println(totalCounter +"<-totalCounter / home");
		
	    request.setAttribute("counter", counter);
	    request.setAttribute("totalCounter", totalCounter);
	    request.setAttribute("currentCounter", currentCounter);

		//어플리케이션은 jsp에서 호출 가능하다
		request.getRequestDispatcher("/WEB-INF/view/home.jsp").forward(request, response);
		
	}

	
}
