package sugang.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.service.StudentService;
import sugang.service.impl.StudentServiceImpl;
import sugang.vo.Student;

/**
 * Servlet implementation class StudentInputServlet
 */
@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 요청파라미터 조회
		request.setCharacterEncoding("UTF-8");// 요청 파라미터 한글처리. - TODO 나중에 필터처리
		int result;
		try {
			Student student = (Student)request.getAttribute("student");
			
			StudentServiceImpl service = StudentServiceImpl.getInstance();
			result = service.addStudent(student);
			
		//2. 응답
			//처리결과를 requestScope에 저장
			request.setAttribute("result", result);
			//Redirect방식으로 xxx.jsp로 이동
			response.sendRedirect("");//TODO 이동할 url - xxx.jsp
		}catch(DuplicatedIdException e){
			request.setAttribute("error_message", "등록불가 : 해당 학번의 학생이 이미 존재합니다.");
			
		}
		
		
	}

}
