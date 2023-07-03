package cash.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/calendarController")
public class CalendarController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//session 인증 검사
		
		//view에 넘겨줄 달력정보(모델값)
		//사용자->보고싶은 연도와 월이 넘어온다
		//int targetYear = Integer.parseInt(request.getParameter("targetYear"));
		//int targetMonth = Integer.parseInt(request.getParameter("targetMonth"));
		
		
		Calendar firstDay = Calendar.getInstance();
		/*
		 * 월 1일을 넘김
		 * 해당하는 날짜의 요일을 알아냄
		 */
		//출력하고자하는 녀도,월,일의 기본값은 이번달 1일
		//위 값(츌력하고자하는 년도와 월)이 안 넘어오면 오늘 날짜가 나온다
		int targetYear = firstDay.get(Calendar.YEAR);
		int targetMonth = firstDay.get(Calendar.MONTH);
		//달력출력시 시작 공백수 계산하기 위해 -> 오늘이 무슨 요일인지
		firstDay.set(Calendar.DATE, 1);
		
		if(request.getParameter("targetYear") != null 
				&& request.getParameter("targetMonth") != null) {
			targetYear = Integer.parseInt(request.getParameter("targetYear"));
			targetMonth = Integer.parseInt(request.getParameter("targetMonth"));
			//api를 통해 Calendar.MONTH에 12가 들어오면 -> 월이 1이 되고 연도는 +1이 된다
			//api를 통해 Calendar.MONTH에 -1이 들어오면 -> 월이 12이 되고 연도는 -1이 된다
			firstDay.set(Calendar.YEAR, targetYear);
			firstDay.set(Calendar.MONTH, targetMonth);
		}

		

		//일요일->1, 토요일->7
		//1일 날짜의 요일을-1		
		int beginBlank = firstDay.get(Calendar.DAY_OF_WEEK)-1;
		System.out.println(beginBlank+"<-beginBlank");
		
		//출력되는 월의 마지막날짜
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

		request.setAttribute("targetYear", targetYear);
		request.setAttribute("targetMonth", targetMonth);
		request.setAttribute("beginBlank", beginBlank);
		request.setAttribute("lastDate", lastDate);
		request.setAttribute("totalCell", totalCell);
		request.setAttribute("endBlank", endBlank);
		
		request.getRequestDispatcher("/WEB-INF/view/calendar.jsp").forward(request, response);

	}




}
