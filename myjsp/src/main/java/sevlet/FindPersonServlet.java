package sevlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Person;

/**
 * Servlet implementation class FindPersonServlet
 */
@WebServlet("/findPerson")
public class FindPersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 요청파라미터 조회
		String name = request.getParameter("name");
		//2. Business Logic - Model호출 : 이름으로 사람을 찾는 메소드
		Person result = new Person(name, 20, 175, false);
				
		
		//3. 응답 - View호출 : response1.jsp
		request.setAttribute("result", result);
		request.getRequestDispatcher("/actiontag/response1.jsp").forward(request, response);
	}

}
