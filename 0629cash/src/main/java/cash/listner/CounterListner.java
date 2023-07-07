package cash.listner;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import cash.service.CounterService;


@WebListener
public class CounterListner implements HttpSessionListener {
	private CounterService counterService;
    public void sessionCreated(HttpSessionEvent se)  { 
    	System.out.println(se.getSession().getId() + "의 새로운 세션이 생성되었습니다.");
    	
		//현재접속자수 +1 -> applicateion.attribute (톰캣켤때 초기화시켜야함-> boot)
		//현재세션에서 세션이벤트getServletContext를 불러온다
		ServletContext application = se.getSession().getServletContext();
		int currentCounter = (Integer)application.getAttribute("currentCounter");
		application.setAttribute("currentCounter", currentCounter+1);
		
		//오늘접속자수 +1 -> DB
		this.counterService = new CounterService();
		
		//오늘 카운트 수를 호출한다 -> 카운트가 없을시 if문
		counterService.getCounter();
		int counter = counterService.getCounter();
		if(counter == 0) {
			counterService.addCounter();
		} else {
			counterService.modifyCounter();
		}
		
    }

    public void sessionDestroyed(HttpSessionEvent se)  { 
    	System.out.println(se.getSession().getId()+ "새로운 세션이 소멸되었습니다.");
    	
        //현재접속자수 -1 -> applicateion.attribute
    	ServletContext application = se.getSession().getServletContext();
		int currentCounter = (Integer)application.getAttribute("currentCounter");
		application.setAttribute("currentCounter", currentCounter-1);
    }
	
}