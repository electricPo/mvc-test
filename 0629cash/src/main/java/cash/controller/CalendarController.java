package cash.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import cash.model.CashbookDao;
import cash.model.HashtagDao;
import cash.model.MemberDao;
import cash.vo.Cashbook;
import cash.vo.Member;



@WebServlet("/calendar")
public class CalendarController extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 세션 불러오기
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginMember");
		String memberId = member.getMemberId();
		
		// 로그인 실패시 -> login doGet으로 보냄
		if (memberId == null) {
		    response.sendRedirect(request.getContextPath() + "/login");
		    return;
		}	

		//view에 넘겨줄 달력정보(모델값)
		Calendar today = Calendar.getInstance(); //오늘날짜
		Calendar firstDay = Calendar.getInstance(); //월의 1일
		/*
		 * 월 1일을 넘김
		 * 해당하는 날짜의 요일을 알아냄
		 */
		//출력하고자하는 년도,월,일의 기본값은 이번달 1일
		//위 값(츌력하고자하는 년도와 월)이 안 넘어오면 오늘 날짜가 나온다
		int targetYear = firstDay.get(Calendar.YEAR);
		int targetMonth = firstDay.get(Calendar.MONTH);
		int todayYear = today.get(Calendar.YEAR);
		int todayMonth = today.get(Calendar.MONTH);
		int todayDate = today.get(Calendar.DATE);
		
		//달력출력시 시작 공백수 계산하기 위해 -> 오늘이 무슨 요일인지
		firstDay.set(Calendar.DATE, 1);
		
		//출력하고자 하는 년도, 월이 매개값으로 넘어왔다면
		if(request.getParameter("targetYear") != null 
				&& request.getParameter("targetMonth") != null) {
			//api를 통해 Calendar.MONTH에 12가 들어오면 -> 월이 1이 되고 연도는 +1이 된다
			//api를 통해 Calendar.MONTH에 -1이 들어오면 -> 월이 12이 되고 연도는 -1이 된다
			firstDay.set(Calendar.YEAR, Integer.parseInt(request.getParameter("targetYear")));
			firstDay.set(Calendar.MONTH, Integer.parseInt(request.getParameter("targetMonth")));

		}
		
		

		
		//달력 출력시 시작 공백 개수를 계산
		//일요일->1 ... 토요일->7	
		int beginBlank = firstDay.get(Calendar.DAY_OF_WEEK)-1;
		System.out.println(beginBlank+"<-beginBlank");
		
		//출력되는 월의 마지막날짜 가져오기
		int lastDate = firstDay.getActualMaximum(Calendar.DATE);
		System.out.println(lastDate+"<-lastDate");
		
		//달력출릭시 마지막 날짜 출력 후 공백 개수
		//전체 출력 셀(totalCell)의 개수가 7로 나누어 떨어져야 한다
		int endBlank = 0;
		if(((beginBlank+lastDate)%7) != 0) {
			endBlank = 7 - ((beginBlank+lastDate)%7);
		}
		int totalCell = beginBlank+lastDate+endBlank;
		System.out.println(totalCell+" <- totalCell");
		System.out.println(endBlank+" <- endBlank");
		
		//달력을 출력하는 뷰
		//넘길 값을 request에 담아서 view 에 넘긴다
		//묶어서 넘기느냐? 개별적으로 넘기느냐? -> request에 넘길 땐 지금은 개별로 보낸다(가독성)
		targetYear = firstDay.get(Calendar.YEAR);
		targetMonth = firstDay.get(Calendar.MONTH);
		
		//모델을 호출해 해당 월의 수입/지출 데이터를 가져온다
		CashbookDao cashbookDao = new CashbookDao();
		List<Cashbook> list = cashbookDao.selectCashbookListByMonth(member.getMemberId(), targetYear, targetMonth + 1);
		List<Map<String,Object>> htList = new HashtagDao().selectWordCountByMonth(member.getMemberId(), targetYear, targetMonth +1);
		System.out.println(htList.size() +"<-htList.size");
		System.out.println(targetMonth+"targetMonth");
		
		//모델값 구하기(dao 메서드 호출)
		MemberDao memberDao = new MemberDao();
		Member loginMember = memberDao.selectMemberOne(member.getMemberId());
		
		//뷰에 값을 전달하기 위해 request 설정하기
		request.setAttribute("member", member);
		request.setAttribute("endBlank", endBlank);
		request.setAttribute("targetYear", targetYear);
		request.setAttribute("targetMonth", targetMonth);
		request.setAttribute("todayYear", todayYear);
		request.setAttribute("todayMonth", todayMonth);
		request.setAttribute("todayDate", todayDate);
		request.setAttribute("beginBlank", beginBlank);
		request.setAttribute("lastDate", lastDate);
		request.setAttribute("totalCell", totalCell);
		request.setAttribute("endBlank", endBlank);
		
		request.setAttribute("list", list);
		request.setAttribute("htList", htList);
		
		//달력을 출력하는 뷰로 포워딩하기
		request.getRequestDispatcher("/WEB-INF/view/calendar.jsp").forward(request, response);

	}




}
