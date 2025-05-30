package control;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CommandProcess;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

/**
 * Servlet implementation class controller
 */
@WebServlet("/controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Map<String, Object> commandMap = new HashMap<String, Object>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    
    // public void init(ServletConfig config)  > config는 web.xml에 있다
	public void init(ServletConfig config) throws ServletException {
		
		
		// web.xml에서 propertyConfig에 해당하는 init-param 의 값을 읽어옴
		String props = config.getInitParameter("config");
		System.out.println("1. init String props => " + props);
												// /WEB-INF/command.properties
		// Map 계열
		// Properties는 .properties 파일을 
		// 자바에서 Map처럼 다룰 수 있게 해주는 클래스
		Properties pr = new Properties();
		FileInputStream f = null;
		
		String configFilePath = config.getServletContext().getRealPath(props);
		System.out.println("2. inint String configFilePath => " + configFilePath);
												// meta data
		
		try {
				// 파일로 만들었다 configFilePath는 사실 WEB-INF / command.properties
			f = new FileInputStream(configFilePath);
				// getRealPath 사용하여 통째로 파일로 읽어야 배포할 때 문제 안생긴다
			
				// 파일이 (버퍼)메모리에 올라간다  , Memory Up
			pr.load(f);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				f.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println("IOException e.getMessage() -> " + e.getMessage());
			}
		}		
				// 파일로 만들어야 읽는다?
				// 파일 메모리에 들어간 값 -->> /list.do=service.ListAction
				//                       /writeForm.do=service.WriteFormAction
				// keyIter -> { /list.do , /writeForm.do }  keyset으로 키만 들어감
		Iterator keyIter = pr.keySet().iterator();
		
		while(keyIter.hasNext()) {
			String command = (String) keyIter.next();
			String className = pr.getProperty(command);
			// 그 클라스 이름이 service.ListAction
			System.out.println("3. init command => " + command);
			System.out.println("4. init className => " + className);
			// 위까지 키와 값을 뽀사놨다
			// 나눈 후 하고 싶은건
			// ListAction listAction = new ListAction();
			// WriteFormAction writeFormAction = new WriteFormAction();
			try {
				//해당 문자열(className=>service.ListAction)을 클래스로 만든다.
				Class<?> commandClass = Class.forName(className);
				// 만든 클래스를 인스턴스로 만들어준다
				CommandProcess commandInstance = (CommandProcess) commandClass.getDeclaredConstructor().newInstance();
				
				//            		list.do(여긴 String)    service.ListAction(인스턴스가 되어 들어간다, 객체라 주소가 들어간다)
				//              writeForm.do  sservice.WriteFormAction
				commandMap.put(command, commandInstance);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자에서 get / post 로 불르던 requestServletPro 가 실행된다
		requestServletPro(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자에서 get / post 로 불르던 requestServletPro 가 실행된다
		requestServletPro(request, response);
	}
	
	protected void requestServletPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String			view = null;
		CommandProcess	com	 = null;
		String 		command  = request.getRequestURI();
		System.out.println("1-1. requestServletPro URI command=> " + command);
		command = command.substring(request.getContextPath().length());
		System.out.println("2. requestServletPro command subString=> " + command);
		
		try {
			com = (CommandProcess) commandMap.get(command);
		System.out.println("4. requestServletPro com => " + com);
		view = com.requestePro(request, response);
		System.out.println("5. requestServletPro view => " + view);   // /ch16/com
		//	StringBuffer	
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

}
