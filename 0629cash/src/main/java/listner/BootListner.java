package listner;

import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.tomcat.util.net.ApplicationBufferHandler;

@WebListener
public class BootListner implements ServletContextListener {
	/*톰캣이 켜지면 실행된다
	 * ->이 경우 여러 프로젝트가 톰캣아래 존재하면 다른 프로젝트 리스너가 켜질 수 있다
	 * ->이를 방지하기 위해 다른 워크스페이스로 세팅하거나 톰켓의 다른 프로젝트를 리무브한다
	 * ->이 프로젝트에선 리스너에 db class.forName()을 올리는 것으로 한다
	 */
    public void contextInitialized(ServletContextEvent sce)  { 
    	System.out.println("리스너 실행 확인 : ServletContextListener.contextInitialized");
    	//application 속성 영역의 "currentCounter" 속성변수를 초기화 한다
    	//이 이벤트 객체의 주인 -> sce
    	ServletContext application = sce.getServletContext(); //->애플리케이션
    	application.setAttribute("currentCounter", 0);
    	
    	try {
    		Class.forName("org.mariadb.jdbc.Driver");
    	} catch(ClassNotFoundException e) {
    		System.out.println("드라이버 로딩 실패");
    		e.printStackTrace();
    	}
         System.out.println("드라이버 로딩 성공");
    }
	
}
