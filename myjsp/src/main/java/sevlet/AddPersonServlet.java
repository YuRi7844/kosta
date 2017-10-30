package sevlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Person;

/**
 * Servlet implementation class AddPersonServlet
 */
@WebServlet("/addPerson")
public class AddPersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 요청파라미터 조회 *4
		Person person = (Person)request.getAttribute("person");
		
		
		//2. Business Logic - Model(BusinessService) add(Person)
		System.out.println(person);
		
		//3. 응답
		request.getRequestDispatcher("/actiontag/response2.jsp").forward(request, response);;
		
	}

}
