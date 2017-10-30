package session.stacknum;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RemoveStackNumberServlet
 */
@WebServlet("/stacknums/removenums")
public class RemoveStackNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 누적된 숫자 제거 
	 * 기본흐름 
	 * 1. 로그인 여부 체크 
	 * 2. 누적된 숫자 제거 - session을 없애는게 아니라 ArrayList에 들어있는 값을 없애는 것. 
	 * 3. show_numbers.jsp
	 * 
	 * 예외흐름 
	 * 1-a : 로그인을 하지 않은 경우
	 * 	 - login_form.jsp로 이동
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. HttpSession을 조회
		HttpSession session = request.getSession();
		// 2. 로그인 여부 체크 - x : login_form.jsp로 이동
		if (session.getAttribute("loginMember") == null) {
			request.setAttribute("errorMessage", "로그인을 해야 가능합니다.");
			request.getRequestDispatcher("/login/login_form.jsp").forward(request, response);
			return;
		}
		
		session.removeAttribute("numberList");
//		session.setAttribute("numberList", null);
		/*ArrayList<Integer> numberList = (ArrayList<Integer>) session.getAttribute("numberList");
		numberList.removeAll(numberList);*/
	
		//응답
		request.getRequestDispatcher("/stacknums/show_numbers.jsp").forward(request, response);
				
	}

}
