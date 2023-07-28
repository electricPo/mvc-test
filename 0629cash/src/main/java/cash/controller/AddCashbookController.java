package cash.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cash.model.*;
import cash.vo.*;


@WebServlet("/addCash")
public class AddCashbookController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 세션 불러오기
		HttpSession session = request.getSession();
		if(session.getAttribute("loginMember") == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		// 파라미터 유효성 검사
		if(request.getParameter("cashbookDate") == null) {
			response.sendRedirect(request.getContextPath()+"/calendar");
			return;
		}

		request.getRequestDispatcher("/WEB-INF/view/cashbook.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 세션 불러오기
		HttpSession session = request.getSession();
		if(session.getAttribute("loginMember") == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		
		request.setCharacterEncoding("utf-8");
		Member member = (Member) session.getAttribute("loginMember");
		
		int targetYear = Integer.parseInt(request.getParameter("targetYear"));
		int targetMonth = Integer.parseInt(request.getParameter("targetMonth"));
		int targetDate = Integer.parseInt(request.getParameter("targetDate"));
		String cashbookdate = targetYear + "-" + targetMonth + "-" + targetDate ;
		
		// 유효성검사 
		if(request.getParameter("price") == null 
			|| request.getParameter("memo") == null) {
			response.sendRedirect(request.getContextPath() + "/cashbook?targetYear=" + targetYear + "&targetMonth=" + targetMonth + "&date=" + targetDate);
			return;
		}
		
		
		
		String category = request.getParameter("category");
		int price = Integer.parseInt(request.getParameter("price"));
		String memo = request.getParameter("memo");
		// 메모에 해시태그 중복 및 내용없는 해시태그 제거
		String rememo = memo.replace("#", " #");
		memo = "";
		for(String w : rememo.split(" ")) {
			if(w.startsWith("#")) {
				String word = w.replace("#", "");
				if(word.length() > 0) {
					memo +="#" + word + " ";
				}
			} else {
				memo += w + " ";
			}
		}
		
		Cashbook cashbook = new Cashbook();
		
		cashbook.setMemberId(member.getMemberId());
		cashbook.setCategory(category);
		cashbook.setCashbookDate(cashbookdate);
		cashbook.setPrice(price);
		cashbook.setMemo(memo);
		
		CashbookDao cashbookDao = new CashbookDao();
		int cashbookNo = cashbookDao.insertCashbook(cashbook);
		
		if(cashbookNo == 0) {
			System.out.println("입력 실패");
			response.sendRedirect(request.getContextPath() + "/cashbook?cashbookDate="+cashbook.getCashbookDate());
			return;
		}
		

		HashtagDao hashtagDao = new HashtagDao();
		// 입력 성공 시 해시태그 존재 여부 확인
		// 해시태그 있을 경우 추출하여 데이터베이스에 입력
		for(String w : memo.split(" ")) {
			if(w.startsWith("#")) {
				String word = w.replace("#", "");
				if(word.length() > 0) {
					Hashtag hashtag = new Hashtag();
					hashtag.setCashbookNo(cashbookNo);
					hashtag.setCashword(word);
					hashtagDao.insertHashtag(hashtag);
				}
			}
		}
		
		/*
		int targetYear = Integer.parseInt(cashbook.getCashbookDate().substring(0, 4));
		int targetMonth = Integer.parseInt(cashbook.getCashbookDate().substring(5, 7)) - 1;
		int targetDate = Integer.parseInt(cashbook.getCashbookDate().substring(8, 10));
		*/
		response.sendRedirect(request.getContextPath()+"/cashbook?targetYear="+targetYear+"&targetMonth="+targetMonth+"&targetDate="+targetDate);
	}

}
