package session.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exception.LoginFailException;
import vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 요청파라미터 조회
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		try {
			//2. Business logic 처리 - Model을 호출(MVC개념)
			Member member = authenticate(id, password);
			//인증성공 - 로그인 처리 : HttpSession생성 + 로그인 여부 체크 속성추가.
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", member);
		
			//3. 처리결과 응답.
			request.getRequestDispatcher("/login/login_success.jsp").forward(request, response);
			
		}catch(LoginFailException e) {
			//인증 실패
			//3. 처리결과(실패결과) 응답.
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/login/login_form.jsp").forward(request, response);
		}
	}
	
	
	/*
	 * 회원 인증(로그인) 처리하는 메소드
	 * 	=> MemberService(Business Service)에 있는 메소드.
	 * 
	 * 기본흐름
	 * 	1. 매개변수로 받은 ID와 패스원드가 회원데이터 베이스에 있는지 확인.
	 * 	2. 회원정보를 리턴한다.
	 * 
	 * 오류흐름
	 * 	2-1. 회원정보가 틀리면 예외를 던진다.
	 * 
	 * 
	 * 
	 * 원래는 MemberService를 따로 만들고 구현해야한다.
	 */
	public Member authenticate(String id, String password) throws LoginFailException{
		
//		String dbId="java", dbPwd = "servlet";
		//원래는 아래와 같이 DB에서 받아와야 한다.
		//Member member = memberDao.selectMemberById(id);
		//select id, password, name, email, from member where id =?
		Member member = null;//없는 ID
		member = new Member(id, "servlet", "김회원", "kim@a.com");//id가 있다.
		
		if(member != null) {//있는 ID
			if(password.equals(member.getPassword())) {
				//인증 성공
				return member;
			}else {//ID는 맞고 PW는 틀린 경우 - 인증실패
				throw new LoginFailException("패스워드를 확인하세요");
			}
		}else {//없는 ID, 틀린
			throw new LoginFailException("ID를 확인하세요.");
		}
	}
	
	

}
